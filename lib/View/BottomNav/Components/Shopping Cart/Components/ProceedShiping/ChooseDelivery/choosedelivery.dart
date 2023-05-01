import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:xcercise_depot/View/BottomNav/Components/Shopping%20Cart/Components/PaymentCheckout/paymentcheckout.dart';
import 'package:xcercise_depot/View/BottomNav/Components/Shopping%20Cart/Components/ProceedShiping/ChooseDelivery/widgets/inhouseCard.dart';
import 'package:xcercise_depot/utils/TextView.dart';
import 'package:xcercise_depot/utils/constants.dart';
import 'package:xcercise_depot/utils/size-config.dart';


enum _a { a, d }

class ChooseDelivery extends StatefulWidget {
  final String price;

  const ChooseDelivery({Key? key, required this.price}) : super(key: key);

  @override
  State<ChooseDelivery> createState() => _ChooseDeliveryState();
}

class _ChooseDeliveryState extends State<ChooseDelivery> {
  bool tr = true;

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
          text: 'Shipping Info \$${widget.price}',
          color: Colors.black,
          size: SizeConfig.textMultiplier * 2.2,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.heightMultiplier * 2,
                  horizontal: SizeConfig.widthMultiplier * 3),
              child: TextView(
                text: 'Inhouse',
                color: AppColors.primarycolor,
                size: SizeConfig.textMultiplier * 2.1,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                // return null;

                return InHouseCard();
              },
              itemCount: 1,
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 2,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: SizeConfig.widthMultiplier * 2),
              child: TextView(
                text: 'Choose Delivery',
                size: SizeConfig.textMultiplier * 2.2,
                color: Colors.grey[700],
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 1,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: SizeConfig.widthMultiplier * 4),
              child: Row(
                children: [
                  Container(
                    width: SizeConfig.widthMultiplier * 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.primarycolor,
                    ),
                    child: Row(
                      children: [
                        Radio(
                          fillColor: MaterialStateProperty.all(Colors.white),
                          activeColor: Colors.black,
                          value: _a.d,
                          groupValue: _a.values,
                          onChanged: (value) {
                            setState(() {
                              _a.d == value;
                            });
                          },
                        ),
                        TextView(
                          text: 'Home Delivery',
                          size: SizeConfig.textMultiplier * 1.9,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.widthMultiplier * 2,
                  ),
                  Container(
                    width: SizeConfig.widthMultiplier * 40,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.primarycolor),
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xffFEEAD1),
                    ),
                    child: Row(
                      children: [
                        Radio(
                          fillColor:
                              MaterialStateProperty.all(AppColors.primarycolor),
                          activeColor: Colors.black,
                          value: _a.d,
                          groupValue: _a.values,
                          onChanged: (value) {
                            setState(() {
                              _a.d == value;
                            });
                          },
                        ),
                        TextView(
                          text: 'Pickup Point',
                          size: SizeConfig.textMultiplier * 1.9,
                          color: AppColors.primarycolor,
                          fontWeight: FontWeight.w400,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
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
              // Get.to(PaymentCheckout());
            },
            child: TextView(
              text: 'Proceed to checkout',
              color: Colors.white,
              fontWeight: FontWeight.w500,
              size: SizeConfig.textMultiplier * 1.8,
            )),
      ),
    );
  }
}
