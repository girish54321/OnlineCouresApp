import 'package:OnlineCouresApp/widget/appBage.dart';
import 'package:OnlineCouresApp/widget/appNetworkImage.dart';
import 'package:OnlineCouresApp/widget/appText.dart';
import 'package:OnlineCouresApp/widget/bannersItems.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

class CoverBigItem extends StatelessWidget {
  final String text;
  final String imageUrl;
  final bool showRating;
  final Function function;

  const CoverBigItem(
      {Key key,
      @required this.text,
      @required this.imageUrl,
      @required this.showRating,
      @required this.function})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        height: 300,
        width: 160.00,
        margin: EdgeInsets.only(left: 18, bottom: 6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                CoverArt(
                  imageUrl: imageUrl,
                ),
                showRating
                    ? Positioned(right: 8, top: 8, child: AppRatingsWidget())
                    : Text("")
              ],
            ),
            Container(
              margin: EdgeInsets.only(
                top: 14,
              ),
              child: AppTextP1(
                text: text,
              ),
            ),
            Container(
                margin: EdgeInsets.only(
                  top: 6,
                ),
                child: PriceText(
                  text: "150 /-",
                ))
          ],
        ),
      ),
    );
  }
}

class CategoryListItem extends StatelessWidget {
  final String imageUrl;
  final String text;

  final Function function;

