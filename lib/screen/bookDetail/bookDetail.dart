import 'package:OnlineCouresApp/animasions/FadeAnimation.dart';
import 'package:OnlineCouresApp/helper/helper.dart';
import 'package:OnlineCouresApp/modal/podcast.dart';
import 'package:OnlineCouresApp/screen/player/audioPlayer.dart';
import 'package:OnlineCouresApp/widget/appAppBar.dart';
import 'package:OnlineCouresApp/widget/appNetworkImage.dart';
import 'package:OnlineCouresApp/widget/appText.dart';
import 'package:OnlineCouresApp/widget/buttons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class BookDetail extends StatefulWidget {
  final PodcastElement podcast;
  BookDetail({Key key, @required this.podcast}) : super(key: key);

  @override
  _BookDetailState createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: FadeAnimation(
              0.5,
              CachedNetworkImage(
                imageUrl: widget.podcast.imageUrl,
                imageBuilder: (context, imageProvider) => Container(
                  height: 400,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.grey.withOpacity(0.3), BlendMode.dstATop)),
                  ),
                  child: Stack(
                    children: [
                      SafeArea(
                        child: AppAppBar(
                          backButton: true,
                          title: "",
                        ),
                      ),
                      Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CoverArt(
                            imageUrl: widget.podcast.imageUrl,
                          ),
                          FadeAnimation(
                            0.5,
                            Container(
                              margin: EdgeInsets.symmetric(
                                vertical: 6,
                              ),
                              child: AppTextH1(
                                text: widget.podcast.name,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          FadeAnimation(
                            0.5,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TimeText(
                                  text: widget.podcast.genre,
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                TimeText(
                                  text: "22:18",
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          FadeAnimation(
                            0.5,
                            RatingBar.builder(
                              initialRating: 3,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemSize: 24,
                              itemCount: 5,
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 0.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                        ],
                      ))
                    ],
                  ),
                ),
                placeholder: (context, url) => Container(
                    height: 380,
                    width: double.infinity,
                    child: AppPlaceholder()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: Center(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 12),
            ),
          )),
          SliverToBoxAdapter(
              child: FadeAnimation(
            0.5,
            Container(
              margin: EdgeInsets.only(bottom: 11),
              child: Text(
                "Introduction",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 21,
                ),
              ),
            ),
          )),
          SliverToBoxAdapter(
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 14),
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
          ),
          SliverToBoxAdapter(
            child: FadeAnimation(
              0.5,
              Center(
                child: Container(
                    width: 130,
                    margin: EdgeInsets.only(bottom: 24),
                    child: BuyButton(
                      function: () {
                        Helper().goToPage(
                            context,
                            AudioPlayer(
                              podcast: widget.podcast,
                            ));
                      },
                      child: Text(
                        "Play at 40".toUpperCase(),
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
