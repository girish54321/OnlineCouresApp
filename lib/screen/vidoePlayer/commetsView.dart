import 'package:flutter/material.dart';
import 'package:OnlineCouresApp/widget/listItems.dart';

class Usercomments {
  final String userName;
  final String comment;
  final bool verified;

  Usercomments(
    this.userName,
    this.comment,
    this.verified,
  );
}

class VideoComments extends StatefulWidget {
  VideoComments({Key key}) : super(key: key);

  @override
  _VideoCommentsState createState() => _VideoCommentsState();
}

class _VideoCommentsState extends State<VideoComments>
    with AutomaticKeepAliveClientMixin<VideoComments> {
  bool get wantKeepAlive => true;

  List<Usercomments> usercomment = [
    Usercomments(
        "Dalibor Aram Alunni",
        "Thank you Facebook, I can now farm without going outside, cook without being in my kitchen, feed fish I don't have & waste an entire day without having a life.",
        true),
    Usercomments(
        "Wigberht Viktorija Madden",
        "After one look at this planet any visitor from outer space would say “I WANT TO SEE THE MANAGER.”",
        false),
    Usercomments(
        "Madeline Morris",
        "I saw six men kicking and punching the mother-in-law. My neighbor said “Are you going to help?” I said, “No, Six should be enough.”",
        false),
    Usercomments(
        "Dave Barnes",
        "Some people come into our lives and leave footprints on our hearts, while others come into our lives and make us wanna leave footprints on their face.",
        false),
    Usercomments(
        "Freddie Barrett",
        "Thank you Facebook, I can now farm without going outside, cook without being in my kitchen, feed fish I don't have & waste an entire day without having a life.",
        true),
    Usercomments(
        "Clark Sutton",
        "Life is full of temporary situations, ultimately ending in a permanent solution.",
        false),
    Usercomments(
        "Freddie Barrett",
        "I saw six men kicking and punching the mother-in-law. My neighbor said “Are you going to help?” I said, “No, Six should be enough.”",
        true),
    Usercomments("Jessie Silva",
        "Suicide would be my way of telling God that I quit.", false),
    Usercomments(
        "Traci Patton",
        "WDon't you find it Funny that after Monday(M) and Tuesday(T), the rest of the week says WTF?",
        false),
    Usercomments(
        "Jackie Santiago",
        "I told my wife the truth. I told her I was seeing a psychiatrist. Then she told me the truth: that she was seeing a psychiatrist, two plumbers, and a bartender.",
        true),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 0),
        itemCount: usercomment.length,
        itemBuilder: (context, index) {
          Usercomments comment = usercomment[index];
          return CommentListItem(
            comment: comment.comment,
            imageUrl: "https://randomuser.me/api/portraits/men/$index.jpg",
            time: "2018-08-08 17:24:22",
            userName: comment.userName,
            verified: comment.verified,
          );
        });
    // return SliverList(
    //   delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
    //     Usercomments comment = usercomment[index];
    //     return CommentListItem(
    //       comment: comment.comment,
    //       imageUrl: "https://randomuser.me/api/portraits/men/$index.jpg",
    //       time: "2018-08-08 17:24:22",
    //       userName: comment.userName,
    //       verified: comment.verified,
    //     );
    //   }, childCount: 6),
    // );
  }
}
