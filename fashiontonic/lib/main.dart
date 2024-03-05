import 'package:fashiontonic/screens/cart.dart';
import 'package:fashiontonic/screens/nav.dart';
import 'package:fashiontonic/state/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  Get.put(Controller());
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fashiontonic',
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.outfitTextTheme(),
      ),
      home: Nav(),
      routes: {
        "/cart": (context) => const Cart(),
      },
    ),
  );
}
