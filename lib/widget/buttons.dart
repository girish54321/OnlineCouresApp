import 'package:flutter/material.dart';

class BlackButton extends StatelessWidget {
  final String buttonText;
  final Function function;

  const BlackButton(
      {Key key, @required this.buttonText, @required this.function})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      onPressed: function,
      color: Theme.of(context).accentColor,
      textColor: Colors.white,
      child: Container(
        height: 55,
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class BuyButton extends StatelessWidget {
  final Widget child;
  final Function function;
  const BuyButton({Key key, this.child, this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.0),
          side: BorderSide(color: Theme.of(context).accentColor)),
      color: Theme.of(context).accentColor,
      textColor: Colors.white,
      padding: EdgeInsets.all(8.0),
      onPressed: function,
      child: child,
    );
  }
}
