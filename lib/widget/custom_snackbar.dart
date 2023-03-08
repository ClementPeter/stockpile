import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget customSnackBarContent({required String text}) {
  return Stack(
    children: [
      Container(
        height: 50,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(color: Color(0xFFC72C41)),
        child: Row(
          children: [
            SizedBox(width: 50),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 12,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
      Positioned(
        bottom: 0,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
          ),
          child: SvgPicture.asset(
            "images/back.svg",
            height: 48,
            width: 48,
            color: Color(0xFF801336),
          ),
        ),
      )
    ],
  );
}
