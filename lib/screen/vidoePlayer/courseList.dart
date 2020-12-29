import 'package:flutter/material.dart';
import 'package:OnlineCouresApp/widget/listItems.dart';

class CoursesList extends StatefulWidget {
  CoursesList({Key key}) : super(key: key);

  @override
  _CoursesListState createState() => _CoursesListState();
}

class _CoursesListState extends State<CoursesList>
    with AutomaticKeepAliveClientMixin<CoursesList> {
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 0),
        itemCount: 12,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CoursesListItem(
              isPlaying: index == 2 ? true : false,
              number: (index + 1).toString(),
              title: "Chapter " + (index + 1).toString(),
            ),
          );
        });
    // return SliverList(
    //   delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
    //     return Padding(
    //       padding: const EdgeInsets.symmetric(horizontal: 16.0),
    //       child: CoursesListItem(
    //         isPlaying: index == 2 ? true : false,
    //         number: (index + 1).toString(),
    //         title: "Chapter " + (index + 1).toString(),
    //       ),
    //     );
    //   }, childCount: 6),
    // );
  }
}
