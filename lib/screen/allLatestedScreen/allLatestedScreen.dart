import 'package:OnlineCouresApp/animasions/rightToLeft.dart';
import 'package:OnlineCouresApp/widget/appAppBar.dart';
import 'package:OnlineCouresApp/widget/listItems.dart';
import 'package:OnlineCouresApp/widget/seeAllTitle.dart';
import 'package:flutter/material.dart';

class AllLatestedScreen extends StatefulWidget {
  AllLatestedScreen({Key key}) : super(key: key);

  @override
  _AllLatestedScreenState createState() => _AllLatestedScreenState();
}

class _AllLatestedScreenState extends State<AllLatestedScreen> {
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
                title: "Latested",
                seeButton: false,
              ),
            ),
          ),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return RightToLeft(
                  child: CoverSmallItem(
                function: () {
                  // Helper().goToPage(context, AudioPlayer());
                },
                imageUrl:
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRuQbA_JXkmGH-MVYYd9ZtXQzqum74uwxBRQ&usqp=CAU",
              ));
            }, childCount: 8),
          ),
        ],
      ),
    );
  }
}
