import 'package:OnlineCouresApp/helper/helper.dart';
import 'package:OnlineCouresApp/screen/player/audioPlayer.dart';
import 'package:OnlineCouresApp/widget/appNetworkImage.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NowPlayingMinPlayer extends StatelessWidget {
  const NowPlayingMinPlayer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.transparent,
        height: 72.00,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            ...[
              ListTile(
                  tileColor: Colors.black.withOpacity(0.8),
                  onTap: () {
                    Helper().goToPage(
                        context,
                        AudioPlayer(
                          podcast: null,
                        ));
                  },
                  title: Text(
                    "Angela Lewis",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Color(0xffffffff),
                    ),
                  ),
                  subtitle: Text(
                    "6:19 / 16:55",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xffffffff).withOpacity(0.50),
                    ),
                  ),
                  leading: CachedNetworkImage(
                    imageUrl:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRuQbA_JXkmGH-MVYYd9ZtXQzqum74uwxBRQ&usqp=CAU",
                    imageBuilder: (context, imageProvider) => Container(
                      height: 54.00,
                      width: 54.00,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0.00, 3.00),
                            color: Color(0xff00a650).withOpacity(0.30),
                            blurRadius: 26,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(8.00),
                      ),
                    ),
                    placeholder: (context, url) => Container(
                      height: 54.00,
                      width: 54.00,
                      child: AppPlaceholder(),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  trailing: IconButton(
                      icon: new Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                      ),
                      onPressed: () {})),
            ]
          ],
        ));
  }
}
