import 'package:el7kma/Core/Utlis/AppBarMethod.dart';
import 'package:el7kma/Core/Utlis/service_locator.dart';
import 'package:el7kma/Features/SuppliersView/Presentaion/manager/suppliers_cubit/suppliers_cubit.dart';
import 'package:el7kma/Features/SuppliersView/Presentaion/views/SuppliersViewBody.dart';
import 'package:el7kma/Features/SuppliersView/data/repo/SupplierRepoImpl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuppliersView extends StatelessWidget {
  const SuppliersView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SuppliersCubit(getIt.get<SupplierRpoImpl>())..get(),
      child: Scaffold(
        appBar: homeAppBar(context, title: "الموردين"),
        body: const SuppliersViewBody(),
      ),
    );
  }
}
