
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:parke/SignIn.dart';

import 'package:parke/styles.dart';
import 'package:get/get.dart';

import 'mainmenu.dart';
class LoginPage extends StatefulWidget {

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // ignore: non_constant_identifier_names
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final navigatorKey = GlobalKey<NavigatorState>();
  final User_namecontroller = TextEditingController();
  final Passwordcontroller = TextEditingController();
  late final allData;
  toast2(String a) => showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      elevation: 3,
      title: Text(
        a,
        textAlign: TextAlign.center,
      ),
      content: Icon(
        Icons.remove_circle_outline,
        size: 80,
        color: Colors.red,
      ),
    ),
  );

  @override
  void dispose() {
    User_namecontroller.dispose();
    Passwordcontroller.dispose();
    super.dispose();

  }
  @override


  // Bool _obscuretext=false;
  bool _obscuretext = false;
  IconData id = Icons.visibility_off;

  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/bg.jpg'),
                colorFilter: new ColorFilter.mode(
                    Colors.black.withOpacity(0.6), BlendMode.color),
                fit: BoxFit.fill,
              )),
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  SizedBox(
                    height: 350,
                  ),
                  SizedBox(
                    width: 350,
                    child: TextField(
                        controller: User_namecontroller,
                        style: inputstyle(),
                        // controller: uc.uname,
                        decoration:
                        inputdec("Username", Icons.person_outline)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 350,
                    child: TextField(
                      controller: Passwordcontroller,
                      obscureText: _obscuretext,
                      style: inputstyle(),
                      // controller: uc.pwd,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                              icon: Icon(id),
                              color: Colors.black,
                              onPressed: () {
                                setState(() {
                                  _obscuretext = !_obscuretext;
                                  if (_obscuretext)
                                    id = Icons.visibility_off;
                                  else
                                    id = Icons.visibility;

                                });
                              }),
                          fillColor: Colors.white,
                          filled: true,
                          border: new OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Colors.black)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Colors.cyan)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Colors.black)),
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintStyle: TextStyle(
                            fontSize: 16, // or whatever
                            color: Colors.grey,
                            height:
                            2.2, //                                <----- this was the key
                          ),
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            size: 20,
                            color: Colors.black,
                          ),
                          contentPadding: EdgeInsets.all(0),
                          isDense: false,
                          hintText: "Password"),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // ignore: deprecated_member_use
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: MaterialButton(
                      onPressed: () async {
                        try {
                          await _firebaseAuth
                              .signInWithEmailAndPassword(
                              email: User_namecontroller.text,
                              password: Passwordcontroller.text)
                              .then((value) => print('Login Successful'));
                          Navigator.pop(context);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Mainmenu()));

                        } catch (e) {
                          String aaa;
                          aaa = e.toString();
                          int kpp = aaa.lastIndexOf(']') + 1;
                          toast2(aaa.substring(kpp));
                        }
                      }, //since this is only a UI app

                      child: Text(
                        'SIGN IN',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'SFUIDisplay',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      color: Colors.cyan, //Color(0xffff2d55),
                      elevation: 2,
                      minWidth: 350,
                      height: 40,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(
                    height: 14,
                  ),

                  SizedBox(
                    height: 0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Doesn't have an account ? | ",
                          style: TextStyle(color: Colors.black)),
                      TextButton(
                        child: const Text(
                          'Sign in', style: TextStyle(fontSize: 20),),
                        onPressed: () {

                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  Create()));

                        },),
                    ],
                  ),

                ]),
          ),
        ),
      ),
    );


  }
  Future Login() async {
    showDialog(
      context: context, barrierDismissible: false,
      builder: (context) => Center(child: CircularProgressIndicator()),
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: User_namecontroller.text.trim(),
        password: Passwordcontroller.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}