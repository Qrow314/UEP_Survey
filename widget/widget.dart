import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(fontSize: 22),
        children: <TextSpan>[
          TextSpan(
              text: 'UEP',
              style: TextStyle(
                  fontWeight: FontWeight.w600, color: Colors.black54)),
          TextSpan(
              text: 'Survey App',
              style:
                  TextStyle(fontWeight: FontWeight.w600, color: Colors.blue)),
        ],
      ),
    );
  }

  Widget blueButton(BuildContext context, String label) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 18),
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(30)),
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width - 48,
      child: Text(
        label,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}
