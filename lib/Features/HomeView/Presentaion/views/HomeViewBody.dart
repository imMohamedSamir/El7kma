import 'package:el7kma/Features/HomeView/Presentaion/manager/choose_page_cubit/choose_page_cubit.dart';
import 'package:el7kma/Features/HomeView/Presentaion/views/HomeDrawerSec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const HomeDrawerSec(),
        Expanded(
            flex: 6,
            child: BlocBuilder<ChoosePageCubit, ChoosePageState>(
              builder: (context, state) {
                if (state is ChoosePageChoosed) {
                  return state.page;
                } else {
                  return const SizedBox();
                }
              },
            ))
      ],
    );
  }
}