  const CategoryListItem(
      {Key key,
      @required this.function,
      @required this.imageUrl,
      @required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: function,
      child: Container(
        height: 150,
        width: double.infinity,
        margin: EdgeInsets.only(left: 16, right: 16, top: 18),
        child: Stack(
          children: [
            AppNetWorkIamge(
              imageUrl: imageUrl,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.5),
                        Colors.black.withOpacity(0.0),
                        Colors.black.withOpacity(0.0),
                        Colors.black.withOpacity(0.0),
                        Colors.black.withOpacity(0.0),
                      ])),
            ),
            Positioned(
              bottom: 1,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: CategoryText(
                  text: text,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CoverSmallItem extends StatelessWidget {
  final String imageUrl;
  final Function function;
  const CoverSmallItem(
      {Key key, @required this.imageUrl, @required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        margin: EdgeInsets.all(18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CoverArt(
              height: 120.00,
              width: 100.00,
              imageUrl: imageUrl,
            ),
            Expanded(
              child: Container(
                  height: 120.00,
                  margin: EdgeInsets.only(left: 14.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppTextP1(
                            text: "Blood for Blood",
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          InfoText()
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: TimeText(
                                text: "12:17",
                              ),
                            ),
                            Container(
                              child: PriceText(
                                text: "23.00/-",
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class CouresAndTimeLine extends StatelessWidget {
  final Function function;
  const CouresAndTimeLine({Key key, @required this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        margin: EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 160.00,
              width: double.infinity,
              child: BannersItem(
                imageUrl:
                    "https://www.mintegral.com/wp-content/uploads/2019/08/mintegral-ironsource2.jpg",
                text: "",
                radius: 8,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 8),
              child: AppTextP1(
                text: "Learnr - Online Courses Educational App UI Kit",
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 260,
                  margin: EdgeInsets.only(top: 18),
                  child: LinearPercentIndicator(
                      animation: true,
                      lineHeight: 8.0,
                      animationDuration: 1000,
                      percent: 0.8,
                      linearStrokeCap: LinearStrokeCap.roundAll,
                      progressColor: Theme.of(context).accentColor),
                ),
                Container(
                  margin: EdgeInsets.only(top: 8, left: 14),
                  child: PriceText(
                    text: "14/20",
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Courses extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String type;
  final Function function;

  const Courses(
      {Key key,
      @required this.imageUrl,
      @required this.name,
      @required this.type,
      @required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        height: 220,
        width: 160.00,
        margin: EdgeInsets.only(left: 16, bottom: 8, right: 16),
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(55.0, 5.0, 20.0, 5.0),
              height: 208.0,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(100.0, 20.0, 20.0, 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                        top: 14,
                      ),
                      child: AppTextP1(
                        text: name,
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(
                          top: 6,
                        ),
                        child: PriceText(
                          text: type,
                        )),
                    SizedBox(height: 6.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RatingBar.builder(
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemSize: 24,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 14, bottom: 18),
                            child: PriceText(
                              text: "299/-",
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 1.0,
              top: 15.0,
              bottom: 15.0,
              child: Container(
                width: 130.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: CoverArt(
                  imageUrl: imageUrl,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CoursesListItem extends StatelessWidget {
  final String title;
  final String number;
  final bool isPlaying;
  const CoursesListItem(
      {Key key,
      @required this.title,
      @required this.number,
      @required this.isPlaying})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      // leading: Text(number),
      onTap: () {
        Navigator.pop(context);
      },
      title: Text(title),
      trailing: isPlaying
          ? Icon(
              EvaIcons.pauseCircleOutline,
              color: Theme.of(context).accentColor,
            )
          : Icon(
              EvaIcons.playCircleOutline,
            ),
    );
  }
}

class CommentListItem extends StatelessWidget {
  final String imageUrl;
  final String userName;
  final String comment;
  final bool verified;
  final String time;

  const CommentListItem(
      {Key key,
      @required this.imageUrl,
      @required this.userName,
      @required this.comment,
      @required this.verified,
      @required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: ListTile(
          leading: CachedNetworkImage(
            imageUrl: imageUrl,
            imageBuilder: (context, imageProvider) => Container(
              height: 54.00,
              width: 54.00,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
                shape: BoxShape.circle,
              ),
            ),
            placeholder: (context, url) => Container(
              height: 54.00,
              width: 54.00,
              decoration: BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
            errorWidget: (context, url, error) => Container(
              height: 54.00,
              width: 54.00,
              child: Center(
                child: Icon(Icons.error),
              ),
            ),
          ),
          title: Container(
            margin: EdgeInsets.only(bottom: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  userName,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color(0xff999999),
                  ),
                ),
                SizedBox(
                  width: 4,
                ),
                verified
                    ? Icon(EvaIcons.checkmarkCircle2,
                        color: Theme.of(context).accentColor)
                    : Text("")
              ],
            ),
          ),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                comment,
                maxLines: 6,
                style: TextStyle(
                  fontSize: 16,
                  height: 1.4,
                  color: Color(0xff333333),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8),
                child: Text(
                  time,
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xff999999),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileCardItem extends StatelessWidget {
  final String title;
  final String subtitle;
  const ProfileCardItem(
      {Key key, @required this.title, @required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 86.00,
      // width: 100.00,
      // width: dob,
      padding: EdgeInsets.all(14.0),
      decoration: BoxDecoration(
        color: Color(0xffffffff),
        boxShadow: [
          BoxShadow(
            offset: Offset(0.00, 4.00),
            color: Color(0xff000000).withOpacity(0.10),
            blurRadius: 30,
          ),
        ],
        borderRadius: BorderRadius.circular(8.00),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Color(0xff999999),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 19,
                color: Theme.of(context).accentColor),
          )
        ],
      ),
    );
  }
}

class ProfileOpstion extends StatelessWidget {
  final String title;
  final Widget lefticon;
  final Widget righticon;
  const ProfileOpstion({Key key, this.title, this.lefticon, this.righticon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      decoration: BoxDecoration(
        color: Color(0xffffffff),
        boxShadow: [
          BoxShadow(
            offset: Offset(0.00, 4.00),
            color: Color(0xff000000).withOpacity(0.10),
            blurRadius: 30,
          ),
        ],
        borderRadius: BorderRadius.circular(8.00),
      ),
      child: ListTile(
        trailing: lefticon,
        leading: righticon,
        title: AppTextP1(
          text: title,
        ),
      ),
    );
  }
}
