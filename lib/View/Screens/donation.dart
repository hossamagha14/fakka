import 'package:flutter/material.dart';

class DonationScreen extends StatelessWidget {
  const DonationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 40, 15, 0),
      child: Column(
        children: [
          InkWell(
            onTap: () {},
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.05,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.15,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: const Image(
                    image: AssetImage('assets/images/heart.png'),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: const Text(
                    'Magdi Yacoub heart foundation',
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
            onTap: () {},
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.05,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.15,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: const Image(
                    image: AssetImage('assets/images/orman.png'),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: const Text(
                    'Dar el orman',
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
            onTap: () {},
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.05,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.15,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: const Image(
                    image: AssetImage('assets/images/resala.png'),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: const Text(
                    'Resala',
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
            onTap: () {},
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.05,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.15,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Image(
                    image: const AssetImage('assets/images/57357.png'),
                    width: MediaQuery.of(context).size.width * 0.2,
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: const Text(
                    '57357 Children\'s cancer hospital foundation',
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
