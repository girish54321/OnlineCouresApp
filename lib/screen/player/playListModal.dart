import 'package:flutter/material.dart';
import 'package:OnlineCouresApp/widget/listItems.dart';

class PlayListModal {
  mainBottomSheet(
    BuildContext context,
    list,
    index,
  ) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Container(
              height: 360,
              color: Colors.transparent,
              padding: EdgeInsets.only(
                  left: 4,
                  right: 4,
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: ListView(
                children: [
                  ...List.generate(20, (i) {
                    return CoursesListItem(
                      isPlaying: index == i ? true : false,
                      number: (i + 1).toString(),
                      title: "Chapter" + (i + 1).toString(),
                    );
                  })
                ],
              ),
            ),
          );
        });
  }
}
