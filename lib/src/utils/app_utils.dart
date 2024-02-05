import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import '../../service/routes/routes_name.dart';
import '../constants/colors_const.dart';
import '../widgets/small_text.dart';
import 'package:audioplayers/audioplayers.dart';

class AppUtils {


  static const String policyUrl = "https://www.termsfeed.com/live/dc3be405-be9b-4c1a-90c0-0678fdcc4829";


  static Future playAudio() async {
    final player = AudioPlayer();
    player.play(AssetSource('mouse-click-153941.mp3'));

  }

  static Future playAudioCard() async {
    final player = AudioPlayer();
    player.play(AssetSource('button-124476.mp3'));

  }

  static final box = Hive.box('FlutterGameBox');

  static void errorMessageDialog(BuildContext context, String message) async {
    bool? result = await showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: Dialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16.0))),
              insetPadding: const EdgeInsets.only(left: 20, right: 20),
              backgroundColor: Colors.white,
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop(true);
                          },
                          child: const Padding(
                            padding: EdgeInsets.only(right: 8.0, top: 8),
                            child: Icon(Icons.cancel,
                                color: ColorConst.appBackgroundColor),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 8),
                      child: SmallText(
                          text: message,
                          size: 16,
                          fontWidget: FontWeight.w600,
                          textAlign: TextAlign.center),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop(true);
                      },
                      child: Container(
                        padding: const EdgeInsets.only(
                            left: 14, right: 14, top: 8, bottom: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: ColorConst.appBackgroundColor),
                        child: const SmallText(
                          text: "ok",
                          size: 16,
                          fontWidget: FontWeight.w600,
                          textAlign: TextAlign.center,
                          color: ColorConst.whiteColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
    if (result ?? true) {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacementNamed(MainRoutes.splash_screen);
      AppUtils.box.delete("IS_USER_LOGGED_IN");
    }
  }

  static Widget buttonLoader =  const CupertinoActivityIndicator(
    radius: 20,
    color: ColorConst.whiteColor,
  );




  static void showSnackBar(BuildContext context, String message) {
    final snackdemo = SnackBar(
      content: Center(
        child: Text(
          message,
          style: GoogleFonts.lato(
            textStyle: Theme.of(context).textTheme.bodyMedium,
            color: ColorConst.whiteColor,
            fontStyle: FontStyle.normal,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      backgroundColor: ColorConst.appBackgroundColor,
      elevation: 30,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(50),
      duration: const Duration(milliseconds: 600),
      shape: const StadiumBorder(),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackdemo);
  }
}
