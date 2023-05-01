import 'package:flutter/material.dart';
import 'package:xcercise_depot/utils/TextView.dart';
import 'package:xcercise_depot/utils/size-config.dart';



class PayMentCard extends StatelessWidget {
  final Color color;
  final int icon;
  const PayMentCard({Key? key, required this.color, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: EdgeInsets.only(
          bottom: SizeConfig.heightMultiplier*1
        ),
        height: SizeConfig.heightMultiplier * 14,
        child: Card(
          shape: OutlineInputBorder(
            borderSide: BorderSide(width: 1.5,color: color),
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 3,
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: SizeConfig.widthMultiplier * 3),
                height: SizeConfig.heightMultiplier * 8,
                width: SizeConfig.widthMultiplier * 28,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          'https://cdn.pixabay.com/photo/2015/05/26/09/37/paypal-784403__340.png')),
                ),
              ),
              SizedBox(
                width: SizeConfig.widthMultiplier * 3,
              ),
              Container(
                width: SizeConfig.heightMultiplier * 24,
                child: TextView(
                  maxLines: 2,
                  textAlign: TextAlign.start,
                  textOverflow: TextOverflow.ellipsis,
                  text: 'Checkout with paypal',
                  size: SizeConfig.textMultiplier * 1.9,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[500],
                ),
              ),
              Spacer(),
              icon==1?Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 20,
                  ),
                ),
              ):Container()
            ],
          ),
        ),
      ),
    );
  }
}
