// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:let_me_in_uc/util/AppColor.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Help"),
        backgroundColor: AppColor.ucRed,
      ),
    );
  }
}
