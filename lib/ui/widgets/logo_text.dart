import 'package:flutter/material.dart';


// LogoText 위젯
class LogoText extends StatelessWidget {
  const LogoText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
        children: [
          TextSpan(
            text: '우리',
            style: TextStyle(
              fontSize: 25,
              fontFamily: 'Cafe24Ssurround-v2.0',
            ),
          ),
          TextSpan(
            text: '4',
            style: TextStyle(
              fontSize: 30,
              fontFamily: 'Cafe24Ssurround-v2.0',
              color: Color(0xFFFB6066),
            ),
          ),
          TextSpan(
            text: '이',
            style: TextStyle(
              fontSize: 25,
              fontFamily: 'Cafe24Ssurround-v2.0',
            ),
          ),
        ],
      ),
    );
  }
}
