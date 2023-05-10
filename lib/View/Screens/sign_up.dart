import 'package:fakka/View/Reusable/choose_button.dart';
import 'package:fakka/View/Reusable/colors_paddings.dart';
import 'package:fakka/View/Reusable/my_button.dart';
import 'package:fakka/View/Reusable/my_text_field.dart';
import 'package:fakka/View/Reusable/toasts.dart';
import 'package:fakka/View/Screens/select_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../View Model/Sign up/sign_up_cubit.dart';
import '../../View Model/Sign up/sign_up_states.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController cardHolderNameController = TextEditingController();
  TextEditingController cardPasswordController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController nationalIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<SignUpCubit, SignUpStates>(
        listener: (context, state) {},
        builder: (context, state) {
          SignUpCubit myCubit = SignUpCubit.get(context);
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: horizontalPadding(context, top: 0, bottom: 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Center(
                        child: Image(
                      image: AssetImage('assets/images/fakka.png'),
                    )),
                    const SizedBox(height: 40),
                    const Text('Sign Up',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 20),
                    MyTextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      hint: 'Email',
                      secure: false,
                    ),
                    const SizedBox(height: 20),
                    MyTextFormField(
                      controller: userNameController,
                      hint: 'User name',
                      secure: false,
                    ),
                    const SizedBox(height: 20),
                    MyTextFormField(
                      controller: cardHolderNameController,
                      hint: 'Card holder name',
                      secure: false,
                      maxLength: 24,
                    ),
                    const SizedBox(height: 20),
                    MyTextFormField(
                      controller: addressController,
                      hint: 'Address',
                      secure: false,
                    ),
                    const SizedBox(height: 20),
                    MyTextFormField(
                      controller: nationalIdController,
                      hint: 'National Id number',
                      secure: false,
                      maxLength: 14,
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        showDatePicker(
                                context: context,
                                initialDate: DateTime.now()
                                    .subtract(const Duration(days: 5840)),
                                firstDate: DateTime(1923),
                                lastDate: DateTime.now()
                                    .subtract(const Duration(days: 5840)))
                            .then(
                          (value) => myCubit.pickBirthDay(value),
                        );
                      },
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 15),
                        height: MediaQuery.of(context).size.height * 0.065,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                width: 2, color: Colors.grey.shade300)),
                        child: myCubit.birthday == null
                            ? const Text(
                                'Birthday',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.5,
                                    color: Colors.black54),
                              )
                            : Text(
                                DateFormat('dd / MM / y')
                                    .format(myCubit.birthday!),
                              ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    MyTextFormField(
                      controller: cardPasswordController,
                      hint: 'Card PIN',
                      secure: myCubit.cardPassSecure,
                      maxLength: 4,
                      keyboardType: TextInputType.number,
                      suffixIcon: InkWell(
                        child: Icon(
                          myCubit.cardPassSecure == true
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: mainColor,
                        ),
                        onTap: () {
                          myCubit.showCardPassword();
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    MyTextFormField(
                      controller: passwordController,
                      hint: 'Password',
                      secure: myCubit.secure,
                      suffixIcon: InkWell(
                        child: Icon(
                          myCubit.secure == true
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: mainColor,
                        ),
                        onTap: () {
                          myCubit.showPassword();
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    MyTextFormField(
                      controller: confirmPasswordController,
                      hint: 'Confirm Password',
                      secure: myCubit.confirmPassSecure,
                      suffixIcon: InkWell(
                        child: Icon(
                          myCubit.confirmPassSecure == true
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: mainColor,
                        ),
                        onTap: () {
                          myCubit.showConfirmPassword();
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ChooseButton(
                            function: () {
                              myCubit.chooseMale();
                            },
                            textColor: myCubit.isMale == true
                                ? Colors.blue
                                : Colors.grey.shade500,
                            width: myCubit.isMale == true ? 3 : 2,
                            color: myCubit.isMale == true
                                ? Colors.blue
                                : Colors.grey.shade300,
                            name: 'Male',
                            icon: Icons.male),
                        ChooseButton(
                            function: () {
                              myCubit.chooseFemale();
                            },
                            textColor: myCubit.isMale == false
                                ? Colors.pink
                                : Colors.grey.shade500,
                            width: myCubit.isMale == false ? 3 : 2,
                            color: myCubit.isMale == false
                                ? Colors.pink
                                : Colors.grey.shade300,
                            name: 'Female',
                            icon: Icons.female),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ChooseButton(
                            function: () {
                              myCubit.chooseVendor();
                            },
                            textColor: myCubit.isVendor == true
                                ? mainColor
                                : Colors.grey.shade500,
                            width: myCubit.isVendor == true ? 3 : 2,
                            color: myCubit.isVendor == true
                                ? mainColor
                                : Colors.grey.shade300,
                            name: 'Vendor',
                            icon: Icons.storefront),
                        ChooseButton(
                            function: () {
                              myCubit.chooseCustomer();
                            },
                            textColor: myCubit.isVendor == false
                                ? mainColor
                                : Colors.grey.shade500,
                            width: myCubit.isVendor == false ? 3 : 2,
                            color: myCubit.isVendor == false
                                ? mainColor
                                : Colors.grey.shade300,
                            name: 'Customer',
                            icon: Icons.person),
                      ],
                    ),
                    const SizedBox(height: 40),
                    MyButton(
                        title: 'Next',
                        function: () {
                          if (myCubit.isVendor == null ||
                              emailController.text.isEmpty ||
                              userNameController.text.isEmpty ||
                              addressController.text.isEmpty ||
                              nationalIdController.text.isEmpty ||
                              myCubit.birthday == null ||
                              cardPasswordController.text.isEmpty ||
                              passwordController.text.isEmpty ||
                              cardHolderNameController.text.isEmpty ||
                              confirmPasswordController.text.isEmpty ||
                              myCubit.isMale == null) {
                            errorToast(message: 'Please complete all the data');
                          } else if (nationalIdController.text.length < 14) {
                            errorToast(
                                message:
                                    'Please cheack your national id number');
                          } else if (cardPasswordController.text.length < 4) {
                            errorToast(message: 'Card pin must be 4 digits');
                          } else if (passwordController.text !=
                              confirmPasswordController.text) {
                            errorToast(message: 'Password doesn\'t match');
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SelectImageScreen(
                                      cardPassword: cardPasswordController.text,
                                      address: addressController.text,
                                      nationalId: nationalIdController.text,
                                      cardHolderName:
                                          cardHolderNameController.text,
                                      email: emailController.text,
                                      password: passwordController.text,
                                      userName: userNameController.text),
                                ));
                          }
                        }),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
