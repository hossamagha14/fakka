import 'package:fakka/View/Reusable/colors_paddings.dart';
import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: Padding(
        padding: horizontalPadding(context, top: 20, bottom: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "We're FAKKA !",
              style: TextStyle(
                  color: mainColor, fontWeight: FontWeight.w700, fontSize: 35),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
                "Welcome To Our E-Wallet Website, Dedicated To Helping You Save And Invest Your Spare Change. Based In Egypt, We Understand The Importance Of Managing Your Finances And Making Your Money Work For You. Our Goal Is To Provide You With An Innovative And Accessible Platform That Makes Saving And Investing Easier Than Ever Before.\nOur Team Is Made Up Of Experienced Professionals Who Are Passionate About Financial Technology And Its Potential To Empower Individuals And Businesses. We Work Tirelessly To Provide Our Users With The Best Possible Experience, And We’re Always Looking For Ways To Improve Our Platform And Expand Our Services.\nWhether You’re Saving For A Rainy Day Or Investing In Your Future, Our E-Wallet Website Is Here To Help. Join Us Today And Start Taking Control Of Your Finances!",
                style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),
                textAlign: TextAlign.justify,
                ),
          ],
        ),
      ),
    );
  }
}
