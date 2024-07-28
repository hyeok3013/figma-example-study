import 'package:flutter/material.dart';

class Onboarding {
  final Image image;
  final String title;
  final String? subtitle;

  Onboarding({
    required this.image,
    required this.title,
    this.subtitle,
  });
}
