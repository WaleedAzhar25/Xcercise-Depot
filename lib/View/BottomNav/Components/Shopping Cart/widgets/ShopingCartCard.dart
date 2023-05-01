import 'package:flutter/material.dart';
import 'package:xcercise_depot/utils/TextView.dart';
import 'package:xcercise_depot/utils/size-config.dart';



class ShopingCartCard extends StatelessWidget {
  const ShopingCartCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: SizeConfig.widthMultiplier * 1,
          vertical: SizeConfig.heightMultiplier * .6),
      child: Card(
        elevation: 5,
        shape: OutlineInputBorder(
            borderSide: const BorderSide(width: 0, color: Colors.transparent),
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(right: SizeConfig.widthMultiplier * 2),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://images.pexels.com/photos/1280162/pexels-photo-1280162.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500')),
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      topLeft: Radius.circular(12))),
              width: SizeConfig.widthMultiplier * 27,
              height: SizeConfig.heightMultiplier * 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: SizeConfig.heightMultiplier * 3,
                ),
                TextView(
                  text: 'Full Sleve T-Shirt',
                  size: SizeConfig.textMultiplier * 2,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 1,
                ),
                TextView(
                  text: 'Size: Medium',
                  size: SizeConfig.textMultiplier * 1.8,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 1,
                ),
                Container(
                  width: SizeConfig.widthMultiplier * 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextView(
                        text: '\$ 998',
                        size: SizeConfig.textMultiplier * 2.2,
                        fontWeight: FontWeight.bold,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.grey)),
                        width: SizeConfig.widthMultiplier * 25,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: SizeConfig.widthMultiplier * 1,
                            ),
                            Container(
                                margin: EdgeInsets.only(
                                    bottom: SizeConfig.heightMultiplier * 1),
                                child: Icon(
                                  Icons.minimize_rounded,
                                  size: 18,
                                )),
                            TextView(text: '1'),
                            Icon(
                              Icons.add,
                              size: 18,
                            ),
                            SizedBox(
                              width: SizeConfig.widthMultiplier * 1,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Container(
                margin: EdgeInsets.symmetric(
                    vertical: SizeConfig.heightMultiplier * 1),
                child: Icon((Icons.close)))
          ],
        ),
      ),
    );
  }
}
