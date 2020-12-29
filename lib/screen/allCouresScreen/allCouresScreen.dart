import 'package:OnlineCouresApp/animasions/rightToLeft.dart';
import 'package:OnlineCouresApp/helper/helper.dart';
import 'package:OnlineCouresApp/screen/vidoePlayer/vidoePlayer.dart';
import 'package:OnlineCouresApp/widget/appAppBar.dart';
import 'package:OnlineCouresApp/widget/listItems.dart';
import 'package:OnlineCouresApp/widget/seeAllTitle.dart';
import 'package:flutter/material.dart';

class AllCouresScreen extends StatefulWidget {
  AllCouresScreen({Key key}) : super(key: key);

  @override
  _AllCouresScreenState createState() => _AllCouresScreenState();
}

class _AllCouresScreenState extends State<AllCouresScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: SafeArea(
              child: AppAppBar(
                backButton: true,
                title: "",
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: RightToLeft(
              child: SeeAppTitle(
                function: () {},
                title: "Coures",
                seeButton: false,
              ),
            ),
          ),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return RightToLeft(child: CouresAndTimeLine(
                function: () {
                  Helper().goToPage(context, VideoPlayer());
                },
              ));
            }, childCount: 10),
          ),
        ],
      ),
    );
  }
}
