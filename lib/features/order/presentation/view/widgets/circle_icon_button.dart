import 'package:flutter/material.dart';

import '../../../../../core/assets/app_colors.dart';

class CircleIconButton extends StatelessWidget {
  final String symbol;
  final VoidCallback onTap;

  const CircleIconButton({
    super.key,
    required this.symbol,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 28,
        height: 28,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.orange,
        ),
        alignment: Alignment.center,
        child: Text(symbol, style: const TextStyle(color: AppColors.white)),
      ),
    );
  }
}
