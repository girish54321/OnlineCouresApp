import 'package:OnlineCouresApp/animasions/FadeAnimation.dart';
import 'package:OnlineCouresApp/modal/podcast.dart';
import 'package:OnlineCouresApp/screen/player/playListModal.dart';
import 'package:OnlineCouresApp/widget/appAppBar.dart';
import 'package:OnlineCouresApp/widget/appNetworkImage.dart';
import 'package:OnlineCouresApp/widget/appText.dart';
import 'package:animate_do/animate_do.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

class AudioPlayerUi extends StatelessWidget {
  final bool liked;
  final PodcastElement podcast;
  const AudioPlayerUi({Key key, @required this.liked, @required this.podcast})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    PlayListModal playListModal = new PlayListModal();

    return Stack(
      children: [
        SafeArea(
          child: AppAppBar(
            backButton: true,
            title: "",
          ),
        ),
        Positioned(
          top: 1,
          left: 1,
          right: 1,
          child: Container(
            height: 370,
            child: Column(
              children: [
                SizedBox(
                  height: 77,
                ),
                FadeAnimation(
                  0.5,
                  Text(
                    podcast.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                ElasticIn(
                  child: CoverArt(
                    imageUrl: podcast.imageUrl,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                FadeAnimation(
                  0.5,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TimeText(
                        text: podcast.genre,
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
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 1,
          left: 1,
          right: 1,
          child: FadeAnimation(
            0.2,
            Column(
              children: [
                Stack(
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 22),
                        color: Colors.white,
                        height: 120.00,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Icon(
                              Icons.replay_30,
                              size: 36,
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.skip_previous,
                                size: 36,
                              ),
                              onPressed: () {},
                            ),
                            Container(
                              height: 70.00,
                              width: 70.00,
                              decoration: BoxDecoration(
                                color: Theme.of(context).accentColor,
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                onPressed: () {},
                                icon: IconButton(
                                  color: Colors.white,
                                  icon: Icon(Icons.skip_next, size: 36),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                            IconButton(
                                icon: Icon(
                                  Icons.skip_next,
                                  size: 36,
                                ),
                                onPressed: () {}),
                            Icon(
                              Icons.forward_30,
                              size: 36,
                            ),
                          ],
                        )),
                    Container(
                      height: 4,
                      child: FlutterSlider(
                        handlerHeight: 2.0,
                        tooltip: FlutterSliderTooltip(disabled: false),
                        handler: FlutterSliderHandler(child: Text("")),
                        trackBar: FlutterSliderTrackBar(
                            inactiveTrackBar:
                                BoxDecoration(color: Colors.grey.shade300),
                            activeTrackBar: BoxDecoration(
                                color: Theme.of(context).accentColor)),
                        values: [300],
                        max: 500,
                        min: 0.0,
                        onDragging: (handlerIndex, lowerValue, upperValue) {
                          print(lowerValue);
                        },
                      ),
                    ),
                  ],
                ),
                Container(
                  color: Colors.white,
                  height: 70.00,
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PlayerButtons(
                        iconData: EvaIcons.list,
                        text: "12/20",
                        function: () {
                          playListModal.mainBottomSheet(context, [], 11);
                        },
                      ),
                      PlayerButtons(
                        iconData: EvaIcons.messageCircleOutline,
                        text: "2.3K",
                        function: () {},
                      ),
                      PlayerButtons(
                        iconData:
                            liked ? EvaIcons.heart : EvaIcons.heartOutline,
                        text: "249",
                        color: liked ? Theme.of(context).accentColor : null,
                        function: () {},
                      ),
                      PlayerButtons(
                        iconData: EvaIcons.share,
                        text: "share",
                        function: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class PlayerButtons extends StatelessWidget {
  final IconData iconData;
  final String text;
  final Function function;
  final Color color;
  const PlayerButtons(
      {Key key,
      @required this.iconData,
      @required this.text,
      this.function,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        onPressed: function,
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              height: 8,
            ),
            Icon(
              iconData,
              color: color,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
