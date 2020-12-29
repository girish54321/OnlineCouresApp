import 'package:OnlineCouresApp/helper/theme.dart';
import 'package:OnlineCouresApp/screen/homeMain/homeMain.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<ThemeNotifier>(
              create: (context) => ThemeNotifier()),
        ],
        child: Consumer<ThemeNotifier>(
          builder: (context, ThemeNotifier notifier, child) {
            return MaterialApp(
                theme: notifier.darkTheme ? dark : light,
                title: 'OnlineCoures',
                home: HomeMain());
          },
        ));
  }
}
