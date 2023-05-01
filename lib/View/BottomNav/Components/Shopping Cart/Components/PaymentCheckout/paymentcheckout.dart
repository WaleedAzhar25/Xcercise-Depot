// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
//
// class PaymentCheckout extends StatefulWidget {
//   const PaymentCheckout({Key? key}) : super(key: key);
//
//   @override
//   State<PaymentCheckout> createState() => _PaymentCheckoutState();
// }
//
// class _PaymentCheckoutState extends State<PaymentCheckout> {
//   int select = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: IconThemeData(size: 22, color: Colors.black),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         centerTitle: false,
//         automaticallyImplyLeading: true,
//         title: TextView(
//           text: 'Check Out',
//           color: Colors.black,
//           size: SizeConfig.textMultiplier * 2.2,
//           fontWeight: FontWeight.w500,
//         ),
//       ),
//       body: Column(
//         children: [
//           SizedBox(
//             height: SizeConfig.heightMultiplier * 2,
//           ),
//           Expanded(
//             child: ListView.builder(
//               physics: BouncingScrollPhysics(),
//               shrinkWrap: true,
//               itemBuilder: (context, index) {
//                 return InkWell(
//                   onTap: () {
//                     setState(() {
//                       select = index;
//                     });
//                   },
//                   child: Container(
//                     margin: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier*2),
//                     child: PayMentCard(
//                       color:
//                           select == index ? AppColors.primarycolor : Colors.white,
//                       icon: select == index ? 1 : 0,
//                     ),
//                   ),
//                 );
//               },
//               itemCount: 2,
//             ),
//           ),
//           Container(
//             height: SizeConfig.heightMultiplier * 25,
//             child: Column(
//               children: [
//                 Container(
//                   margin: EdgeInsets.symmetric(
//                       horizontal: SizeConfig.widthMultiplier * 3),
//                   height: SizeConfig.heightMultiplier * 6.5,
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(8)),
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: TextFormField(
//                           decoration: InputDecoration(
//                               border: InputBorder.none,
//                               contentPadding: EdgeInsets.all(10),
//                               focusedBorder: InputBorder.none,
//                               hintStyle: TextStyle(
//                                   color: Colors.grey,
//                                   fontSize: SizeConfig.textMultiplier * 1.8),
//                               hintText: 'Enter coupon code'),
//                         ),
//                       ),
//                       ElevatedButton(
//                           style: ButtonStyle(
//                             maximumSize: MaterialStateProperty.all(
//                               Size(SizeConfig.widthMultiplier * 35,
//                                   SizeConfig.heightMultiplier * 7),
//                             ),
//                             minimumSize: MaterialStateProperty.all(
//                               Size(SizeConfig.widthMultiplier * 35,
//                                   SizeConfig.heightMultiplier * 7),
//                             ),
//                             shape: MaterialStateProperty.all(
//                                 RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.only(
//                                         topRight: Radius.circular(8),
//                                         bottomRight: Radius.circular(8)))),
//                             backgroundColor: MaterialStateProperty.all(
//                               AppColors.primarycolor,
//                             ),
//                           ),
//                           onPressed: () {},
//                           child: TextView(
//                             text: 'APPLY COUPON',
//                             color: Colors.white,
//                             fontWeight: FontWeight.w500,
//                             size: SizeConfig.textMultiplier * 1.8,
//                           ))
//                     ],
//                   ),
//                 ),
//                 Container(
//                   decoration: BoxDecoration(
//                       color: Color(0xfffFEEAD1),
//                       borderRadius: BorderRadius.circular(8)),
//                   margin: EdgeInsets.symmetric(
//                       vertical: SizeConfig.heightMultiplier * 1,
//                       horizontal: SizeConfig.widthMultiplier * 3),
//                   height: SizeConfig.heightMultiplier * 6,
//                   child: Row(
//                     children: [
//                       SizedBox(
//                         width: SizeConfig.widthMultiplier * 4,
//                       ),
//                       TextView(
//                         text: 'Total Amount',
//                         size: SizeConfig.textMultiplier * 1.8,
//                         color: Colors.black,
//                       ),
//                       TextButton(
//                         onPressed: () {},
//                         child: Baseline(
//                           baseline: SizeConfig.heightMultiplier * 2.6,
//                           baselineType: TextBaseline.alphabetic,
//                           child: UnderLineText(
//                             text: 'see details',
//                             decorationColor: Colors.blueGrey,
//                           ),
//                         ),
//                       ),
//                       Spacer(),
//                       TextView(
//                         text: '\$ 25.00',
//                         size: SizeConfig.textMultiplier * 2,
//                         color: AppColors.primarycolor,
//                         fontWeight: FontWeight.bold,
//                       ),
//                       SizedBox(
//                         width: SizeConfig.widthMultiplier * 3,
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: SizeConfig.heightMultiplier * 1,
//                 ),
//                 ElevatedButton(
//                     style: ButtonStyle(
//                       maximumSize: MaterialStateProperty.all(
//                         Size(SizeConfig.widthMultiplier * 90,
//                             SizeConfig.heightMultiplier * 7),
//                       ),
//                       minimumSize: MaterialStateProperty.all(
//                         Size(SizeConfig.widthMultiplier * 90,
//                             SizeConfig.heightMultiplier * 7),
//                       ),
//                       shape: MaterialStateProperty.all(RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8))),
//                       backgroundColor: MaterialStateProperty.all(
//                         AppColors.primarycolor,
//                       ),
//                     ),
//                     onPressed: () {
//                       Get.to(OrderDetails());
//                     },
//                     child: TextView(
//                       text: 'Place My Order',
//                       color: Colors.white,
//                       fontWeight: FontWeight.w500,
//                       size: SizeConfig.textMultiplier * 1.8,
//                     )),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
