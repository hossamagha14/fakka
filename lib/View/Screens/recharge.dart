import 'package:flutter/material.dart';

class RechargeScreen extends StatelessWidget {
  final etisalatFunction;
  final orangeFunction;
  final vodafoneFunction;
  final weFunction;
  const RechargeScreen(
      {Key? key,
      required this.etisalatFunction,
      required this.orangeFunction,
      required this.vodafoneFunction,
      required this.weFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 40, 15, 0),
      child: Column(
        children: [
          InkWell(
            onTap: etisalatFunction,
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: const Image(
                    image: AssetImage('assets/images/e.png'),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                const Text(
                  'Etisalat misr',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
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
            onTap: orangeFunction,
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: const Image(
                    image: AssetImage('assets/images/or.png'),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                const Text(
                  'Orange Egypt',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
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
            onTap: vodafoneFunction,
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: const Image(
                    image: AssetImage('assets/images/voda.png'),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                const Text(
                  'Vodafone Egypt',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
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
            onTap: weFunction,
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.025,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.15,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: const Image(
                    image: AssetImage('assets/images/we.png'),
                  ),
                ),
                SizedBox(
                  width: 30 + MediaQuery.of(context).size.width * 0.025,
                ),
                const Text(
                  'We misr',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
