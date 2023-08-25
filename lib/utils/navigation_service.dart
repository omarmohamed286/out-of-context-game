import 'package:flutter/material.dart';

void navigateWithoutAnimation(BuildContext context, dynamic view) {
  Navigator.push(
      context,
      PageRouteBuilder(
          pageBuilder: (context, _, __) => view,
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero));
}

void navigateWithAnimation(BuildContext context, dynamic view) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => view,
      ));
}
