import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class QrCodeScreen extends StatelessWidget {
  final String userName;
  const QrCodeScreen({Key? key, required this.userName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.3,
      child: Center(
        child: PrettyQr(
          image: const AssetImage('assets/images/fakka.png'),
          typeNumber: 3,
          size: 150,
          data: userName,
          errorCorrectLevel: QrErrorCorrectLevel.M,
          roundEdges: true,
        ),
      ),
    );
  }
}
