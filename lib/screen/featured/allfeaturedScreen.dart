import 'dart:convert';
import 'package:OnlineCouresApp/animasions/rightToLeft.dart';
import 'package:OnlineCouresApp/helper/helper.dart';
import 'package:OnlineCouresApp/modal/podcast.dart';
import 'package:OnlineCouresApp/network_utils/api.dart';
import 'package:OnlineCouresApp/screen/bookDetail/bookDetail.dart';
import 'package:OnlineCouresApp/widget/appAppBar.dart';
import 'package:OnlineCouresApp/widget/infoView.dart';
import 'package:OnlineCouresApp/widget/listItems.dart';
import 'package:OnlineCouresApp/widget/seeAllTitle.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AllFeaturedCoures extends StatefulWidget {
  final bool noToolBar;
  AllFeaturedCoures({Key key, @required this.noToolBar}) : super(key: key);

  @override
  _AllFeaturedCouresState createState() => _AllFeaturedCouresState();
}

class _AllFeaturedCouresState extends State<AllFeaturedCoures>
    with AutomaticKeepAliveClientMixin<AllFeaturedCoures> {
  bool get wantKeepAlive => true;
  //Podcast
  Podcast podcast;
  bool podcastLoading = true;
  String podcastErrorMessage;

  _loadPodcast() async {
    setState(() {
      podcastLoading = true;
    });
    try {
      http.Response response = await Network()
          .getDataFormApi("https://api.jsonbin.io/b/5fe5a6756c160b7b70d92a6c");
      if (response.statusCode == 200) {
        var resBody = json.decode(response.body);
        setState(() {
          podcast = new Podcast.fromJson(resBody);
          podcastLoading = false;
          podcastErrorMessage = null;
        });
      } else {
        var resBody = json.decode(response.body);
        var error = resBody['message'];
        setState(() {
          podcastErrorMessage = error;
          podcastLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        podcastErrorMessage = e.toString();
        podcastLoading = false;
      });
      Helper().showSnackBar(e.toString(), "Error Loading Error", context, true);
      print(e);
    }
  }

  @override
  void initState() {
    _loadPodcast();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          widget.noToolBar
              ? SliverToBoxAdapter(
                  child: SizedBox(
                    height: 0,
                  ),
                )
              : SliverToBoxAdapter(
                  child: SafeArea(
                    child: AppAppBar(
                      backButton: true,
                      title: "",
                    ),
                  ),
                ),
          widget.noToolBar
              ? SliverToBoxAdapter(
                  child: SizedBox(
                    height: 0,
                  ),
                )
              : SliverToBoxAdapter(
                  child: RightToLeft(
                    child: SeeAppTitle(
                      function: () {},
                      title: "Featured",
                      seeButton: false,
                    ),
                  ),
                ),
          podcastLoading
              ? SliverToBoxAdapter(
                  child: Container(child: Center(child: LoadingView())))
              : podcastErrorMessage != null
                  ? SliverToBoxAdapter(
                      child: ErrorView(
                        errorMessage: podcastErrorMessage,
                        function: () {
                          _loadPodcast();
                        },
                      ),
                    )
                  : SliverList(
                      delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        PodcastElement podcastItem = podcast.podcast[index];
                        return RightToLeft(
                            child: Courses(
                          imageUrl: podcastItem.imageUrl,
                          name: podcastItem.name,
                          type: podcastItem.genre,
                          function: () {
                            Helper().goToPage(
                                context,
                                BookDetail(
                                  podcast: podcastItem,
                                ));
                          },
                        ));
                      }, childCount: podcast.podcast.length),
                    ),
          SliverToBoxAdapter(
              child: SizedBox(
            height: 76,
          )),
        ],
      ),
    );
  }
}
