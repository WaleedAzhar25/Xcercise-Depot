import 'package:flutter/material.dart';
import 'package:xcercise_depot/utils/TextView.dart';
import 'package:xcercise_depot/utils/size-config.dart';


class InHouseCard extends StatelessWidget {
  const InHouseCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: SizeConfig.heightMultiplier * 14,
        width: SizeConfig.widthMultiplier * 93,
        child: Card(
          shape: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 3,
          child: Row(
            children: [
              Container(
                width: SizeConfig.widthMultiplier * 27,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://toppng.com/uploads/preview/diamond-necklace-jewelry-png-11552294270iudqnkqw81.png')),
                    borderRadius: BorderRadius.circular(8)),
              ),
              SizedBox(
                width: SizeConfig.widthMultiplier * 5,
              ),
              Container(
                width: SizeConfig.heightMultiplier * 24,
                child: TextView(
                  maxLines: 2,
                  textAlign: TextAlign.start,
                  textOverflow: TextOverflow.ellipsis,
                  text:
                  'Diamond necklace jewelry png PNG image with transparent background | TOPpngVisit',
                  size: SizeConfig.textMultiplier * 1.7,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[500],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
