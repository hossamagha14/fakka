import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fakka/View%20Model/Sign%20up/sign_up_states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Model/user_model.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpIntialState());

  static SignUpCubit get(context) => BlocProvider.of(context);
  bool secure = true;
  bool confirmPassSecure = true;
  bool cardPassSecure = true;
  int? imageIndex;
  DateTime date = DateTime.now();
  int rnd1 = Random().nextInt(100) +
      Random().nextInt(100) +
      Random().nextInt(100) +
      4000;
  int rnd21 = Random().nextInt(100);
  int rnd22 = Random().nextInt(100);
  int rnd31 = Random().nextInt(100);
  int rnd32 = Random().nextInt(100);
  int rnd41 = Random().nextInt(100);
  int rnd42 = Random().nextInt(100);
  int cvc1 = Random().nextInt(9) + 1;
  int cvc2 = Random().nextInt(9) + 1;
  int cvc3 = Random().nextInt(9) + 1;
  String? imageString;
  List<String> avatars = [
    'assets/images/avatar1.png',
    'assets/images/avatar2.png',
    'assets/images/avatar10.png',
    'assets/images/avatar3.png',
    'assets/images/avatar9.png',
    'assets/images/avatar4.png',
    'assets/images/avatar8.png',
    'assets/images/avatar5.png',
    'assets/images/avatar7.png',
    'assets/images/avatar6.png',
  ];

  showPassword() {
    secure = !secure;
    emit(SignUpShowPasswordState());
  }

  showCardPassword() {
    cardPassSecure = !cardPassSecure;
    emit(SignUpShowCardPasswordState());
  }

  showConfirmPassword() {
    confirmPassSecure = !confirmPassSecure;
    emit(SignUpShowPasswordState());
  }

  chooseImage(int index) {
    imageIndex = index;
    imageString = avatars[index];
    emit(SignUpChooseImageState());
  }

  createAcount(context,
      {required String email,
      required String password,
      required String name,
      required String cardHolderName,
      required String cardPassword,
      required String image}) {
    emit(SignUpLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user);
      createUser(context,
          uid: value.user!.uid,
          cardPassword: cardPassword,
          name: name,
          email: email,
          image: image,
          cardHolderName: cardHolderName);
    }).catchError((onError) {
      print(onError);
      emit(SignUpFailState());
    });
  }

  createUser(context,
      {required String uid,
      required String name,
      required String email,
      required String cardHolderName,
      required String cardPassword,
      required String image}) {
    UserModel userModel = UserModel(
        name: name,
        email: email,
        image: image,
        cvc: '$cvc1$cvc2$cvc3',
        creditCardNumber: '$rnd1   $rnd21$rnd22   $rnd31$rnd32   $rnd41$rnd42',
        cardHolderName: cardHolderName,
        cardPassword: cardPassword,
        expiryDate: '${date.month} / ${date.year + 3}');
    FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .set(userModel.toJson())
        .then((value) {
      createUserName(uid: uid, userName: name);
    }).catchError((onError) {
      print(onError);
      emit(SignUpFailState());
    });
  }

  createUserName({required String userName, required String uid}) {
    FirebaseFirestore.instance
        .collection('User names')
        .doc(userName)
        .set({'uid': uid}).then((value) {
      emit(SignUpSuccessState());
    }).catchError((onError) {
      print(onError);
      emit(SignUpFailState());
    });
  }

  checkUserName(String username) async {
    final userCollection = FirebaseFirestore.instance.collection('Users');

    bool usernameExists = false;

    // Check if the username already exists
    QuerySnapshot usernameSnapshot =
        await userCollection.where('name', isEqualTo: 'hossamagha20').get();
    if (usernameSnapshot.docs.isNotEmpty) {
      usernameExists = true;
    }
  }
}
