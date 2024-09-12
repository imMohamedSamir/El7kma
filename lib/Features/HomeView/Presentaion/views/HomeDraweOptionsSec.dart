import 'package:el7kma/Core/Utlis/AppAssets.dart';
import 'package:el7kma/Core/Utlis/Constatnts.dart';
import 'package:el7kma/Features/HomeView/Presentaion/manager/UserDetailsCubit/user_details_cubit.dart';
import 'package:el7kma/Features/HomeView/Presentaion/manager/choose_page_cubit/choose_page_cubit.dart';
import 'package:el7kma/Features/HomeView/Presentaion/views/HomeDrawerOptionsCard.dart';
import 'package:el7kma/Features/HomeView/Presentaion/views/OptionsLoding.dart';
import 'package:el7kma/Features/HomeView/data/models/DrawerOptionsModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeDraweOptionsSec extends StatefulWidget {
  const HomeDraweOptionsSec({super.key});

  @override
  State<HomeDraweOptionsSec> createState() => _HomeDraweOptionsSecState();
}

class _HomeDraweOptionsSecState extends State<HomeDraweOptionsSec> {
  int selectedIndex = 8;
  bool isAdmin = false;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ChoosePageCubit>(context).choosePage(page: selectedIndex);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDetailsCubit, UserDetailsState>(
      builder: (context, state) {
        if (state is UserDetailsSuccess) {
          final List<DrawerOptionsModel> options = getOptions(role: state.role);
          return Column(
            children: List.generate(
                options.length,
                (index) => HomeDrawerOptionsCard(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                          BlocProvider.of<ChoosePageCubit>(context)
                              .choosePage(page: index, isAdmin: isAdmin);
                        });
                      },
                      optionsModel: options[index],
                      isActive: selectedIndex == index,
                    )),
          );
        } else {
          return const OptionsLoding();
        }
      },
    );
  }

  List<DrawerOptionsModel> getOptions({required String role}) {
    List<DrawerOptionsModel> options = [];
    if (role != employeeRole || role != "موظف") {
      isAdmin = true;
      options = [
        DrawerOptionsModel(title: "الادارة", img: Assets.imagesDashboardIcon),
        DrawerOptionsModel(title: "البيع", img: Assets.imagesSellIcon),
        DrawerOptionsModel(title: "المصاريف", img: Assets.imagesExpnesesIcon),
        DrawerOptionsModel(title: "المخزن", img: Assets.imagesInventory),
        DrawerOptionsModel(title: "الوارد", img: Assets.imagesImportIcon),
        DrawerOptionsModel(
            title: "فواتير الواردات", img: Assets.imagesImportsBills),
        DrawerOptionsModel(
            title: "فواتير البيع", img: Assets.imagesExportBills),
        DrawerOptionsModel(title: "الموظفين", img: Assets.imagesEmployeesIcon),
        DrawerOptionsModel(title: "العملاء", img: Assets.imagesCustomerIcon),
        DrawerOptionsModel(title: "الموردين", img: Assets.imagesSupplierIcon),
      ];
    } else {
      isAdmin = true;
      options = [
        DrawerOptionsModel(title: "البيع", img: Assets.imagesSellIcon),
        DrawerOptionsModel(title: "المصاريف", img: Assets.imagesExpnesesIcon),
        DrawerOptionsModel(title: "المخزن", img: Assets.imagesInventory),
      ];
    }
    return options;
  }
}
