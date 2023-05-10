import 'package:fakka/View/Screens/send_money.dart';
import 'package:flutter/material.dart';

class PaymentMethodsScreen extends StatelessWidget {
  final function;
  const PaymentMethodsScreen({Key? key,required this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 40, 15, 0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SendMoneyScreen(
                      type: 1,
                    ),
                  ));
            },
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.05,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.15,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: const Image(
                    image: AssetImage('assets/images/users.png'),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: const Text(
                    'To a user name',
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
            onTap: function,
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.05,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: const Image(
                    image: AssetImage('assets/images/qr.png'),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: const Text(
                    'Scan QR code',
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
        ],
      ),
    );
  }
}
