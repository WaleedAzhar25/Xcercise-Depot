import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:xcercise_depot/View/authScreens/SignUpPage.dart';
import 'package:xcercise_depot/View/constants.dart';
import 'package:xcercise_depot/View/workout_map.dart';
import 'package:xcercise_depot/services/user_services.dart';

// import 'forgot_password_enter_otp.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _inputEmail = new TextEditingController();
  final TextEditingController _inputPassword = new TextEditingController();

  bool handle_password = true;

  void change_handle_password() {
    handle_password = handle_password == true ? false : true;
  }

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
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
            const SizedBox(
              height: 30,
            ),
            Center(
              child: SizedBox(
                width: 320,
                child: TextFormField(
                  style: TextStyle(color: Colors.grey),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                    counterText: "",
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
                  maxLength: 60,
                  maxLines: 1,
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
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                    counterText: "",
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelText: "Enter Password.",
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
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: AccentColor,
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(
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
                  keyboardType: TextInputType.text,
                  maxLength: 60,
                  maxLines: 1,
                  controller: _inputPassword,
                  validator: (value) {
                    RegExp regex = RegExp(r'^.{2,}$');
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
              height: 30,
            ),
            Center(
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22.0)),
                minWidth: 230.0,
                height: 47,
                color: AccentColor,
                child: const Text('Login',
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
                onPressed: () async {
                  UserServices user = UserServices();

                  // user.SignIn(_inputEmail.text, _inputPassword.text, const WorkoutMapScreen(), _formKey, context);
                  if (_formKey.currentState!.validate()) {
                    await user.login(
                        _inputEmail.text, _inputPassword.text, context);
                  }





                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              child: Center(
                child: Text(
                  "Forgot Password",
                  style: TextStyle(color: AccentColor, fontSize: 16),
                ),
              ),
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => ForgotPasswordOTP()));
              },
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              child: Center(
                child: Text(
                  "Create an Account... SignUp",
                  style: TextStyle(color: AccentColor, fontSize: 16),
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUpPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
