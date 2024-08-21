import 'package:el7kma/Core/Utlis/AppBarMethod.dart';
import 'package:el7kma/Core/Utlis/service_locator.dart';
import 'package:el7kma/Features/CustomerView/Presentaion/manager/customer_cubit/customer_cubit.dart';
import 'package:el7kma/Features/CustomerView/Presentaion/views/CustomerViewBody.dart';
import 'package:el7kma/Features/CustomerView/data/repo/CustomerRepoImpl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerView extends StatelessWidget {
  const CustomerView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CustomerCubit(getIt.get<CustomerRepoImpl>())..get(),
      child: Scaffold(
        appBar: homeAppBar(context, title: "العملاء"),
        body: const CustomerViewBody(),
      ),
    );
  }
}
