import 'package:flutter/material.dart';

Widget radioButton(String value, IconData icon, Color color, int index) {
  return OutlineButton(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
    color: Color(0xff3C438C),
    onPressed: () {},
    child: Row(
      children: [
        Icon(
          icon,
          color: color,
        ),
        SizedBox(
          width: 10.0,
        ),
        Text(
          value,
          style: TextStyle(color: color),
        )
      ],
    ),
  );
}
