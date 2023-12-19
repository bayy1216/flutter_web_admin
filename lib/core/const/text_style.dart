import 'package:flutter/material.dart';
import 'package:happy_aging_admin/core/const/color.dart';

class TextStyles {
  static const FontWeight black = FontWeight.w900;
  static const FontWeight extraBold = FontWeight.w800;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight light = FontWeight.w300;
  static const FontWeight extraLight = FontWeight.w200;
  static const FontWeight thin = FontWeight.w100;
  static const pyeongchang = 'Pyeongchangpeace';

  static TextStyle bigTitle1 = const TextStyle(
    color: ColorConst.titleText,
    fontSize: 60.0,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.3,
  );
  static TextStyle bigTitle2 = bigTitle1.copyWith(
    fontSize: 56.0,
  );
  static TextStyle bigTitle3 = bigTitle1.copyWith(
    fontSize: 52.0,
  );


  static TextStyle titleLarge1 = const TextStyle(
    color: ColorConst.titleText,
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.3,
  );

  static TextStyle titleLarge2 = titleLarge1.copyWith(
    fontSize: 22.0,
  );
  static TextStyle titleMedium1 = titleLarge1.copyWith(
    fontSize: 20.0,
  );
  static TextStyle titleMedium2 = titleLarge1.copyWith(
    fontSize: 18.0,
  );
  static TextStyle titleSmall1 = titleLarge1.copyWith(
    fontSize: 15.0,
  );
  static TextStyle titleSmall = titleLarge1.copyWith(
    fontSize: 14.0,
  );

  static TextStyle subTitleLarge = titleLarge1.copyWith(
    fontWeight: semiBold,
  );
  static TextStyle subTitleMedium1 = titleMedium1.copyWith(
    fontWeight: semiBold,
  );
  static TextStyle subTitleMedium2 = titleMedium2.copyWith(
    fontWeight: semiBold,
  );
  static TextStyle subTitleSmall1 = titleSmall1.copyWith(
    fontWeight: semiBold,
  );
  static TextStyle subTitleSmall = titleSmall.copyWith(
    fontWeight: semiBold,
  );

  static TextStyle contentMedium1 = const TextStyle(
    color: ColorConst.bodyText,
    fontSize: 18.0,
    fontWeight: medium,
  );
  static TextStyle contentMedium2 = contentMedium1.copyWith(
    fontSize: 16.0,
  );
  static TextStyle contentSmall = contentMedium1.copyWith(
    fontSize: 14.0,
  );

  static TextStyle lightContentMedium1 = contentMedium1.copyWith(
    fontWeight: light,
  );
  static TextStyle lightContentMedium2 = contentMedium2.copyWith(
    fontWeight: light,
  );
  static TextStyle lightContentSmall = contentSmall.copyWith(
    fontWeight: light,
  );
}
