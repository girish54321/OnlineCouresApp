import 'package:OnlineCouresApp/animasions/rightToLeft.dart';
import 'package:OnlineCouresApp/widget/appText.dart';
import 'package:OnlineCouresApp/widget/listItems.dart';
import 'package:OnlineCouresApp/widget/userProfilePic.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class CardList {
  final String title;
  final String subtite;

  CardList(this.title, this.subtite);
}

class ProfileOptions {
  final String title;
  final Widget lefticon;
  final Widget righticon;

  ProfileOptions(this.title, this.lefticon, this.righticon);
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<CardList> cardTypeList = [
    CardList("Type", 'Ordinary'),
    CardList("Expiry Day", '341'),
    CardList("Fllower", '302,322')
  ];

  List<ProfileOptions> profileOptions = [
    ProfileOptions(
      "Recharge",
      Icon(
        EvaIcons.arrowForward,
      ),
      Icon(
        EvaIcons.creditCard,
        color: Colors.red,
      ),
    ),
    ProfileOptions(
      "Purchase",
      Icon(
        EvaIcons.arrowForward,
      ),
      Icon(
        EvaIcons.shoppingBag,
        color: Colors.pink,
      ),
    ),
    ProfileOptions(
      "Favorites",
      Icon(
        EvaIcons.arrowForward,
      ),
      Icon(
        EvaIcons.heart,
        color: Colors.yellow,
      ),
    ),
    ProfileOptions(
      "About us",
      Icon(
        EvaIcons.arrowForward,
      ),
      Icon(
        EvaIcons.infoOutline,
        color: Colors.blue,
      ),
    ),
    ProfileOptions(
      "Setting",
      Icon(
        EvaIcons.arrowForward,
      ),
      Icon(
        EvaIcons.settings,
        color: Colors.grey,
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: SafeArea(
              child: Container(
                margin: EdgeInsets.only(top: 18),
                child: Center(
                  child: UserProfilePic(
                    isCheckOut: false,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: Container(
            margin: EdgeInsets.only(top: 12),
            child: Center(
                child: AppTextP1(
              text: "Girish Parate",
            )),
          )),
          SliverToBoxAdapter(
              child: Container(
            margin: EdgeInsets.symmetric(horizontal: 18, vertical: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...cardTypeList.map((CardList cardList) {
                  return ProfileCardItem(
                      subtitle: cardList.subtite, title: cardList.title);
                }).toList()
              ],
            ),
          )),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              ProfileOptions options = profileOptions[index];
              return RightToLeft(
                child: ProfileOpstion(
                  title: options.title,
                  lefticon: options.lefticon,
                  righticon: options.righticon,
                ),
              );
            }, childCount: profileOptions.length),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 77,
            ),
          )
        ],
      ),
    );
  }
}
