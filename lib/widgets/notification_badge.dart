import 'package:flutter/material.dart';

class NotificationBadge extends StatelessWidget {
  final Icon icon;
  final String badgeText;
  final VoidCallback onTap;

  const NotificationBadge({
    Key? key,
    required this.icon,
    required this.badgeText,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: onTap,
          icon: icon,
        ),
        Positioned(
          right: 0,
          top: 0,
          child: Container(
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            constraints: BoxConstraints(
              minWidth: 14,
              minHeight: 14,
            ),
            child: Text(
              badgeText,
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
