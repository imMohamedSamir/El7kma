import 'package:el7kma/Features/HomeView/Presentaion/manager/choose_page_cubit/choose_page_cubit.dart';
import 'package:el7kma/Features/HomeView/Presentaion/views/HomeViewBody.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ChoosePageCubit(),
        ),
      ],
      child: const Scaffold(body: HomeViewBody()),
    );
  }
}
