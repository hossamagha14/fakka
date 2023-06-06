import 'package:fakka/View/Reusable/colors_paddings.dart';
import 'package:fakka/View/Reusable/my_button.dart';
import 'package:fakka/View/Reusable/toasts.dart';
import 'package:fakka/View/Screens/send_money.dart';
import 'package:flutter/material.dart';

class PhoneNumberScreen extends StatelessWidget {
  final String userName;
  PhoneNumberScreen({Key? key, required this.userName}) : super(key: key);
  TextEditingController phoneNumberControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone number'),
      ),
      body: SafeArea(
          child: Center(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.065,
                width: MediaQuery.of(context).size.width * 0.17,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 2, color: mainColor)),
                child: Center(
                    child: Text(userName == 'Etisalat'
                        ? '011'
                        : userName == 'we'
                            ? '015'
                            : userName == 'orange'
                                ? '012'
                                : '010')),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.065,
                width: MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 2, color: mainColor)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: TextFormField(
                    textInputAction: TextInputAction.next,
                    controller: phoneNumberControl,
                    keyboardType: TextInputType.number,
                    maxLength: 8,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Phone number',
                        counterText: '',
                        hintStyle: TextStyle(fontWeight: FontWeight.w500)),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          MyButton(
              title: 'Next',
              function: () {
                if (phoneNumberControl.text.length !=8) {
                  errorToast(message: 'Wrong phone number');
                } else if (phoneNumberControl.text.isEmpty) {
                  errorToast(message: 'Please insert your phone number');
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SendMoneyScreen(
                          type: 4,
                          userName: userName,
                        ),
                      ));
                }
              })
        ],
      ))),
    );
  }
}
