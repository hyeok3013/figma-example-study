import 'package:flutter/material.dart';

abstract class Typo {
  final String name;
  final FontWeight light;
  final FontWeight regular;
  final FontWeight semiBold;

  Typo({
    required this.name,
    required this.light,
    required this.regular,
    required this.semiBold,
  });
}

class AirbnbCereal implements Typo {
  const AirbnbCereal();

  @override
  final String name = 'airbnb_cereal';

  @override
  final FontWeight light = FontWeight.w300;

  @override
  final FontWeight regular = FontWeight.w400;

  @override
  final FontWeight semiBold = FontWeight.w500;
}
