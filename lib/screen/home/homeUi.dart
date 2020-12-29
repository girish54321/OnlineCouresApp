import 'package:OnlineCouresApp/animasions/rightToLeft.dart';
import 'package:OnlineCouresApp/helper/helper.dart';
import 'package:OnlineCouresApp/modal/banners.dart';
import 'package:OnlineCouresApp/modal/podcast.dart';
import 'package:OnlineCouresApp/screen/allCouresScreen/allCouresScreen.dart';
import 'package:OnlineCouresApp/screen/allLatestedScreen/allLatestedScreen.dart';
import 'package:OnlineCouresApp/screen/bookDetail/bookDetail.dart';
import 'package:OnlineCouresApp/screen/featured/allfeaturedScreen.dart';
import 'package:OnlineCouresApp/screen/player/audioPlayer.dart';
import 'package:OnlineCouresApp/screen/vidoePlayer/vidoePlayer.dart';
import 'package:OnlineCouresApp/widget/appAppBar.dart';
import 'package:OnlineCouresApp/widget/bannersItems.dart';
import 'package:OnlineCouresApp/widget/infoView.dart';
import 'package:OnlineCouresApp/widget/listItems.dart';
import 'package:OnlineCouresApp/widget/seeAllTitle.dart';
import 'package:flutter/material.dart';

class HomeUi extends StatelessWidget {
  //Banner
  final Function loadBanners;
  final bool bannerLoading;
  final String bannerErrorMessage;
  final List<BannerData> banners;

  //podcast
  final List<PodcastElement> podcast;
  final bool podcastLoading;
  final String podcastErrorMessage;
  final Function loadPodcast;
  const HomeUi(
      {Key key,
      //Banner
      @required this.loadBanners,
      @required this.bannerLoading,
      @required this.bannerErrorMessage,
      @required this.banners,
      //podcast
      @required this.podcast,
      @required this.podcastLoading,
      @required this.podcastErrorMessage,
      @required this.loadPodcast})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: SafeArea(
              child: AppAppBar(
                backButton: false,
                title: "Home",
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: RightToLeft(
              child: Container(
                margin: EdgeInsets.only(top: 16, right: 16, left: 16),
                width: double.infinity,
                height: 190.00,
                child: bannerLoading
                    ? LoadingView()
                    : bannerErrorMessage != null
                        ? ErrorView(
                            errorMessage: bannerErrorMessage,
                            function: () {
                              loadBanners();
                            },
                          )
                        : AppBanner(
                            bigBanner: false,
                            banners: banners,
                          ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: RightToLeft(
              child: SeeAppTitle(
                function: () {
                  Helper().goToPage(
                      context,
                      AllFeaturedCoures(
                        noToolBar: false,
                      ));
                },
                title: "Featured",
                seeButton: true,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 310,
              child: podcastLoading
                  ? LoadingView()
                  : podcastErrorMessage != null
                      ? ErrorView(
                          errorMessage: podcastErrorMessage,
                          function: () {
                            loadPodcast();
                          },
                        )
                      : RightToLeft(
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: podcast.length,
                            itemBuilder: (BuildContext context, int index) {
                              PodcastElement podcastItem = podcast[index];
                              return RightToLeft(
                                  child: CoverBigItem(
                                text: podcastItem.name,
                                imageUrl: podcastItem.imageUrl,
                                showRating: true,
                                function: () {
                                  Helper().goToPage(context,
                                      BookDetail(podcast: podcastItem));
                                },
                              ));
                            },
                          ),
                        ),
            ),
          ),
          SliverToBoxAdapter(
            child: RightToLeft(
              child: SeeAppTitle(
                function: () {
                  Helper().goToPage(context, AllLatestedScreen());
                },
                title: "Latested",
                seeButton: true,
              ),
            ),
          ),
          podcastLoading
              ? SliverToBoxAdapter(child: LoadingView())
              : podcastErrorMessage != null
                  ? SliverToBoxAdapter(
                      child: ErrorView(
                        errorMessage: podcastErrorMessage,
                        function: () {
                          loadPodcast();
                        },
                      ),
                    )
                  : SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          PodcastElement podcastItem = podcast[index];
                          return RightToLeft(
                              child: CoverSmallItem(
                            imageUrl: podcastItem.imageUrl,
                            function: () {
                              Helper().goToPage(
                                  context, BookDetail(podcast: podcastItem));
                            },
                          ));
                        },
                        childCount: podcast.length,
                      ),
                    ),
          SliverToBoxAdapter(
            child: RightToLeft(
              child: SeeAppTitle(
                function: () {
                  Helper().goToPage(context, AllCouresScreen());
                },
                title: "Coures",
                seeButton: true,
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
            }, childCount: 3),
          ),
          SliverToBoxAdapter(
              child: SizedBox(
            height: 77,
          ))
        ],
      ),
    );
  }
}
