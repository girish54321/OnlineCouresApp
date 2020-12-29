import 'dart:convert';

import 'package:OnlineCouresApp/helper/helper.dart';
import 'package:OnlineCouresApp/modal/banners.dart';
import 'package:OnlineCouresApp/modal/podcast.dart';
import 'package:OnlineCouresApp/network_utils/api.dart';
import 'package:OnlineCouresApp/screen/home/homeUi.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'homeUi.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin<HomeScreen> {
  bool get wantKeepAlive => true;
  //Banners
  Banners banners;
  bool bannerLoading = true;
  String bannerErrorMessage;

  //Podcast
  Podcast podcast;
  bool podcastLoading = true;
  String podcastErrorMessage;

  _loadBanners() async {
    setState(() {
      bannerLoading = true;
    });
    try {
      http.Response response = await Network()
          .getDataFormApi("https://api.jsonbin.io/b/5fe58a636c160b7b70d92451");
      if (response.statusCode == 200) {
        var resBody = json.decode(response.body);
        setState(() {
          banners = new Banners.fromJson(resBody);
          bannerLoading = false;
          bannerErrorMessage = null;
        });
      } else {
        var resBody = json.decode(response.body);
        var error = resBody['message'];
        setState(() {
          bannerErrorMessage = error;
          bannerLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        bannerErrorMessage = e.toString();
        bannerLoading = false;
      });
      Helper().showSnackBar(e.toString(), "Error Loading Error", context, true);
      print(e);
    }
  }

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
    _loadBanners();
    _loadPodcast();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HomeUi(
      bannerErrorMessage: bannerErrorMessage,
      bannerLoading: bannerLoading,
      banners: bannerLoading ? [] : banners.banners,
      loadBanners: _loadBanners,
      loadPodcast: _loadPodcast,
      podcast: podcastLoading ? [] : podcast.podcast,
      podcastErrorMessage: podcastErrorMessage,
      podcastLoading: podcastLoading,
    );
  }
}
