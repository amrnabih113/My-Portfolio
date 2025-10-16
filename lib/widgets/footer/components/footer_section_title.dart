import 'package:flutter/material.dart';
import '../../../utils/utils.dart';

/// Footer section title
class FooterSectionTitle extends StatelessWidget {
  const FooterSectionTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Let\'s Connect',
      style: AppTextStyles.h5,
      textAlign: TextAlign.center,
    );
  }
}
