import 'package:OnlineCouresApp/helper/helper.dart';
import 'package:OnlineCouresApp/widget/appInputText.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:rules/rules.dart';

class CommentModal {
  mainBottomSheet(
      BuildContext context, TextEditingController commentsController) {
    final _formKey = GlobalKey<FormState>();
    showModalBottomSheet(
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(6.0),
        // ),
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Container(
              color: Colors.transparent,
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Container(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 14),
                          Text(
                            "Enter Your Comments",
                            style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).accentColor,
                            ),
                          ),
                          AppInputText(
                              rightIcon: IconButton(
                                  icon: Icon(
                                    EvaIcons.navigation2,
                                    color: Theme.of(context).accentColor,
                                  ),
                                  onPressed: () {
                                    if (_formKey.currentState.validate()) {
                                      commentsController.clear();
                                      Helper()
                                          .showToastMessage("Comment Added");
                                      Navigator.pop(context);
                                    } else {}
                                  }),
                              password: false,
                              hint: "Comments",
                              textEditingController: commentsController,
                              validator: (email) {
                                final commetRule = Rule(
                                  email,
                                  name: 'Comments',
                                  isRequired: true,
                                );
                                if (commetRule.hasError) {
                                  return commetRule.error;
                                } else {
                                  return null;
                                }
                              }),
                        ],
                      ),
                    ),
                  )),
            ),
          );
        });
  }

  ListTile _createTile(
      BuildContext context, String title, String prise, Function action) {
    return ListTile(
      leading: new Text(
        title,
        style: TextStyle(
          fontSize: 16,
          color: Color(0xff000000),
        ),
      ),
      // title: Text(name),
      trailing: new Text(
        prise,
        textAlign: TextAlign.right,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 18,
          color: Color(0xff000000),
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        action();
      },
    );
  }

  _action3() {
    print('action 3');
  }
}

class TotalaAmountView extends StatefulWidget {
  @override
  _TotalaAmountViewState createState() => _TotalaAmountViewState();
}

class _TotalaAmountViewState extends State<TotalaAmountView> {
  ListTile _createTile(
      BuildContext context, String title, String prise, Function action) {
    return ListTile(
      leading: new Text(
        title,
        style: TextStyle(
          fontSize: 16,
          color: Color(0xff000000),
        ),
      ),
      // title: Text(name),
      trailing: new Text(
        prise,
        textAlign: TextAlign.right,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 18,
          color: Color(0xff000000),
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        action();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        children: [
          SizedBox(
            height: 12,
          ),
          _createTile(context, 'Sub Total', "2000", () {
            print('action 3');
          }),
          Divider(),
          _createTile(context, 'Tex', "100", () {
            print('action 3');
          }),
          Divider(),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: TextField(
              decoration: new InputDecoration(
                suffixIcon: FlatButton(
                  onPressed: () {},
                  child: Text(
                    "APPLY",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "SF Pro Text",
                      fontSize: 14,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.greenAccent, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                ),
                hintText: 'Enter Voucher Code',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
