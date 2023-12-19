import 'package:flutter/material.dart';
import 'package:tictacgame/src/constants/colors_const.dart';
import 'package:tictacgame/src/widgets/small_text.dart';
import '../../service/routes/routes_name.dart';
import '../../src/widgets/big_text_widget.dart';
import '../../src/widgets/custom_loading/customloading.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _animatedController;
  late CurvedAnimation _curvedAnimation;
  bool visibleButton = false;
  bool isUserRegistered = false;

  @override
  void initState() {
    super.initState();
    init();
  }


  init() {
    _animatedController =
    AnimationController(duration: const Duration(seconds: 3), vsync: this)
      ..forward()
      ..addStatusListener((status) async {
        if (status == AnimationStatus.completed)   {
          Navigator.of(context).pushReplacementNamed(MainRoutes.my_main_page);
        }
      });
    _curvedAnimation =
        CurvedAnimation(parent: _animatedController, curve: Curves.decelerate);
  }

  @override
  void dispose() {
    super.dispose();
    _animatedController.dispose();
  }

  void restartAnimation() {
    if (!_animatedController.isAnimating) {
      _animatedController.reset();
      _animatedController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:  const BoxDecoration(
            gradient:  LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                ColorConst.dashboardCardColorBlue,
                ColorConst.appBackgroundColor,
                ColorConst.callAvatarBeckColor
              ],
            )),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Spacer(),
              const Spacer(),
              ScaleTransition(
                  scale: Tween(begin: 0.8, end: 1.0).animate(_curvedAnimation),
                  child: SizedBox(
                    width: 250,
                    height: 250,
                    child:
                    Image.asset('assets/TicTacToe.png', fit: BoxFit.fill),
                  ),
                ),
              const BigText(text: "TicTacToe",fontWidget: FontWeight.bold,size: 38,color: ColorConst.whiteColor),
              const Spacer(),
              Stack(
                children: [
                  CustomLoading(),
                   const Positioned(
                    top: 30,
                    right: 60,
                    child:  BigText(text: "Loading...",size: 25, color: ColorConst.whiteColor,),)
                ],
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}