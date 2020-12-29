import 'package:OnlineCouresApp/animasions/FadeAnimation.dart';
import 'package:OnlineCouresApp/widget/appText.dart';
import 'package:flutter/material.dart';

class VideoIntroduction extends StatefulWidget {
  VideoIntroduction({Key key}) : super(key: key);

  @override
  _VideoIntroductionState createState() => _VideoIntroductionState();
}

class _VideoIntroductionState extends State<VideoIntroduction>
    with AutomaticKeepAliveClientMixin<VideoIntroduction> {
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 14, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeAnimation(
                0.5,
                BookDetilesText(
                  body:
                      "Has your life been living in the expectations of others?",
                  title: "Recommendation",
                ),
              ),
              FadeAnimation(
                0.5,
                BookDetilesText(
                  body:
                      "In your feelings, work, or family, do you have the experience of do not want to do it, but still do it? Has anyone been living in the expectations of others?\n\nIn your feelings, work, or family, do you have the experience of do not want to do it, but still do it?\n\n Has anyone been living in the expectations of others?\n\nIn your feelings, work, or family, do you have the experience of do not want to do it, but still do it? Has anyone been living in the expectations of others?",
                  title: "Audio introduction",
                ),
              ),
              FadeAnimation(
                0.5,
                BookDetilesText(
                  body:
                      "In your feelings, work, or family, do you have the experience of do not \n\n do it, but still do it? Has anyone been living in the expectations of others?",
                  title: "Book information",
                ),
              ),
            ],
          )),
    );
  }
}
