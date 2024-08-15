import 'package:el7kma/Core/Utlis/AppBarMethod.dart';
import 'package:el7kma/Features/SellView/Presentaion/manager/cubit/add_item_cubit.dart';
import 'package:el7kma/Features/SellView/Presentaion/views/SellviewBody.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SellView extends StatelessWidget {
  const SellView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddItemCubit(),
      child: Scaffold(
        appBar: homeAppBar(context, title: "البيع"),
        body: const SellviewBody(),
      ),
    );
  }
}
