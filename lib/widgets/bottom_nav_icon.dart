import 'package:flutter/material.dart';

class BottomNavigationIcon extends StatefulWidget {
  final VoidCallback onTap;
  final IconData icon;
  final Color color;

  const BottomNavigationIcon({
    Key? key,
    required this.onTap,
    required this.icon, required this.color,
  }) : super(key: key);

  @override
  State<BottomNavigationIcon> createState() => _BottomNavigationIconState();
}

class _BottomNavigationIconState extends State<BottomNavigationIcon> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      enableFeedback: false,
      onPressed: widget.onTap,
      icon: Icon(
        widget.icon,
        color: widget.color,
        size: 24,
      ),
    );
  }
}
