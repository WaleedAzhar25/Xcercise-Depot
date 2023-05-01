import 'package:flutter/material.dart';
import 'package:xcercise_depot/utils/TextView.dart';
import 'package:xcercise_depot/utils/constants.dart';
import 'package:xcercise_depot/utils/size-config.dart';



class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String offPrice;
  final String productImage;

  const ProductCard(
      {Key? key,
        required this.title,
        required this.price,
        required this.offPrice,
        required this.productImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            bottom: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: SizeConfig.widthMultiplier * 3),
                    height: SizeConfig.heightMultiplier * 4,
                    width: SizeConfig.widthMultiplier * 8,
                    decoration: BoxDecoration(
                        color: Colors.grey[300], shape: BoxShape.circle),
                    child: Center(
                      child: Icon(Icons.favorite_border),
                    ),
                  ),
                ),

                SizedBox(
                  height: SizeConfig.heightMultiplier * 1,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                      height: SizeConfig.heightMultiplier * 12,
                      width: SizeConfig.widthMultiplier * 20,
                      child: Image.network(
                        productImage,
                        fit: BoxFit.cover,
                      )),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 1,
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: SizeConfig.widthMultiplier * 4),
                  child: TextView(
                    textOverflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    text: title,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 1,
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: SizeConfig.widthMultiplier * 4),
                  child: TextView(
                    line: TextDecoration.lineThrough,
                    textOverflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    text: '\$ ${offPrice}',
                    fontWeight: FontWeight.w500,
                    size: SizeConfig.textMultiplier * 1.8,
                    color: Colors.grey[600],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: SizeConfig.widthMultiplier * 4),
                  child: TextView(
                    textOverflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    fontWeight: FontWeight.w600,
                    text: '\$ ${price}',
                    size: SizeConfig.textMultiplier * 2.2,
                    color: AppColors.primarycolor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: AppColors.primarycolor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomRight: Radius.circular(6))),
            height: SizeConfig.heightMultiplier * 3,
            width: SizeConfig.widthMultiplier * 12,
            child: Center(
              child: TextView(
                text: '- 21%',
                color: Colors.white,
                size: SizeConfig.textMultiplier * 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
