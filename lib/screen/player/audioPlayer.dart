import 'package:OnlineCouresApp/modal/podcast.dart';
import 'package:OnlineCouresApp/screen/player/audioPlayerUi.dart';
import 'package:OnlineCouresApp/widget/appNetworkImage.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AudioPlayer extends StatefulWidget {
  final PodcastElement podcast;
  AudioPlayer({Key key, @required this.podcast}) : super(key: key);

  @override
  _AudioPlayerState createState() => _AudioPlayerState();
}

class _AudioPlayerState extends State<AudioPlayer> {
  bool liked = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: CachedNetworkImage(
          imageUrl: widget.podcast.imageUrl,
          imageBuilder: (context, imageProvider) => Container(
            child: AudioPlayerUi(
              liked: liked,
              podcast: widget.podcast,
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.grey.withOpacity(0.3), BlendMode.dstATop)),
            ),
          ),
          placeholder: (context, url) => Container(
              width: double.infinity,
              height: double.infinity,
              child: Center(child: AppPlaceholder())),
          errorWidget: (context, url, error) => AudioPlayerUi(
            liked: liked,
            podcast: widget.podcast,
          ),
        ),
      ),
    );
  }
}
