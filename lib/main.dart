import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:tictacgame/service/routes/app_routes.dart';
import 'package:tictacgame/service/routes/navigator_service.dart';
import 'package:upgrader/upgrader.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ));
  await Hive.initFlutter();
  await Hive.openBox('FlutterGameBox'); //  TODO: Hivedan foydalanish
  runApp(const MyApp());
}
class MyApp extends StatefulWidget  {
  static NavigationService navigationService = NavigationService();
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.latoTextTheme(),
        ),
        title: 'Game App',
        navigatorKey: MyApp.navigationService.navigatorKey,
        home: UpgradeAlert(
          upgrader: Upgrader(
              canDismissDialog: true,
              shouldPopScope: () => true,
              cupertinoButtonTextStyle: GoogleFonts.sacramento(
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal),
              durationUntilAlertAgain: const Duration(days: 1),
              dialogStyle: Platform.isIOS ?  UpgradeDialogStyle.cupertino : UpgradeDialogStyle.material
          ),
          child: const MainNavigator(),
        )
    );
  }
}