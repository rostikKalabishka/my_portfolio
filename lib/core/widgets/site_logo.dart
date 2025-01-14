import 'package:flutter/material.dart';

class SiteLogo extends StatelessWidget {
  const SiteLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(32)),
      child: Text(
        'RK',
        style: TextStyle(fontSize: 32),
      ),
    );
  }
}
