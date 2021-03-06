import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class SeeAppTitle extends StatelessWidget {
  final String title;
  final Function function;
  final bool seeButton;
  const SeeAppTitle(
      {Key key,
      @required this.title,
      @required this.function,
      @required this.seeButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 26, left: 16, right: 16, bottom: 26),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 24,
            ),
          ),
          seeButton
              ? InkWell(
                  onTap: function,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "All",
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 17, color: Colors.grey),
                        ),
                      ),
                      Icon(EvaIcons.arrowIosForward, color: Colors.grey),
                    ],
                  ),
                )
              : Text(""),
        ],
      ),
    );
  }
}
