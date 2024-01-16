

import 'package:flutter/material.dart';
class FormDecor {


    static InputDecoration formFieldInputDecoration({required BuildContext context, required String label, IconData? icon, IconData? suffIcon, Function? onPrs}) => InputDecoration(
      
      border: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white.withOpacity(0.3))),
      filled: true,
      fillColor: Colors.white.withOpacity(0.8),
      labelText: label,
      // labelStyle: text14BodyM(context),
      prefixIcon: (icon == null) ? null : Icon(icon),
      suffixIconColor: Colors.white.withOpacity(0.3));
}