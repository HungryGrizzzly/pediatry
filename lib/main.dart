import 'package:flutter/material.dart';
import 'package:pediatry/main_page.dart';
import 'package:flutter/services.dart';
import 'package:pediatry/constants.dart';
import 'activities/testing_activity/testing_activity.dart';
import 'activities/profile_activity.dart';
import 'routes/slide_right_route.dart';
import 'activities/news_activity.dart';
import 'models/news.dart';
import 'activities/translation_activity.dart';
import 'activities/details_activity/details_activity.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
    ));

    return MaterialApp(
      home: MainPage(),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return SlideRightRoute(widget: MainPage());
          case '/profile':
            return SlideRightRoute(widget: ProfileActivity());
          case '/testing':
            return SlideRightRoute(widget: TestingActivity());
          case '/news':
            final NewsArguments args = settings.arguments;
            return MaterialPageRoute(builder: (context) {
              return NewsActivity(
                title: args.title,
                url: args.url,
                heroTag: args.heroTag,
              );
            });
          case '/translation':
            return SlideRightRoute(widget: TranslationActivity());
            case '/details':
            return SlideRightRoute(widget: DetailsActivity());
        }
      },
      title: 'pediatry',
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: ACCENT_COLOR,
        brightness: Brightness.light,
        fontFamily: 'Gotham',
        splashColor: ACCENT_COLOR,
      ),
    );
  }
}
