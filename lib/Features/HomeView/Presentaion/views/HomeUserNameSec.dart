import 'package:el7kma/Core/Utlis/AppStyles.dart';
import 'package:el7kma/Features/HomeView/Presentaion/manager/UserDetailsCubit/user_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeUserNameSec extends StatelessWidget {
  const HomeUserNameSec({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(16)),
      child: BlocBuilder<UserDetailsCubit, UserDetailsState>(
        builder: (context, state) {
          if (state is UserDetailsSuccess) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.userName,
                  style: AppStyles.styleMedium16(context)
                      .copyWith(color: Colors.white),
                ),
                const Gap(2),
                Text(state.role,
                    style: AppStyles.styleRegular14(context)
                        .copyWith(color: Colors.grey))
              ],
            );
          } else {
            return Skeletonizer(
                enabled: state is UserDetailsLoading,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "state.userName",
                      style: AppStyles.styleMedium16(context)
                          .copyWith(color: Colors.grey),
                    ),
                    const Gap(2),
                    Text("state",
                        style: AppStyles.styleRegular14(context)
                            .copyWith(color: Colors.grey))
                  ],
                ));
          }
        },
      ),
    );
  }
}
