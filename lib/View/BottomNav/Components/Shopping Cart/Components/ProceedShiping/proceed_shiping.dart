import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcercise_depot/View/BottomNav/Components/Shopping%20Cart/Components/ProceedShiping/ChooseDelivery/choosedelivery.dart';
import 'package:xcercise_depot/View/BottomNav/Components/Shopping%20Cart/Components/ProceedShiping/widgets/shippingcard.dart';
import 'package:xcercise_depot/utils/TextView.dart';
import 'package:xcercise_depot/utils/constants.dart';
import 'package:xcercise_depot/utils/size-config.dart';



class ProceedShipping extends StatefulWidget {
  const ProceedShipping({Key? key}) : super(key: key);

  @override
  State<ProceedShipping> createState() => _ProceedShippingState();
}

class _ProceedShippingState extends State<ProceedShipping> {
  int select = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(size: 22, color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: true,
        title: TextView(
          text: 'Shipping Info',
          color: Colors.black,
          size: SizeConfig.textMultiplier * 2.2,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () {
                setState(() {
                  select = index;
                });
              },
              child: ShippingCard(
                color: select == index ? AppColors.primarycolor : Colors.white,
                icon: select == index ? 1 : 0,
              ));
        },
        itemCount: 5,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        margin: EdgeInsets.symmetric(
            vertical: SizeConfig.heightMultiplier * 2,
            horizontal: SizeConfig.widthMultiplier * 2),
        child: ElevatedButton(
            style: ButtonStyle(
              maximumSize: MaterialStateProperty.all(
                Size(SizeConfig.widthMultiplier * 60,
                    SizeConfig.heightMultiplier * 7),
              ),
              minimumSize: MaterialStateProperty.all(
                Size(SizeConfig.widthMultiplier * 60,
                    SizeConfig.heightMultiplier * 7),
              ),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
              backgroundColor: MaterialStateProperty.all(
                AppColors.primarycolor,
              ),
            ),
            onPressed: () {
              Get.to(ChooseDelivery(
                price: '20',
              ));
            },
            child: TextView(
              text: 'Continue to Delivery info',
              color: Colors.white,
              fontWeight: FontWeight.w500,
              size: SizeConfig.textMultiplier * 1.8,
            )),
      ),
    );
  }
}
