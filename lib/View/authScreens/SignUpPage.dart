import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcercise_depot/View/authScreens/login_page.dart';
import 'package:xcercise_depot/View/constants.dart';
import 'package:intl/intl.dart';
import 'package:xcercise_depot/services/user_services.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  UserServices userReg = UserServices();
  var choose = 'Run';
  int sel=0;

  TextEditingController _inputFirstname = new TextEditingController();
  TextEditingController _inputLastname = new TextEditingController();
  TextEditingController _inputHeight = new TextEditingController();
  TextEditingController _inputWidth = new TextEditingController();
  TextEditingController _inputEmail = new TextEditingController();
  TextEditingController _inputMobileNumber = new TextEditingController();
  TextEditingController _inputDOB = new TextEditingController();
  TextEditingController _inputPassword = new TextEditingController();
  TextEditingController _inputRePassword = new TextEditingController();

  bool handle_password = true;
  bool handle_re_enter_password = true;
  var _inputGender='Male';
  var _inputBodyType='Ectomorph';

  void change_handle_password() {
    handle_password = handle_password == true ? false : true;
  }

  void change_handle_re_enter_password() {
    handle_re_enter_password = handle_re_enter_password == true ? false : true;
  }


  @override
  Widget build(BuildContext context) {

    List bodyContainer=[
      InkWell(
        onTap: (){
          setState(() {
            _inputBodyType='Ectomorph';
          });
          Navigator.pop(context);

        },
        child: Container(
          // color: Colors.green,
          height: 300,
          width: 400,
          child:
          _inputGender=='Male'?
          Image.asset('images/maleEctomorph.png'):
          _inputGender=='Female'?
          Image.asset('images/femaleEctomorph.png'):
          Center(
            child: Text('Ectomorph',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 20),
            ),
          ),
        ),
      ),
      InkWell(
        onTap: (){
          setState(() {
            _inputBodyType='Mesomorph';
          });
          Navigator.pop(context);

        },
        child: Container(
          // color: Colors.pinkAccent,
          height: 300,
          width: 400,
          child:
          _inputGender=='Male'?
          Image.asset('images/maleMesomorph.png'):
          _inputGender=='Female'?
          Image.asset('images/femaleMesomorph.png'):
          Center(child: Text('Mesomorph',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 20),)),
        ),
      ),
      InkWell(
          onTap: (){
            setState(() {
              _inputBodyType='Endomorph';
            });
            Navigator.pop(context);
        },
        child: Container(
          // color: Colors.blue,
          height: 300,
          width: 400,
          child:
          _inputGender=='Male'?
          Image.asset('images/maleEndomorph.png'):
          _inputGender=='Female'?
          Image.asset('images/femaleEndomorph.png'):
          Center(
            child: Text('Endomorph',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 20),
        ),
          ),
      ),
    )
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Image.asset(
              "images/logo_display.png",
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: 3,
            ),
            Center(
              child: SizedBox(
                width: 320,
                child: TextFormField(
                  style: TextStyle(color: Colors.grey),
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                    labelText: "Enter First Name.",
                    labelStyle: TextStyle(color: TextFillColor),

                    // border:OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(30),
                    // ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AccentColor, width: 1),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AccentColor, width: 1),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    //border:OutLineInputBorder or UnderLineInputBorder or InputBorder.none
                    // hintText: can be used
                    // hintStyle can be used for the styling of the hintText,
                    // filledColor:
                    //errorText:null, used for error message display
                    //filled:true
                    counterText: "",
                    prefixIcon: Icon(
                      Icons.person,
                      color: AccentColor,
                    ),
                    suffixIcon: Icon(
                      Icons.check,
                      color: AccentColor,
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  //obsecureText: true or false for password visibility
                  maxLength: 60,
                  maxLines: 1,
                  controller: _inputFirstname,
                  validator: (value) {
                    RegExp regex = new RegExp(r'^.{2,}$');
                    if (value!.isEmpty) {
                      return ("First name cannot be empty");
                    }
                    if (!regex.hasMatch(value)) {
                      return ("Enter Valid First name");
                    }
                  },
                  onSaved: (value) {
                    _inputFirstname.text = value!;
                  },
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: SizedBox(
                width: 320,
                child: TextFormField(
                  style: TextStyle(color: Colors.grey),
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                    labelText: "Enter Last Name.",
                    labelStyle: TextStyle(color: TextFillColor),

                    // border:OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(30),
                    // ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AccentColor, width: 1),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AccentColor, width: 1),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    //border:OutLineInputBorder or UnderLineInputBorder or InputBorder.none
                    // hintText: can be used
                    // hintStyle can be used for the styling of the hintText,
                    // filledColor:
                    //errorText:null, used for error message display
                    //filled:true
                    counterText: "",
                    prefixIcon: Icon(
                      Icons.person,
                      color: AccentColor,
                    ),
                    suffixIcon: Icon(
                      Icons.check,
                      color: AccentColor,
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  //obsecureText: true or false for password visibility
                  maxLength: 60,
                  maxLines: 1,
                  controller: _inputLastname,
                  validator: (value) {
                    RegExp regex = new RegExp(r'^.{2,}$');
                    if (value!.isEmpty) {
                      return ("Last name cannot be empty");
                    }
                    if (!regex.hasMatch(value)) {
                      return ("Enter Valid Last name");
                    }
                  },
                  onSaved: (value) {
                    _inputLastname.text = value!;
                  },
                ),
              ),
            ),

            SizedBox(
              height: 20,
            ),
            Center(
              child: SizedBox(
                width: 320,
                child: TextFormField(
                  style: TextStyle(color: Colors.grey),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelText: "Enter Email.",
                    labelStyle: TextStyle(color: TextFillColor),
                    // border:OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(30),
                    // ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AccentColor, width: 1),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AccentColor, width: 1),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    //border:OutLineInputBorder or UnderLineInputBorder or InputBorder.none
                    // hintText: can be used
                    // hintStyle can be used for the styling of the hintText,
                    // filledColor:
                    //errorText:null, used for error message display
                    //filled:true
                    prefixIcon: Icon(
                      Icons.mail,
                      color: AccentColor,
                    ),
                    suffixIcon: Icon(
                      Icons.check,
                      color: AccentColor,
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  //obsecureText: true or false for password visibility
                  // maxLength: 100,
                  // maxLines: 1,
                  // minLines: 1,
                  controller: _inputEmail,
                  validator: (value) {
                    RegExp regex = new RegExp(r'^.{2,}$');
                    if (value!.isEmpty) {
                      return ("Email cannot be empty");
                    }
                    if (!regex.hasMatch(value)) {
                      return ("Enter Valid Email");
                    }
                  },
                  onSaved: (value) {
                    _inputEmail.text = value!;
                  },
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: SizedBox(
                width: 320,
                child: TextFormField(
                  style: TextStyle(color: Colors.grey),
                  decoration: InputDecoration(
                    counterText: "",
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelText: "Enter Mobile number.",
                    labelStyle: TextStyle(color: TextFillColor),
                    // border:OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(30),
                    // ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AccentColor, width: 1),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AccentColor, width: 1),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    //border:OutLineInputBorder or UnderLineInputBorder or InputBorder.none
                    // hintText: can be used
                    // hintStyle can be used for the styling of the hintText,
                    // filledColor:
                    //errorText:null, used for error message display
                    //filled:true
                    prefixIcon: Icon(
                      Icons.phone_android,
                      color: AccentColor,
                    ),
                    suffixIcon: Icon(
                      Icons.check,
                      color: AccentColor,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  //obsecureText: true or false for password visibility
                  maxLength: 60,
                  maxLines: 1,
                  controller: _inputMobileNumber,
                  validator: (value) {
                    RegExp regex = new RegExp(r'^.{2,}$');
                    if (value!.isEmpty) {
                      return ("Mobile Number cannot be empty");
                    }
                    if (!regex.hasMatch(value)) {
                      return ("Enter Mobile Number.");
                    }
                  },
                  onSaved: (value) {
                    _inputMobileNumber.text = value!;
                  },
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: SizedBox(
                width: 320,
                child: TextFormField(
                  style: TextStyle(color: Colors.grey),
                  decoration: InputDecoration(
                    counterText: "",
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelText: "Date of Birth -yyyy-MM-dd",
                    labelStyle: TextStyle(color: TextFillColor),
                    // border:OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(30),
                    // ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AccentColor, width: 1),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AccentColor, width: 1),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    //border:OutLineInputBorder or UnderLineInputBorder or InputBorder.none
                    // hintText: can be used
                    // hintStyle can be used for the styling of the hintText,
                    // filledColor:
                    //errorText:null, used for error message display
                    //filled:true
                    prefixIcon: IconButton(
                      icon: Icon(
                        Icons.edit_calendar_outlined,
                        color: AccentColor,
                      ),
                      onPressed: ()async{
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1950),
                            //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2100));

                        if (pickedDate != null) {
                          print(
                              pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                          print(
                              formattedDate); //formatted date output using intl package =>  2021-03-16
                          setState(() {
                            _inputDOB.text =
                                formattedDate; //set output date to TextField value.
                          });
                        } else {}
                      },
                    ),
                    suffixIcon: Icon(
                      Icons.check,
                      color: AccentColor,
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  //obsecureText: true or false for password visibility
                  maxLength: 60,
                  maxLines: 1,
                  controller: _inputDOB,
                  validator: (value) {
                    RegExp regex = new RegExp(r'^.{2,}$');
                    if (value!.isEmpty) {
                      return ("Date of Birth cannot be empty");
                    }
                    if (!regex.hasMatch(value)) {
                      return ("Enter Valid Date of Birth");
                    }
                  },
                  onSaved: (value) {
                    _inputDOB.text = value!;
                  },
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: SizedBox(
                width: 320,
                child: TextFormField(
                  style: TextStyle(color: Colors.grey),
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                    labelText: "Enter your Height.",
                    labelStyle: TextStyle(color: TextFillColor),

                    // border:OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(30),
                    // ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AccentColor, width: 1),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AccentColor, width: 1),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    counterText: "",
                    prefixIcon: Icon(
                      Icons.height,
                      color: AccentColor,
                    ),
                    suffixIcon: Icon(
                      Icons.check,
                      color: AccentColor,
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  //obsecureText: true or false for password visibility
                  maxLength: 60,
                  maxLines: 1,
                  controller: _inputHeight,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ("Height cannot be empty");
                    }
                  },
                  onSaved: (value) {
                    _inputHeight.text = value!;
                  },
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: SizedBox(
                width: 320,
                child: TextFormField(
                  style: TextStyle(color: Colors.grey),
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                    labelText: "Enter your Weight in Kg.",
                    labelStyle: TextStyle(color: TextFillColor),

                    // border:OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(30),
                    // ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AccentColor, width: 1),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AccentColor, width: 1),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    counterText: "",
                    prefixIcon: Icon(
                      Icons.width_full,
                      color: AccentColor,
                    ),
                    suffixIcon: Icon(
                      Icons.check,
                      color: AccentColor,
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  //obsecureText: true or false for password visibility
                  maxLength: 60,
                  maxLines: 1,
                  controller: _inputWidth,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ("Weight cannot be empty");
                    }
                  },
                  onSaved: (value) {
                    _inputWidth.text = value!;
                  },
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                  height: 45,
                  width: 320,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border:Border.all(
                          color: AccentColor, width: 1)
                  ),
                  child:Row(
                    children: [
                      SizedBox(width: 10,),
                      Icon(Icons.person,color: AccentColor,),
                      SizedBox(width: 15,),
                      Text(_inputGender,style: TextStyle(color: Colors.grey,fontSize: 16),),
                      Spacer(),
                      IconButton(
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: AccentColor,
                        ),
                        onPressed: (){
                          showDialog<void>(
                            context: context,
                            barrierDismissible: false, // user must tap button!
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: SingleChildScrollView(
                                  child: Center(
                                    child: Container(
                                      height: 400,
                                      width: 300,
                                      color: Colors.white,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ListTile(
                                            leading: Radio<String>(
                                              activeColor: Colors.blue,
                                              value: 'Male',
                                              groupValue: _inputGender,
                                              onChanged: (value) {
                                                setState(() {
                                                  _inputGender = value!;
                                                  Navigator.pop(context);
                                                });
                                              },
                                            ),
                                            title: Row(
                                              children: [
                                                Text('Male',style: TextStyle(color: Colors.blue,fontSize: 17,fontWeight: FontWeight.w600),),
                                                Image.asset('images/male.png',height:80,width: 100,fit: BoxFit.fitHeight,),
                                              ],
                                            ),
                                          ),
                                          Divider(),
                                          ListTile(
                                            leading: Radio<String>(
                                              activeColor: Colors.pinkAccent,
                                              value: 'Female',
                                              groupValue: _inputGender,
                                              onChanged: (value) {
                                                setState(() {
                                                  _inputGender = value!;
                                                  Navigator.pop(context);

                                                });
                                              },
                                            ),
                                            title: Row(
                                              children: [
                                                Text('Female',style: TextStyle(color: Colors.pinkAccent,fontSize: 17,fontWeight: FontWeight.w600),),
                                                Image.asset('images/female.png',height:80,width: 100,fit: BoxFit.fitHeight,),
                                              ],
                                            ),                                          ),
                                          Divider(),
                                          ListTile(
                                            leading: Radio<String>(
                                              activeColor: Colors.deepPurpleAccent,
                                              value: 'Neutral',
                                              groupValue: _inputGender,
                                              onChanged: (value) {
                                                setState(() {
                                                  _inputGender = value!;
                                                  Navigator.pop(context);
                                                });
                                              },
                                            ),
                                            title: Row(
                                              children: [
                                                Text('Neutral',style: TextStyle(color: Colors.deepPurpleAccent,fontSize: 17,fontWeight: FontWeight.w600),),
                                                Image.asset('images/other.png',height:80,width: 100,fit: BoxFit.fitHeight,),
                                              ],
                                            ),                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );


                        },
                      ),
                    ],
                  )
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                  height: 45,
                  width: 320,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border:Border.all(
                          color: AccentColor, width: 1)
                  ),
                  child:Row(
                    children: [
                      SizedBox(width: 10,),
                      Icon(Icons.person,color: AccentColor,),
                      SizedBox(width: 15,),
                      Text(_inputBodyType,style: TextStyle(color: Colors.grey,fontSize: 16),),
                      Spacer(),
                      IconButton(
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: AccentColor,
                        ),
                        onPressed: (){
                          showDialog<void>(
                            context: context,
                            barrierDismissible: false, // user must tap button!
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: StatefulBuilder(
                                  builder: (context,StateSetter setState) {
                                    return SingleChildScrollView(
                                      child: Container(
                                        height: 300,
                                        width: 500,
                                        color: AccentColor,
                                        child: Stack(
                                          children: [
                                            bodyContainer[sel],
                                            Positioned(
                                              left: 0,
                                              right: 0,
                                              top: 100,
                                              child: Container(
                                                height: 100,
                                                width: 300,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    IconButton(onPressed: (){
                                                      if(sel>0){
                                                        setState(() {
                                                          sel=sel-1;
                                                        });
                                                      }
                                                    }, icon: Icon(Icons.arrow_back_ios,size: 50,color:sel==0?AccentColor :Colors.white,)),
                                                    IconButton(onPressed: (){
                                                      if(sel<2){
                                                        setState(() {
                                                          sel=sel+1;
                                                        });
                                                      }
                                                    }, icon: Icon(Icons.arrow_forward_ios,size: 50,color:sel==2?AccentColor :Colors.white,))
                                                  ],
                                                ),
                                              ),
                                            ),

                                          ],
                                        ),
                                        // Column(
                                        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        //   children: [
                                        //     ListTile(
                                        //       leading: Radio<String>(
                                        //         activeColor: Colors.blue,
                                        //         value: 'Ectomorph',
                                        //         groupValue: _inputBodyType,
                                        //         onChanged: (value) {
                                        //           setState(() {
                                        //             _inputBodyType = value!;
                                        //             Navigator.pop(context);
                                        //           });
                                        //         },
                                        //       ),
                                        //
                                        //       trailing:  _inputGender=='Male'?
                                        //       Image.asset('images/maleEctomorph.png'):
                                        //       _inputGender=='Female'?
                                        //       Image.asset('images/femaleEctomorph.png'):
                                        //       Text(''),
                                        //       title: Text('Ectomorph',style: TextStyle(color: Colors.blue,fontSize: 14,fontWeight: FontWeight.w600),),
                                        //     ),
                                        //     Divider(),
                                        //     ListTile(
                                        //       leading: Radio<String>(
                                        //         activeColor: Colors.pinkAccent,
                                        //         value: 'Mesomorph',
                                        //         groupValue: _inputBodyType,
                                        //         onChanged: (value) {
                                        //           setState(() {
                                        //             _inputBodyType = value!;
                                        //             Navigator.pop(context);
                                        //
                                        //           });
                                        //         },
                                        //       ),
                                        //       trailing:  _inputGender=='Male'?
                                        //       Image.asset('images/maleMesomorph.png'):
                                        //       _inputGender=='Female'?
                                        //       Image.asset('images/femaleMesomorph.png'):
                                        //       Text(''),
                                        //       title: Text('Mesomorph',style: TextStyle(color: Colors.pinkAccent,fontSize: 14,fontWeight: FontWeight.w600),),
                                        //     ),
                                        //     Divider(),
                                        //     ListTile(
                                        //       dense: true,
                                        //
                                        //       leading: Radio<String>(
                                        //         activeColor: Colors.deepPurpleAccent,
                                        //         value: 'Endomorph',
                                        //         groupValue: _inputBodyType,
                                        //         onChanged: (value) {
                                        //           setState(() {
                                        //             _inputBodyType = value!;
                                        //             Navigator.pop(context);
                                        //           });
                                        //         },
                                        //       ),
                                        //       trailing: _inputGender=='Male'?
                                        //       Image.asset('images/maleEndomorph.png'):
                                        //       _inputGender=='Female'?
                                        //       Image.asset('images/femaleEndomorph.png'):
                                        //       Text(''),
                                        //       title: Text('Endomorph',style: TextStyle(color: Colors.deepPurpleAccent,fontSize: 14,fontWeight: FontWeight.w600),),                                          ),
                                        //   ],
                                        // ),
                                      ),
                                    );
                                  }
                                ),
                              );
                            },
                          );


                        },
                      ),
                    ],
                  )
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: SizedBox(
                width: 320,
                child: TextFormField(
                  style: TextStyle(color: Colors.grey),
                  decoration: InputDecoration(
                    counterText: "",
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                    labelText: "Enter Password.",
                    labelStyle: TextStyle(color: TextFillColor),

                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AccentColor, width: 1),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AccentColor, width: 1),
                      borderRadius: BorderRadius.circular(30),
                    ),

                    prefixIcon: Icon(
                      Icons.lock,
                      color: AccentColor,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.warning,
                        color: AccentColor,
                      ),
                      onPressed: () {
                        setState(() {
                          change_handle_password();
                        });
                      },
                    ),
                  ),
                  obscureText: handle_password,
                  autofocus: false,
                  keyboardType: TextInputType.text,
                  maxLength: 60,
                  maxLines: 1,
                  controller: _inputPassword,
                  validator: (value) {
                    RegExp regex = new RegExp(r'^.{6,}$');
                    if (value!.isEmpty) {
                      return ("Password cannot be empty");
                    }
                    if (!regex.hasMatch(value)) {
                      return ("Enter Valid Password");
                    }
                  },
                  onSaved: (value) {
                    _inputPassword.text = value!;
                  },
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: SizedBox(
                width: 320,
                child: TextFormField(
                  style: TextStyle(color: Colors.grey),
                  decoration: InputDecoration(
                    counterText: "",
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                    labelText: "Re-enter Password.",
                    labelStyle: TextStyle(color: TextFillColor),
                    // border:OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(30),
                    // ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AccentColor, width: 1),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AccentColor, width: 1),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    //border:OutLineInputBorder or UnderLineInputBorder or InputBorder.none
                    // hintText: can be used
                    // hintStyle can be used for the styling of the hintText,
                    // filledColor:
                    //errorText:null, used for error message display
                    //filled:true
                    prefixIcon: Icon(
                      Icons.lock,
                      color: AccentColor,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.warning,
                        color: AccentColor,
                      ),
                      onPressed: () {
                        setState(() {
                          change_handle_re_enter_password();
                        });
                      },
                    ),
                  ),
                  obscureText: handle_re_enter_password,
                  keyboardType: TextInputType.text,
                  maxLength: 60,
                  maxLines: 1,
                  controller: _inputRePassword,
                  validator: (value) {
                    if (_inputPassword.text != _inputRePassword.text) {
                      return "password don't match";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    _inputRePassword.text = value!;
                  },
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22.0)),
                minWidth: 230.0,
                height: 47,
                color: AccentColor,
                child: new Text('Register',
                    style: new TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
                onPressed: () {
                  userReg.Registration(
                    _inputEmail.text,
                    _inputPassword.text,
                    _formKey,
                    LoginPage(),
                    context,
                    _inputFirstname.text,
                    _inputLastname.text,
                    _inputHeight.text,
                    _inputWidth.text,
                    _inputBodyType,
                    _inputGender,
                    _inputMobileNumber.text,
                    _inputDOB.text,
                  );
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}


