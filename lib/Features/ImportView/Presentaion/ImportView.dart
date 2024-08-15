import 'package:el7kma/Core/Utlis/AppBarMethod.dart';
import 'package:el7kma/Features/ImportView/Presentaion/views/ImportviewBody.dart';
import 'package:flutter/material.dart';

class ImportView extends StatelessWidget {
  const ImportView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context, title: "الوارد"),
      body: const ImportviewBody(),
    );
  }
}
