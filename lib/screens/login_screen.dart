import 'package:cinnabon_cake_app/components/action_button.dart';
import 'package:cinnabon_cake_app/components/backround_section.dart';
import 'package:cinnabon_cake_app/components/custom_text_field.dart';
import 'package:cinnabon_cake_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          BackroundSection(screenWidth: screenWidth),
          Transform.translate(
            offset: Offset(0, -50),
            child: Container(
              height: 390,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(70),
                  topRight: Radius.circular(70),
                ),
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned.fill(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 60, left: 45),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Please Sign In",
                              style: TextStyle(
                                color: Color(0xFF4F4F4F),
                                fontSize: 24,
                              ),
                            ),
                            CustomTextField(hintText: "email"),
                            SizedBox(height: 20,),
                            CustomTextField(
                              hintText: "password",
                              isPassword: true,
                            ),
                            Padding(
                              padding: EdgeInsetsGeometry.symmetric(horizontal: screenWidth*0.30, vertical: 20),
                              child: Row(
                                children: [
                                  Image.asset("images/facebook.png"),
                                  SizedBox(width: 20),
                                  Image.asset("images/google.png")
                                ],
                              ),
                            ),
                            Center(child: Text("or continue as Guest",)),
                            SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("Forgot Password?", style: TextStyle(
                                  color: Color(0xFF50CAD9),
                                  fontSize: 16
                                ),),
                                Text("Sign up", style: TextStyle(color: Color(0xFF50CAD9), fontSize: 16),)
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  ActionButton(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
