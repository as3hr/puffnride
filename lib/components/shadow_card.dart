import 'package:flutter/material.dart';

class ShadowCard extends StatelessWidget {
  const ShadowCard({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(17),
      ),
      elevation: 7,
      color: Colors.white,
      child: child,
    );
  }
}
