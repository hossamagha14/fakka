import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fakka/Model/payment_by_date_model.dart';
import 'package:fakka/Model/payment_history_model.dart';
import 'package:fakka/Model/user_name_model.dart';
import 'package:fakka/View%20Model/Bottom%20navigation%20bar/bottom_nav_bar_states.dart';
import 'package:fakka/View/Reusable/colors_paddings.dart';
import 'package:fakka/View/Screens/cards.dart';
import 'package:fakka/View/Screens/home.dart';
import 'package:fakka/View/Screens/send_money.dart';
import 'package:fakka/View/Screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../Model/notifications_model.dart';
import '../../Model/user_model.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarStates> {
  BottomNavBarCubit() : super(BottomNavBarIntialState());

  static BottomNavBarCubit get(context) => BlocProvider.of(context);
  int screenIndex = 0;
  UserModel? userModel;
  bool showCVC = false;
  bool showCardNumber = true;
  UserModel? recieverUserModel;
  UserNameModel? userNameModel;
  PaymentHistoryModel? paymentHistoryModel;
  String date = '2';
  String? qrCodeUserName;
  List<PaymentByDateModel> paymentByDateModelList = [];
  PaymentByDateModel? paymentByDateModel;
  List<Widget> screens = [
    const HomeScreen(),
    const CardsScreen(),
    const SettingsScreen()
  ];

  changeScreen(int index) {
    screenIndex = index;
    emit(BottomNavBarChangePageState());
  }

  showMyCVC() {
    showCVC = !showCVC;
    emit(BottomNavBarShowCVCState());
  }

  showMyCardNumber() {
    showCardNumber = !showCardNumber;
    emit(BottomNavBarShowCardNumbertate());
  }

  updatePin(context, String newPin) {
    FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .update({'Card password': newPin}).then((value) {
      emit(BottomNavBarChangePinSuccessState());
      getUser(context);
    }).catchError((onError) {
      emit(BottomNavBarChangePinFailState());
    });
  }

  lockCard(context) {
    FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .update({'Locked': !userModel!.cardIsLocked}).then((value) {
      getUser(context);
    }).catchError((onError) {
      emit(BottomNavBarLockCardFailState());
    });
  }

  getUser(context) {
    date = '';

    paymentByDateModelList = [];
    FirebaseFirestore.instance.collection('Users').doc(uid).get().then((value) {
      userModel = UserModel.fromJson(value.data()!);
      print(DateFormat('dd / MM').format(DateTime.now()));
      print(userModel!.birthday!.substring(0,7));
      for (int i = 0; i < userModel!.payments.length; i++) {
        if (date != userModel!.payments[i].date) {
          date = userModel!.payments[i].date!;
          paymentByDateModel = PaymentByDateModel(date: date);
          paymentByDateModel!.paymentsHistory.add(userModel!.payments[i]);
          paymentByDateModelList.add(paymentByDateModel!);
        } else {
          paymentByDateModel!.paymentsHistory.add(userModel!.payments[i]);
        }
      }
      if (userModel!.birthday!.substring(0, 7) ==
          DateFormat('dd / MM').format(DateTime.now())) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              color: Colors.white,
              child: const Text('your birthday'),
            ),
          ),
        );
      }
      emit(BottomNavBarGetSuccessState());
    }).catchError((onError) {
      emit(BottomNavBarGetFailState());
    });
  }

  sendMoney(context,
      {required double recievedMoney,
      required String senderUserName,
      required double paidMoney,
      required String recieverUserName}) {
    emit(BottomNavBarLoadingState());
    FirebaseFirestore.instance
        .collection('User names')
        .doc(recieverUserName)
        .get()
        .then((value) {
      userNameModel = UserNameModel.fromJson(value.data()!);
      getRecieverUser(context,
          moneyUsedInTheTransaction: recievedMoney,
          recieverUid: userNameModel!.uid!,
          paidMoney: paidMoney,
          recieverUsername: recieverUserName,
          recievedMoney: recievedMoney,
          senderUsername: senderUserName);
    }).catchError((onError) {
      emit(BottomNavBarGetRecieverFailState());
    });
  }

  putMoneyInRecieverPocket(context,
      {required String reciverUid,
      required double recievedMoney,
      required double moneyUsedInTheTransaction,
      required String senderUsername,
      required String image,
      required double paidMoney,
      required String recieverUsername}) {
    FirebaseFirestore.instance
        .collection('Users')
        .doc(userNameModel!.uid)
        .update({
      'Recieved money': recievedMoney,
      'payments': FieldValue.arrayUnion([
        PaymentHistoryModel(
                name: senderUsername,
                time: TimeOfDay.now().format(context).toString(),
                sent: 0,
                date: DateFormat('EEEE, d MMM').format(DateTime.now()),
                image: userModel!.image,
                recieved: moneyUsedInTheTransaction)
            .toJson()
      ])
    }).then((value) {
      takeMoneyFromUser(context,
          moneyUsedInTheTransaction: moneyUsedInTheTransaction,
          paidMoney: paidMoney,
          image: image,
          senderUsername: senderUsername,
          recieverUsername: recieverUsername);
    }).catchError((onError) {
      emit(BottomNavBarSendMoneyFailState());
    });
  }

  takeMoneyFromUser(context,
      {required double paidMoney,
      required String senderUsername,
      required String image,
      required double moneyUsedInTheTransaction,
      required String recieverUsername}) {
    FirebaseFirestore.instance.collection('Users').doc(uid).update(
      {
        'Paid money': paidMoney,
        'payments': FieldValue.arrayUnion([
          PaymentHistoryModel(
                  name: recieverUsername,
                  image: image,
                  date: DateFormat('EEEE, d MMM').format(DateTime.now()),
                  time: TimeOfDay.now().format(context).toString(),
                  sent: moneyUsedInTheTransaction,
                  recieved: 0)
              .toJson()
        ])
      },
    ).then((value) {
      getUser(context);
    }).catchError((onError) {
      emit(BottomNavBarSendMoneyFailState());
    });
  }

  getRecieverUser(context,
      {required String recieverUid,
      required double recievedMoney,
      required double moneyUsedInTheTransaction,
      required String senderUsername,
      required double paidMoney,
      required String recieverUsername}) {
    FirebaseFirestore.instance
        .collection('Users')
        .doc(recieverUid)
        .get()
        .then((value) {
      recieverUserModel = UserModel.fromJson(value.data()!);
      putMoneyInRecieverPocket(context,
          image: recieverUserModel!.image!,
          moneyUsedInTheTransaction: recievedMoney,
          reciverUid: userNameModel!.uid!,
          recievedMoney: recievedMoney + recieverUserModel!.recievedMoney,
          paidMoney: paidMoney,
          recieverUsername: recieverUsername,
          senderUsername: senderUsername);
    }).catchError((onError) {
      emit(BottomNavBarSendMoneyFailState());
    });
  }

  requestMoney(
      {required String reciever,
      required String requesterName,
      required String image,
      required double money}) {
    emit(BottomNavBarLoadingState());
    FirebaseFirestore.instance
        .collection('User names')
        .doc(reciever)
        .get()
        .then((value) {
      UserNameModel recievermodel = UserNameModel.fromJson(value.data()!);
      NotificationsModel notificationsModel = NotificationsModel(
          userName: requesterName,
          money: money,
          image: image,
          date: DateFormat('d/M').format(DateTime.now()));
      FirebaseFirestore.instance
          .collection('Users')
          .doc(recievermodel.uid)
          .update({
        'notifications': FieldValue.arrayUnion([notificationsModel.toJson()])
      });
      emit(BottomNavBarNotificationSuccessState());
    }).catchError((onError) {
      emit(BottomNavBarNotificationFailState());
    });
  }

  openNotification(int index) {
    FirebaseFirestore.instance.collection('Users').doc(uid).update(
        {'notifications.$index.opened': FieldValue.increment(1)}).then((value) {
      emit(BottomNavBarNotificationUpdateSuccessState());
    }).catchError((onError) {
      emit(BottomNavBarNotificationUpdateFailState());
    });
  }

  scanQrCode(context) async {
    qrCodeUserName = await FlutterBarcodeScanner.scanBarcode(
        '#5E41A5', 'Cancel', true, ScanMode.QR);
    if (qrCodeUserName != null && qrCodeUserName != '-1') {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SendMoneyScreen(
              type: 4,
              userName: qrCodeUserName,
            ),
          ));
    } else if (qrCodeUserName == '-1') {
      Navigator.pop(context);
    }
  }
}
