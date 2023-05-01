import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:xcercise_depot/View/BottomNav/Components/Categories/Components/specific_category.dart';
import 'package:xcercise_depot/View/BottomNav/Components/Categories/widgets/category_card.dart';
import 'package:xcercise_depot/model/categoryitem.dart';
import 'package:xcercise_depot/utils/TextView.dart';
import 'package:xcercise_depot/utils/constants.dart';
import 'package:xcercise_depot/utils/size-config.dart';




class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  bool enable = true;

  loadData() async {
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      enable = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: SizeConfig.heightMultiplier * 20,
              width: SizeConfig.widthMultiplier * 100,
              color: AppColors.primarycolor,
              child: SafeArea(
                child: Padding(
                  padding:
                      EdgeInsets.only(bottom: SizeConfig.heightMultiplier * 2),
                  child: Row(
                    children: [
                      SizedBox(
                        width: SizeConfig.widthMultiplier * 3,
                      ),
                      TextView(
                        text: 'All Categories',
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        size: SizeConfig.textMultiplier * 2.5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: SizeConfig.heightMultiplier * 10),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: categoryList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: SizeConfig.heightMultiplier * 21,
                    crossAxisCount: 3,
                    mainAxisSpacing: SizeConfig.heightMultiplier * 1),
                itemBuilder: (BuildContext context, int index) {
               if(enable){
                 return Shimmer.fromColors(
                   baseColor: Colors.grey.shade300,
                   highlightColor: Colors.grey.shade100,
                   enabled: true,
                   child: CategoryCard(
                     image: categoryList[index].image,
                     categoryText: categoryList[index].title,
                   ),
                 );
               }else{
                 return InkWell(
                   onTap: () {
                     Get.to(const SpecificCategory());
                   },
                   child: CategoryCard(
                     image: categoryList[index].image,
                     categoryText: categoryList[index].title,
                   ),
                 );
               }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
