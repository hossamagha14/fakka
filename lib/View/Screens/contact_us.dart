import 'package:flutter/material.dart';

class ContactUsScreen extends StatelessWidget {
  final facebookFunction;
  final instagramFunction;
  final linkedInFunction;
  const ContactUsScreen({
    Key? key,
    required this.facebookFunction,
    required this.instagramFunction,
    required this.linkedInFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 40, 15, 0),
      child: Column(
        children: [
          InkWell(
            onTap: facebookFunction,
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.05,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.15,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: const Image(
                    image: AssetImage('assets/images/facebook.png'),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: const Text(
                    'Facebook',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(2, 10, 2, 10),
            child: Divider(
              height: 1,
              thickness: 1,
              color: Colors.grey,
            ),
          ),
          InkWell(
            onTap: instagramFunction,
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.05,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.15,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: const Image(
                    image: AssetImage('assets/images/instagram.png'),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: const Text(
                    'Instagram',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(2, 10, 2, 10),
            child: Divider(
              height: 1,
              thickness: 1,
              color: Colors.grey,
            ),
          ),
          InkWell(
            onTap: linkedInFunction,
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.05,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.15,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: const Image(
                    image: AssetImage('assets/images/linkedin.png'),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: const Text(
                    'Linkedin',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
