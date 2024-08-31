import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils/assets.dart';

class Search extends StatelessWidget {
  const Search({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      height: 50.0,
      decoration: BoxDecoration(
        color: const Color(0xFFf3f8fe),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Find things to do',
            hintStyle: const TextStyle(color: Colors.grey),
            prefixIcon: GestureDetector(
              onTap: () {
                print('Search icon tapped');
              },
              child: SvgPicture.asset(
                  kSearchIcon,
              ),
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}