// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shimmer/shimmer.dart';
// import 'package:xcercise_depot/utils/TextView.dart';
// import 'package:xcercise_depot/utils/constants.dart';
// import 'package:xcercise_depot/utils/size-config.dart';
//
//
// enum BestTutorSite {
//   defaul,
//   lowtohigh,
//   hightolow,
//   popularity,
//   toprated,
//   newarrival
// }
//
// class SearchPage extends StatefulWidget {
//   const SearchPage({Key? key}) : super(key: key);
//
//   @override
//   State<SearchPage> createState() => _SearchPageState();
// }
//
// class _SearchPageState extends State<SearchPage> {
//   bool enable = true;
//
//   loadData() async {
//     await Future.delayed(Duration(seconds: 3));
//     setState(() {
//       enable = false;
//     });
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     loadData();
//   }  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
//
//   BestTutorSite _site = BestTutorSite.defaul;
//   bool value = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: scaffoldKey,
//       endDrawer: CustomDrawer(),
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         actions: <Widget>[
//           new Container(),
//         ],
//         elevation: 0,
//         iconTheme: IconThemeData(
//           color: Colors.black,
//         ),
//         backgroundColor: Colors.white,
//         automaticallyImplyLeading: true,
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Expanded(
//               child: Container(
//                 height: SizeConfig.heightMultiplier * 5,
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                     contentPadding: EdgeInsets.all(8),
//                     filled: true,
//                     fillColor: Colors.grey[300],
//                     enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         borderSide:
//                             BorderSide(color: Colors.transparent, width: 0)),
//                     focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         borderSide: BorderSide(
//                             color: AppColors.primarycolor, width: 0.5)),
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         borderSide:
//                             BorderSide(color: Colors.transparent, width: 0)),
//                     hintText: 'Search here ?',
//                     hintStyle: TextStyle(
//                         color: Colors.grey[600],
//                         fontWeight: FontWeight.w500,
//                         fontSize: SizeConfig.textMultiplier * 1.6),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               width: SizeConfig.widthMultiplier * 2,
//             ),
//             IconButton(
//                 splashRadius: 20,
//                 onPressed: () {},
//                 icon: Icon(
//                   Icons.search,
//                   color: Colors.grey,
//                   size: 22,
//                 ))
//           ],
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               child: Card(
//                 elevation: 4,
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: InkWell(
//                         onTap: () {
//                           scaffoldKey.currentState!.openEndDrawer();
//                         },
//                         child: Container(
//                           height: SizeConfig.heightMultiplier * 4,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Icon(
//                                 Icons.filter_alt_outlined,
//                                 color: Colors.black,
//                               ),
//                               SizedBox(width: SizeConfig.widthMultiplier * 2),
//                               TextView(
//                                 text: 'Filter',
//                                 size: SizeConfig.textMultiplier * 1.5,
//                                 fontWeight: FontWeight.w400,
//                                 color: Colors.black,
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     VerticalDivider(
//                       thickness: 1,
//                       color: Colors.grey,
//                     ),
//                     Expanded(
//                       child: InkWell(
//                         onTap: () {
//                           showGeneralDialog(
//                             context: context,
//                             pageBuilder:
//                                 (context, animation, secondaryAnimation) {
//                               return Material(
//                                 color: Colors.black.withOpacity(0.5),
//                                 child: Align(
//                                   alignment: Alignment.center,
//                                   child: Container(
//                                     width: SizeConfig.widthMultiplier * 70,
//                                     height: SizeConfig.heightMultiplier * 50,
//                                     child: Card(
//                                       shape: OutlineInputBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(8)),
//                                       elevation: 4,
//                                       child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.center,
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: [
//                                           Align(
//                                             alignment: Alignment.centerLeft,
//                                             child: Container(
//                                               margin: EdgeInsets.symmetric(
//                                                   horizontal: SizeConfig
//                                                           .widthMultiplier *
//                                                       6),
//                                               child: TextView(
//                                                 text: 'Sort Products By',
//                                                 size:
//                                                     SizeConfig.textMultiplier *
//                                                         1.8,
//                                                 color: Colors.black,
//                                                 fontWeight: FontWeight.w500,
//                                               ),
//                                             ),
//                                           ),
//                                           ListTile(
//                                             title: TextView(
//                                               text: 'Default',
//                                               size: SizeConfig.textMultiplier *
//                                                   1.8,
//                                               color: Colors.black,
//                                               fontWeight: FontWeight.w400,
//                                             ),
//                                             leading: Radio(
//                                               activeColor: Colors.grey[600],
//                                               value: BestTutorSite.defaul,
//                                               groupValue: _site,
//                                               onChanged: (value) {
//                                                 setState(() {
//                                                   _site = value!;
//                                                 });
//                                               },
//                                             ),
//                                           ),
//                                           ListTile(
//                                             title: TextView(
//                                               text: 'Price high to low',
//                                               size: SizeConfig.textMultiplier *
//                                                   1.8,
//                                               color: Colors.black,
//                                               fontWeight: FontWeight.w400,
//                                             ),
//                                             leading: Radio(
//                                               activeColor: Colors.grey[600],
//                                               value: BestTutorSite.hightolow,
//                                               groupValue: _site,
//                                               onChanged: (value) {
//                                                 setState(() {
//                                                   _site = value!;
//                                                 });
//                                               },
//                                             ),
//                                           ),
//                                           ListTile(
//                                             title: TextView(
//                                               text: 'Price low to high',
//                                               size: SizeConfig.textMultiplier *
//                                                   1.8,
//                                               color: Colors.black,
//                                               fontWeight: FontWeight.w400,
//                                             ),
//                                             leading: Radio(
//                                               activeColor: Colors.grey[600],
//                                               value: BestTutorSite.lowtohigh,
//                                               groupValue: _site,
//                                               onChanged: (value) {
//                                                 setState(() {
//                                                   _site = value!;
//                                                 });
//                                               },
//                                             ),
//                                           ),
//                                           ListTile(
//                                             title: TextView(
//                                               text: 'New Arival',
//                                               size: SizeConfig.textMultiplier *
//                                                   1.8,
//                                               color: Colors.black,
//                                               fontWeight: FontWeight.w400,
//                                             ),
//                                             leading: Radio(
//                                               activeColor: Colors.grey[600],
//                                               value: BestTutorSite.newarrival,
//                                               groupValue: _site,
//                                               onChanged: (value) {
//                                                 setState(() {
//                                                   _site = value!;
//                                                 });
//                                               },
//                                             ),
//                                           ),
//                                           ListTile(
//                                             title: TextView(
//                                               text: 'Popularity',
//                                               size: SizeConfig.textMultiplier *
//                                                   1.8,
//                                               color: Colors.black,
//                                               fontWeight: FontWeight.w400,
//                                             ),
//                                             leading: Radio(
//                                               activeColor: Colors.grey[600],
//                                               value: BestTutorSite.popularity,
//                                               groupValue: _site,
//                                               onChanged: (value) {
//                                                 setState(() {
//                                                   _site = value!;
//                                                 });
//                                               },
//                                             ),
//                                           ),
//                                           ListTile(
//                                             title: TextView(
//                                               text: 'Top Rated',
//                                               size: SizeConfig.textMultiplier *
//                                                   1.8,
//                                               color: Colors.black,
//                                               fontWeight: FontWeight.w400,
//                                             ),
//                                             leading: Radio(
//                                               activeColor: Colors.grey[600],
//                                               value: BestTutorSite.toprated,
//                                               groupValue: _site,
//                                               onChanged: (value) {
//                                                 setState(() {
//                                                   _site = value!;
//                                                 });
//                                               },
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               );
//                             },
//                           );
//                         },
//                         child: Container(
//                           height: SizeConfig.heightMultiplier * 4,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Icon(
//                                 Icons.sort,
//                                 color: Colors.black,
//                               ),
//                               SizedBox(width: SizeConfig.widthMultiplier * 2),
//                               TextView(
//                                 text: 'Sort',
//                                 size: SizeConfig.textMultiplier * 1.5,
//                                 fontWeight: FontWeight.w400,
//                                 color: Colors.black,
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.symmetric(
//                   vertical: SizeConfig.heightMultiplier * 1),
//               color: Colors.grey[200],
//               child: GridView.builder(
//                 physics: NeverScrollableScrollPhysics(),
//                 shrinkWrap: true,
//                 itemCount: itemsList.length,
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     mainAxisExtent: SizeConfig.heightMultiplier * 30,
//                     crossAxisCount: 2,
//                     mainAxisSpacing: SizeConfig.heightMultiplier * 2),
//                 itemBuilder: (BuildContext context, int index) {
//                  if(enable){
//                    return Shimmer.fromColors(
//                      baseColor: Colors.grey.shade300,
//                      highlightColor: Colors.grey.shade100,
//                      enabled: true,
//                      child: ProductCard(
//                        title: itemsList[index].title,
//                        price: itemsList[index].price,
//                        offPrice: itemsList[index].price,
//                        productImage: itemsList[index].image,
//                      ),
//                    );
//                  }else{
//                    // return InkWell(
//                    //   onTap: () {
//                    //     // Get.to(ProductDetail());
//                    //   },
//                    //   child: ProductCard(
//                    //     title: itemsList[index].title,
//                    //     price: itemsList[index].price,
//                    //     offPrice: itemsList[index].price,
//                    //     productImage: itemsList[index].image,
//                    //   ),
//                    // );
//
//                  }
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
