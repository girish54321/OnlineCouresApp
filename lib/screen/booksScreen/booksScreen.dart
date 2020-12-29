import 'package:OnlineCouresApp/screen/featured/allfeaturedScreen.dart';
import 'package:OnlineCouresApp/widget/appAppBar.dart';
import 'package:flutter/material.dart';

class BooksScreen extends StatefulWidget {
  BooksScreen({Key key}) : super(key: key);

  @override
  _BooksScreenState createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen>
    with TickerProviderStateMixin {
  TabController _tabController;
  final List<Container> myTabs = <Container>[
    Container(height: 44, child: Center(child: Text("Featured"))),
    Container(height: 44, child: Center(child: Text("Listens"))),
    Container(height: 44, child: Center(child: Text("Coures"))),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final List<Widget> tabScreen = <Widget>[
    AllFeaturedCoures(
      noToolBar: true,
    ),
    AllFeaturedCoures(
      noToolBar: true,
    ),
    AllFeaturedCoures(
      noToolBar: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(
            child: AppAppBar(
              backButton: false,
              title: "For You",
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
    );
  }
}
