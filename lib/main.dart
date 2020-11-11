import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:http_example/main_page.dart';
import 'package:http_example/post_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final cupertinoTheme = new CupertinoThemeData(
    primaryColor: CupertinoDynamicColor.withBrightness(
      color: Colors.purple,
      darkColor: Colors.cyan,
    ),
  );

  final materialTheme = new ThemeData(
    primarySwatch: Colors.purple,
  );

  @override
  Widget build(BuildContext context) {
    return PlatformApp(
      material: (context, platform) => MaterialAppData(
        theme: materialTheme,
      ),
      cupertino: (context, platform) => CupertinoAppData(
        theme: cupertinoTheme,
      ),
      home: ChangeNotifierProvider<PostProvider>(
        create: (context) => PostProvider(),
        child: MainPage(),
      ),
    );
  }
}

