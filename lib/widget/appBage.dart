import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class AppRatingsWidget extends StatelessWidget {
  const AppRatingsWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      child: Column(
        children: [
          Icon(
            EvaIcons.star,
            color: Colors.white,
          ),
          SizedBox(height: 4),
          Text(
            "4.6",
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
      decoration: BoxDecoration(
        color: Color(0xffff6b03),
        boxShadow: [
          BoxShadow(
            offset: Offset(0.00, 2.00),
            color: Color(0xff863700).withOpacity(0.20),
            blurRadius: 4,
          ),
        ],
        borderRadius: BorderRadius.circular(4.00),
      ),
    );
  }
}
