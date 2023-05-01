import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xcercise_depot/View/authScreens/SignUpPage.dart';
import 'package:xcercise_depot/View/workout_map.dart';
import 'package:xcercise_depot/model/user_model.dart';

class UserServices {
  UserServices();

  final _auth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late UserModel currentUserModel;

  late SharedPreferences _prefs;
  var acs = ActionCodeSettings(
      // URL you want to redirect back to. The domain (www.example.com) for this
      // URL must be whitelisted in the Firebase Console.
      url: 'https://www.example.com/finishSignUp?cartId=1234',
      // This must be true
      handleCodeInApp: true,
      iOSBundleId: 'com.example.ios',
      androidPackageName: 'com.impokto.android',
      // installIfNotAvailable
      androidInstallApp: true,
      // minimumVersion
      androidMinimumVersion: '12');

  Future<void> login(String email, String password, context) async {
    var calories = 0;
    var steps = 0;
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => {Fluttertoast.showToast(msg: "Login Successful")});
      User? user = _auth.currentUser;
      if (user != null) {
        // Timer.periodic(Duration(seconds: 10), (timer) {
        //   print("Yeah, this line is printed after 1 day");
        //   stepRepeat() {
        //     StepService service = StepService();
        //     DateTime now = DateTime.now();
        //     String formattedDate = DateFormat.yMd().format(now);
        //     StepsModel stepsModel = StepsModel(
        //         calorie: '0',
        //         dateTime: DateTime.now().toString(),
        //         steps: '0',
        //         uid: _auth.currentUser!.uid.toString(), date: formattedDate, stepsData: [{'steps':'0','date':formattedDate.toString()}]);
        //     service.updateSteps(stepsModel);
        //   }
        //
        //   stepRepeat();
        // });


        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => WorkoutMapScreen()),
            (route) => false);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(msg: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(msg: 'Wrong password provided for that user.');
      } else {
        Fluttertoast.showToast(msg: e.message.toString());
      }
    }
  }

  // void SignIn(String email, String password, var navID, var _formkey,
  //     BuildContext context) async {
  //   try {
  //     if (_formkey.currentState.validate()) {
  //       try {
  //         final credential = await FirebaseAuth.instance
  //             .signInWithEmailAndPassword(email: email, password: password);
  //         User? user = _auth.currentUser;
  //         if (user != null) {
  //           Fluttertoast.showToast(msg: "Login Successful");
  //         }
  //         UserModel details = await firebaseFirestore
  //                 .collection("users")
  //                 .doc(user!.uid)
  //                 .snapshots()
  //                 .map((snapshots) => UserModel.fromMap(snapshots.data()))
  //             as UserModel;
  //
  //         // if (details.rightMac.isEmpty || details.leftMac.isEmpty) {
  //         //   // Navigator.of(context).push(MaterialPageRoute(builder: (context) => QRPage()));
  //         //   // Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen()));
  //         //
  //         // }
  //         //
  //         //
  //         // // else {
  //         // //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //         // //   await prefs.setString('macR', details.rightMac.toString());
  //         // //   await prefs.setString('macL', details.leftMac.toString());
  //         // //   await prefs.setInt('Steps', 0);
  //         // //   print("From User Login-Sandip");
  //         // // }
  //         // Navigator.of(context)
  //         //     .pushReplacement(MaterialPageRoute(builder: (context) => navID));
  //       } on FirebaseAuthException catch (e) {
  //         if (e.code == 'user-not-found') {
  //           Fluttertoast.showToast(msg: 'No user found for that email.');
  //         } else if (e.code == 'wrong-password') {
  //           Fluttertoast.showToast(
  //               msg: 'Wrong password provided for that user.');
  //         }
  //       }
  //
  //       await _auth
  //           .signInWithEmailAndPassword(email: email, password: password)
  //           .then((uid) => {
  //
  //                 Fluttertoast.showToast(msg: "Login Successful"),
  //                 Navigator.of(context).pushReplacement(
  //                     MaterialPageRoute(builder: (context) => SignUpPage())),
  //               })
  //           .catchError((e) {
  //         Fluttertoast.showToast(msg: e.message);
  //       });
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  void Registration(
    String email,
    String password,
    var _formKey,
    var navID,
    BuildContext context,
    String firstname,
    String lastname,
    String height,
    String width,
    String bodyType,
    String gender,
    String phonenumber,
    String DOB,
  ) async {
    if (_formKey.currentState.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {
                postDetailsToFirestore(navID, context, firstname, lastname,
                    height, width, bodyType, gender, phonenumber, DOB)
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e.message);
      });
    }
  }

  void postDetailsToFirestore(
    var navID,
    BuildContext context,
    String firstname,
    String lastname,
    String height,
    String width,
    String bodyType,
    String gender,
    String phonenumber,
    String DOB,
  ) async {
    //calling firestore and usermodel and sending value to cloud store

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    User? user = await _auth.currentUser;

    UserModel userModel = UserModel(
        uid: user!.uid,
        email: user.email!,
        firstName: firstname,
        secondName: lastname,
        height: height,
        weight: width,
        bodyType: bodyType,
        gender: gender,
        phoneNumber: phonenumber,
        dateOfBirth: DOB,
        rightMac: '',
        leftMac: '',
        emailVerified: true);

    // SosModel sosModel = SosModel(
    //     contact1: "983000000",
    //     contact2: "983000000",
    //     contact3: "983000000",
    //     contact4: "983000000",
    //     contact5: "983000000",
    //     callingContact: "983000000",
    //     fakecall: "Maa",
    //     url: 'https://website.com');
    // StepsModel stepsModel = StepsModel(
    //     calorie: '0',
    //     dateTime: DateTime.now().toString(),
    //     steps: '0',
    //     uid: _auth.currentUser!.uid.toString(), date: DateTime.now().day.toString(), stepsData: []);

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());

    // await firebaseFirestore
    //     .collection("sos")
    //     .doc(user.uid)
    //     .set(sosModel.toMap());
    //
    // await firebaseFirestore
    //     .collection('steps')
    //     .doc(user.uid)
    //     .set(stepsModel.toMap());

    // await signOut();
    Fluttertoast.showToast(msg: "Account created successfully");
    // Navigator.pushAndRemoveUntil(context,
    //     MaterialPageRoute(builder: (context) => navID), (route) => false);
  }

  // Sign Out
  Future<void> signOut() async {
    return _auth.signOut();
  }

  Future<UserModel> currentDetails() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    User? user = await _auth.currentUser;

    var details =
        await firebaseFirestore.collection("users").doc(user!.uid).get();
    currentUserModel = UserModel.fromMap(details);
    return UserModel.fromMap(details);
  }

  Stream<UserModel> currentDetailsStream() {
    User? user = _auth.currentUser;

    var details = firebaseFirestore
        .collection("users")
        .doc(user?.uid)
        .snapshots()
        .map((snapshots) => UserModel.fromMap(snapshots.data()));
    return details;
  }

  Future<void> updateUser(UserModel data) async {
    User? user = _auth.currentUser;
    var details =
        firebaseFirestore.collection("users").doc(user!.uid).set(data.toMap());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('Steps', 0);
  }

  void resendVerificationEmail() async {
    User? user = _auth.currentUser;
    user!.sendEmailVerification().then((value) => Fluttertoast.showToast(
        msg: "Please verify your email and try again login"));
  }

  Future<void> markUserEmailVerified() async {
    User? user = _auth.currentUser;
    await currentDetails();
    currentUserModel.setEmailVerified(true);

    updateUser(currentUserModel);
  }

  Stream<User?> authStateChanges() {
    return _auth.authStateChanges();
  }
}
