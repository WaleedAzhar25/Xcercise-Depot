import 'package:flutter/material.dart';
import 'package:xcercise_depot/utils/TextView.dart';
import 'package:xcercise_depot/utils/size-config.dart';


class ShippingCard extends StatelessWidget {
  final Color color;
  final int icon;

  const ShippingCard({
    Key? key,
    required this.color,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.heightMultiplier * 25,
      margin: EdgeInsets.symmetric(
        horizontal: SizeConfig.widthMultiplier * 4,
      ),
      child: Card(
        elevation: 3,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: color, width: 1.8)),
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: SizeConfig.heightMultiplier * 1,
              ),
              Row(
                children: [
                  Container(
                    width: SizeConfig.widthMultiplier * 22,
                    child: TextView(
                      text: 'Address',
                      fontWeight: FontWeight.w500,
                      size: SizeConfig.textMultiplier * 1.8,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.widthMultiplier * 3,
                  ),
                  TextView(
                    text: 'f',
                    fontWeight: FontWeight.w600,
                    size: SizeConfig.textMultiplier * 1.8,
                    color: Colors.black,
                  ),
                  Spacer(),
                  icon==1?Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 20,
                  ):Container()
                ],
              ),
              Row(
                children: [
                  Container(
                    width: SizeConfig.widthMultiplier * 22,
                    child: TextView(
                      text: 'City',
                      fontWeight: FontWeight.w500,
                      size: SizeConfig.textMultiplier * 1.8,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.widthMultiplier * 3,
                  ),
                  TextView(
                    text: 'f',
                    fontWeight: FontWeight.w600,
                    size: SizeConfig.textMultiplier * 1.8,
                    color: Colors.black,
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: SizeConfig.widthMultiplier * 22,
                    child: TextView(
                      text: 'State',
                      fontWeight: FontWeight.w500,
                      size: SizeConfig.textMultiplier * 1.8,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.widthMultiplier * 3,
                  ),
                  TextView(
                    text: 'f',
                    fontWeight: FontWeight.w600,
                    size: SizeConfig.textMultiplier * 1.8,
                    color: Colors.black,
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: SizeConfig.widthMultiplier * 22,
                    child: TextView(
                      text: 'Country',
                      fontWeight: FontWeight.w500,
                      size: SizeConfig.textMultiplier * 1.8,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.widthMultiplier * 3,
                  ),
                  TextView(
                    text: 'f',
                    fontWeight: FontWeight.w600,
                    size: SizeConfig.textMultiplier * 1.8,
                    color: Colors.black,
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: SizeConfig.widthMultiplier * 22,
                    child: TextView(
                      text: 'Postal Code',
                      fontWeight: FontWeight.w500,
                      size: SizeConfig.textMultiplier * 1.8,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.widthMultiplier * 3,
                  ),
                  TextView(
                    text: 'f',
                    fontWeight: FontWeight.w600,
                    size: SizeConfig.textMultiplier * 1.8,
                    color: Colors.black,
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: SizeConfig.widthMultiplier * 22,
                    child: TextView(
                      text: 'Phone',
                      fontWeight: FontWeight.w500,
                      size: SizeConfig.textMultiplier * 1.8,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.widthMultiplier * 3,
                  ),
                  TextView(
                    text: 'f',
                    fontWeight: FontWeight.w600,
                    size: SizeConfig.textMultiplier * 1.8,
                    color: Colors.black,
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
