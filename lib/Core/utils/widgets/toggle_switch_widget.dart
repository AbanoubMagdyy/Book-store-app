import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../style/colors.dart';

class ToggleSwitchWidget extends StatelessWidget {
  final List<String> labels;
  final void Function(int?) onChange;
  const ToggleSwitchWidget(
      {required this.labels, required this.onChange, super.key});

  @override
  Widget build(BuildContext context) {
    return ToggleSwitch(
      minWidth: double.infinity,
      cornerRadius: 10.0,
      activeBgColors: const [
        [AppColors.primaryColor],
        [AppColors.primaryColor],
      ],
      activeFgColor: AppColors.secondaryColor,
      inactiveBgColor: AppColors.primaryColor.withOpacity(.3),
      inactiveFgColor: Colors.green,
      initialLabelIndex: 0,
      totalSwitches: labels.length,
      labels: labels,
      customTextStyles: const [
        TextStyle(fontSize: 15),
      ],
      radiusStyle: true,
      onToggle: onChange,
    );
  }
}
