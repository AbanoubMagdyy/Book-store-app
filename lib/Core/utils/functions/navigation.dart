import 'package:flutter/material.dart';

void navigateAndFinish(context, Widget screen) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => screen,
      ),
      (route) => false,
    );

void navigateTo(context, Widget screen) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
