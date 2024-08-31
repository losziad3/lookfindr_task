import 'package:flutter/material.dart';

class BookNowButton extends StatelessWidget {
  const BookNowButton(
      {super.key,
        this.onTap,
        required this.text,
        required this.color,
        this.textStyle,
        Null Function()? onPressed});

  final String text;
  final VoidCallback? onTap;
  final Color? color;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    // Get the media query data
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    // Calculate the button width and height as a percentage of the screen size
    final buttonWidth = screenWidth * 0.6; // Width as 80% of the screen width
    final buttonHeight =
        screenHeight * 0.07; // Height as 6% of the screen height

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: buttonWidth, // Use calculated width
          height: buttonHeight, // Use calculated height
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: color,
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: textStyle,
                ),
                SizedBox(
                  width: 6,
                ),
                Icon(Icons.arrow_forward, color: Colors.white, size: 25,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
