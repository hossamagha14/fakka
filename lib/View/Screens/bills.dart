import 'package:flutter/material.dart';

class BillsScreen extends StatelessWidget {
  final eleBill;
  final waterBill;
  const BillsScreen({Key? key,required this.eleBill,required this.waterBill}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
      child: Column(
        children: [
          InkWell(
            onTap: eleBill,
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.12,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: const Image(
                    image: AssetImage('assets/images/bolt.png'),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                const Text(
                  'Electricity bill',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Divider(
              height: 1,
              thickness: 1,
              color: Colors.grey,
            ),
          ),
          InkWell(
            onTap: waterBill,
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.12,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: const Image(
                    image: AssetImage('assets/images/water.png'),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                const Text(
                  'Water Bill',
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
