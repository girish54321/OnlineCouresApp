import 'package:OnlineCouresApp/screen/vidoePlayer/commetsView.dart';
import 'package:OnlineCouresApp/screen/vidoePlayer/courseList.dart';
import 'package:OnlineCouresApp/screen/vidoePlayer/videoIntroduction.dart';
import 'package:OnlineCouresApp/widget/appAppBar.dart';
import 'package:OnlineCouresApp/widget/bannersItems.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class VideoPlayer extends StatefulWidget {
  VideoPlayer({Key key}) : super(key: key);

  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer>
    with TickerProviderStateMixin {
  TabController _tabController;
  final List<Container> myTabs = <Container>[
    Container(height: 44, child: Center(child: Text("Introduction"))),
    Container(height: 44, child: Center(child: Text("Coure"))),
    Container(height: 44, child: Center(child: Text("Comments"))),
  ];
  int _activeTabIndex = 0;

  final List<Widget> tabScreen = <Widget>[
    VideoIntroduction(),
    CoursesList(),
    VideoComments(),
  ];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
    _tabController.addListener(_setActiveTabIndex);
  }

  void _setActiveTabIndex() {
    setState(() {
      _activeTabIndex = _tabController.index;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _tabController.removeListener(_setActiveTabIndex);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: size.width * 0.5,
                width: double.infinity,
                child: BannersItem(
                  imageUrl:
                      "https://www.mintegral.com/wp-content/uploads/2019/08/mintegral-ironsource2.jpg",
                  text: "",
                  radius: 0,
                ),
              ),
              SafeArea(
                child: AppAppBar(
                  color: Colors.white,
                  backButton: true,
                  title: "",
                ),
              ),
            ],
          ),
          ListTile(
            trailing: IconButton(
                icon: Icon(
                  EvaIcons.heart,
                  color: Theme.of(context).accentColor,
                ),
                onPressed: () {}),
            title: Row(
              children: [
                Text(
                  "Vidoe name",
                  style: TextStyle(fontSize: 21),
                ),
                Container(
                  width: 2,
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  height: 19,
                  color: Colors.grey,
                ),
                Text("21:48",
                    style: TextStyle(fontSize: 18, color: Colors.grey)),
              ],
            ),
          ),
          TabBar(
            isScrollable: true,
            labelStyle: TextStyle(
                fontSize: 20,
                color: Color(0xff000000),
                fontWeight: FontWeight.w500),
            unselectedLabelStyle: TextStyle(
              fontSize: 20,
              color: Color(0xff000000).withOpacity(0.40),
            ),
            labelColor: Theme.of(context).accentColor,
            unselectedLabelColor: Colors.grey,
            indicatorWeight: 2.0,
            controller: _tabController,
            tabs: myTabs,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: tabScreen.map((Widget tab) {
                return tab;
              }).toList(),
            ),
          ),
        ],
      ),
      floatingActionButton: _activeTabIndex == 2
          ? FloatingActionButton(
              onPressed: () {
                setState(() {});
              },
              child: Icon(
                EvaIcons.messageSquare,
              ),
            )
          : Text(""),
    );
  }
}
