import 'package:flutter/material.dart';

class BackroundSection extends StatelessWidget {
  final double screenWidth;
  const BackroundSection({super.key, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
            height: 500,
            width: double.infinity,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  left: -20,
                  child: Image.asset(
                    "images/Vector.png",
                    fit: BoxFit.cover,
                    height: 550,
                  ),
                ),
                Positioned(child: Image.asset("images/Vector2.png")),
                Positioned(
                  top: 35,
                  left: 0,
                  child: Image.asset(
                    "images/foto1.png",
                    width: screenWidth,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 110,
                  left: 50,

                  child: Text(
                    "Welcome \n back",
                    style: TextStyle(
                      color: Colors.brown,
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}