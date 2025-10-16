import 'package:flutter/material.dart';
import '../../../utils/utils.dart';

/// Version info widget
class FooterVersionInfo extends StatelessWidget {
  final String version;

  const FooterVersionInfo({super.key, required this.version});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Version $version',
      style: AppTextStyles.caption,
      textAlign: TextAlign.center,
    );
  }
}
