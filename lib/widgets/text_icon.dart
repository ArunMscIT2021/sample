import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextIcon extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final String label;
  const TextIcon({super.key, required this.onTap, required this.icon, required
  this.label});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, top: 15, bottom: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Icon(
              icon,
              size: 20,
            ),
            const SizedBox(width: 10),
            Text(label, style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
          ],
        ),
      ),
    );
  }
}
