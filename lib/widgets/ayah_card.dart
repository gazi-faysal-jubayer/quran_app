import 'package:flutter/material.dart';
import '../models/ayah.dart';

class AyahCard extends StatelessWidget {
  final Ayah ayah;

  AyahCard({required this.ayah});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              ayah.textArabic,
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.right,
            ),
            SizedBox(height: 8),
            Text(
              ayah.translation,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}