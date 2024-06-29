import 'package:flutter/material.dart';

class FloatingActionButtonIcon extends StatefulWidget {
  const FloatingActionButtonIcon({
    super.key,
    required this.currentIndex,
    required this.index,
    required this.icon,
    required this.onPressed,
  });
  final int currentIndex;
  final int index;
  final IconData icon;
  final void Function()? onPressed;
  @override
  State<FloatingActionButtonIcon> createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<FloatingActionButtonIcon> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      icon: Icon(widget.icon),
      onPressed: widget.onPressed,
      color: widget.currentIndex == widget.index ? Colors.white : Colors.grey,
      iconSize: widget.currentIndex == widget.index ? 30 : 23,
    );
  }
}
