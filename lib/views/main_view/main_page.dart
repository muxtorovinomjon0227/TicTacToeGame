import 'package:flutter/material.dart';import 'package:tictacgame/src/controllers/enter_number_cont.dart';import 'package:tictacgame/src/extension/context_extensions.dart';import 'package:tictacgame/src/utils/app_utils.dart';import '../../service/routes/routes_name.dart';import '../../src/constants/colors_const.dart';import '../../src/widgets/custom_button/custom_button.dart';class MainPage extends StatelessWidget {  final NumberController controller;  const MainPage({super.key, required this.controller});  @override  Widget build(BuildContext context) {    return Scaffold(      body: Container(        decoration: const BoxDecoration(            gradient: LinearGradient(          begin: Alignment.topCenter,          end: Alignment.bottomCenter,          colors: [            ColorConst.dashboardCardColorBlue,            ColorConst.appBackgroundColor,            ColorConst.callAvatarBeckColor          ],        )),        child: buildUi(context),      ),    );  }  Widget buildUi(BuildContext context) {    return Container(     margin:  EdgeInsets.symmetric(horizontal: context.w*0.05),     child: Column(      children: [        SizedBox(height: context.h*0.1),        Image.asset("assets/icon-adaptive-foreground.png",color: ColorConst.callConnectColor),        CustomButton(isLoading: false,          colors: ColorConst.blueColor,          icon: Image.asset("assets/settings.png",color: ColorConst.whiteColor,width: 50),          height: 50,          onPressed: () {          AppUtils.playAudio();          }, title: 'Settings',),        SizedBox(height: context.h*0.03),        CustomButton(isLoading: false,          colors: ColorConst.toggleBtnColor,          icon: Image.asset("assets/Privacy Policy.png",color: ColorConst.whiteColor,width: 50),          height: 50,          onPressed: () {            AppUtils.playAudio();          }, title: 'Privacy Policy',),        SizedBox(height: context.h*0.03),        CustomButton(isLoading: false,          colors: ColorConst.dashboardCardColorGreen,          icon: Image.asset("assets/play.png",color: ColorConst.whiteColor,width: 40),          height: 50,          onPressed: () {            AppUtils.playAudio();            Navigator.of(context).pushNamed(MainRoutes.HomePage);          }, title: 'Play',),      ],     ),    );  }}