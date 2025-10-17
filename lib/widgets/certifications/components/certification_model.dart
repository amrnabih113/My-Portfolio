import 'package:flutter/material.dart';

/// Model class for certification data
class CertificationModel {
  final String title;
  final String provider;
  final String year;
  final String description;
  final IconData icon;
  final Color color;
  final String? certificateUrl;

  const CertificationModel({
    required this.title,
    required this.provider,
    required this.year,
    required this.description,
    required this.icon,
    required this.color,
    this.certificateUrl,
  });
}
