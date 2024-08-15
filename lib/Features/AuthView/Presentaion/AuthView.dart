import 'package:el7kma/Features/AuthView/Presentaion/views/AuthViewBody.dart';
import 'package:flutter/material.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff022B3A),
      body: AuthViewBody(),
    );
  }
}
