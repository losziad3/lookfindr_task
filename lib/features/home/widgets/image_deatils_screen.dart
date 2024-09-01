import 'package:flutter/material.dart';

import '../../../components/components.dart';

class ImageWithButtons extends StatelessWidget {
  final String image;
  void Function()? onPressed;

   ImageWithButtons({required this.image ,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image.asset(
            image,
            fit: BoxFit.cover,
            height: 420,
            width: 335,
          ),
        ),
        Positioned(
          top: 20,
          left: 20,
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: IconButton(
                onPressed: onPressed,
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ),
         HeartIcon(
           // if the user click on the heart icon, will add this to teh favorite page
           onTap: (){},
          heightOfHeart: 60,
          widthOfHeart: 60,
          bottomPosition: 0,
          iconSize: 40,
        ),
      ],
    );
  }
}


