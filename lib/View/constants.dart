import 'package:flutter/material.dart';

// const AccentColor = Color(0xFFF16823);
const AccentColor = Color(0xffD34123);
const TextFillColor = Colors.grey;
const ActiveTextSliderColor = Colors.white;
const InactiveTextSliderColor = Colors.black;
const ActiveCardColor = Color(0xFFF16823);
const InactiveCardColor = Colors.white;
const InactiveBottomNavigationActiveColor = Colors.grey;
const ActiveBottomNavigationActiveColor = Color(0xFFF16823);
const kDefaultColour = Color.fromARGB(255, 116, 238, 21);
const kAppBarTitleTextStyle =
TextStyle(color: kDefaultColour, fontWeight: FontWeight.bold, fontSize: 18);
const kQRButtonTextStyle =
TextStyle(color: kDefaultColour, fontWeight: FontWeight.bold, fontSize: 17);
const kQRGeneratorButtonTextStyle =
TextStyle(color: kDefaultColour, fontWeight: FontWeight.bold, fontSize: 25);
const primaryText = TextStyle(color: AccentColor, fontSize: 16);
ButtonStyle themeElevatedButtonStyleFrom = ElevatedButton.styleFrom(
  textStyle:
  const TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
  primary: AccentColor,
  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.0)),
);

Widget loading(context){
  return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child:
      const Center(child: CircularProgressIndicator()));
}
