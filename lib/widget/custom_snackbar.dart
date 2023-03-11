import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget customSnackBarContent(
    {required String text, required bgColor, required shapeColor}) {
  return Stack(
    children: [
      Container(
        height: 50,
        padding: const EdgeInsets.all(16),
        //margin: EdgeInsets.fromLTRB(0, 0, 0, 75),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Row(
          children: [
            const SizedBox(width: 50),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 14,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
      Positioned(
        top: 5,
        bottom: 5,
        left: 15,
        child: SvgPicture.asset(
          "images/back.svg",
          height: 35,
          width: 35,
          color: shapeColor,
        ),
      )
    ],
  );
}
