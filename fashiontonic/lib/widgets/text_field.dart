// custom text field

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.label,
    required this.onChanged,
  }) : super(key: key);

  final String label;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {},
      cursorColor: const Color(0xFF191B26),
      style: const TextStyle(
        color: Color(0xFF191B26),
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade100,
        prefixIconColor: const Color(0xFF191B26),
        prefixIcon: const Icon(CupertinoIcons.search),
        hintText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
