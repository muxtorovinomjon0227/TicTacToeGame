// ignore_for_file: body_might_complete_normally_nullable
import 'package:flutter/material.dart';
import 'package:tictacgame/service/routes/routes_name.dart';
import '../../views/home_view/home_page.dart';
import '../../src/controllers/enter_number_cont.dart';
import '../../views/main_view/main_page.dart';
import '../../views/splash_view/splash_screen.dart';


GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final NumberController _controller = NumberController();


class MainNavigator extends StatelessWidget {
  const MainNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        var canPop = navigatorKey.currentState?.canPop() ?? false;
        if (canPop) {
          navigatorKey.currentState?.pop();
        }
        return !canPop;
      },
      child: Navigator(
        key: navigatorKey,
        initialRoute: MainRoutes.splash_screen,
        onGenerateRoute: (RouteSettings settings) {
          WidgetBuilder? builder;
          switch (settings.name) {
            case MainRoutes.splash_screen:
              builder = (BuildContext _) => const SplashScreen();
              break;
              case MainRoutes.HomePage:
              builder = (BuildContext _) => const HomePage();
              break;
              case MainRoutes.my_main_page:
              builder = (BuildContext _) => MainPage(controller: _controller);
              break;
          }
          if (builder != null) {
            return MaterialPageRoute(builder: builder, settings: settings);
          }
        },
        onPopPage: (Route<dynamic> route, dynamic result) {
          return route.didPop(result);
        },
      ),
    );
  }
}