import 'package:OnlineCouresApp/helper/helper.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class AppAppBar extends StatelessWidget {
  final bool backButton;
  final Color color;
  final String title;
  const AppAppBar(
      {Key key, @required this.backButton, this.color, @required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: backButton
          ? IconButton(
              icon: Icon(
                EvaIcons.arrowIosBack,
                color: color != null ? color : Colors.black,
              ),
              onPressed: () {
                Helper().goBack(context);
              },
            )
          : Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 24,
              ),
            ),
      trailing: backButton
          ? Text("")
          : Container(
              height: 44.00,
              width: 44.00,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://randomuser.me/api/portraits/men/3.jpg"),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0.00, 10.00),
                    color: Theme.of(context).accentColor.withOpacity(0.40),
                    blurRadius: 10,
                  ),
                ],
                shape: BoxShape.circle,
              ),
            ),
    );
  }
}
