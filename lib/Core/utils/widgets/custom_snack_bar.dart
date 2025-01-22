import 'package:flutter/material.dart';

import '../style/text_styles.dart';

void showTopSnackBar({
  required BuildContext context,
  required String message,
  required Color color,
}) {
  final overlay = Overlay.of(context);
  final overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: MediaQuery.paddingOf(context).top + 10, // Adjust for status bar
      left: 10,
      right: 10,
      child: Material(
        child: Container(
          padding: const EdgeInsetsDirectional.all(15),
          decoration: BoxDecoration(
            color: color.withOpacity(0.8),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(message, style: AppTextStyles.textStyle18),
        ),
      ),
    ),
  );

  overlay.insert(overlayEntry);

  Future.delayed(const Duration(seconds: 2), () {
    overlayEntry.remove();
  });
}
