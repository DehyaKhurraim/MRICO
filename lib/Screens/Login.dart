import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:untitled1/Screens/BottomNavbar.dart';
import 'package:untitled1/Screens/SignUp.dart';

import '../ThemeConfig/Colors.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Image(image: AssetImage('assets/Rectangle2206.png'),fit: BoxFit.fill, width: 600,),
            Image(image: AssetImage('assets/Rectangle2207.png'),fit: BoxFit.fill, width: 600,),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0,left: 10.0),
                      child: Image(image: AssetImage('assets/Logo.png'),width: 100,height: 100,),
                    ),
                  ),
                  SizedBox(height: 150.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Login',
                        style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.white,


                      ),
                      textAlign: TextAlign.center,),
                    ],
                  ),
                  SizedBox(height: 19.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text('Username or Email',
                          style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.white,

                        ),
                        textAlign: TextAlign.center,),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: TextField (

                        decoration: InputDecoration(border: OutlineInputBorder(
                          borderSide: BorderSide(width: 10, color: Colors.black),
                          borderRadius: BorderRadius.circular(15),
                        ),
                         filled: true,
                            fillColor: Color.fromRGBO(216, 216, 221, 100),
                            labelText: 'Enter Name',
                           hintText: 'Enter Your Name'
    ),
    ),
                      ),
                      SizedBox(height: 15.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text('Password',
                          style: TextStyle(
                            fontSize: 22.0,
                            color: Colors.white,

                          ),
                          textAlign: TextAlign.center,),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: TextField (

                          decoration: InputDecoration(border: OutlineInputBorder(
                            borderSide: BorderSide(width: 10, color: Colors.black),
                            borderRadius: BorderRadius.circular(15),
                          ),
                              filled: true,
                              fillColor: Color.fromRGBO(216, 216, 221, 100),
                              labelText: 'Enter Password',
                              hintText: 'Enter Your Password'
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),

                      SizedBox(height: 10.0),
                      Container(
                        margin: const EdgeInsets.fromLTRB(20, 0, 20, 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.5,
                              height: 40,
                              child: Container(
                                child: Material(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.transparent,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(10),
                                    splashColor: Colors.amber,
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const RootApp()),
                                      );
                                    },
                                    child: const Center(
                                      child: Text(
                                        "Log In",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                   color: kPrimaryColor,
                              ),
                            ),

                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 180.0),
                      Center(

                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 110.0),
                              child: Text('Dont have an account?',style: TextStyle(
                                  color: Colors.white
                              ),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const Signup()),
                                  );
                                },
                                child: Text('Sign Up',style: TextStyle(
                                    color: Colors.blue
                                ),),
                              ),
                            ),
                          ],
                        ),
                      ),



                ],
              )

          ],
        ),
            ),
  ]
      ),
      ),
    );
  }
}
