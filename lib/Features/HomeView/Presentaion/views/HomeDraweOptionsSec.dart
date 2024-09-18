import 'package:el7kma/Core/Utlis/AppAssets.dart';
import 'package:el7kma/Core/Utlis/Constatnts.dart';
import 'package:el7kma/Features/HomeView/Presentaion/manager/UserDetailsCubit/user_details_cubit.dart';
import 'package:el7kma/Features/HomeView/Presentaion/manager/choose_page_cubit/choose_page_cubit.dart';
import 'package:el7kma/Features/HomeView/Presentaion/views/HomeDrawerOptionsCard.dart';
import 'package:el7kma/Features/HomeView/Presentaion/views/OptionsLoding.dart';
import 'package:el7kma/Features/HomeView/data/models/DrawerOptionsModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeDrawerOptionsSec extends StatefulWidget {
  const HomeDrawerOptionsSec({super.key});

  @override
  _HomeDrawerOptionsSecState createState() => _HomeDrawerOptionsSecState();
}

class _HomeDrawerOptionsSecState extends State<HomeDrawerOptionsSec> {
  int selectedIndex = 0;
  bool isAdmin = false;

  @override
  void initState() {
    super.initState();
    _updateSelectedPage(selectedIndex);
  }

  void _updateSelectedPage(int index) {
    BlocProvider.of<ChoosePageCubit>(context)
        .choosePage(page: index, isAdmin: isAdmin);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDetailsCubit, UserDetailsState>(
      builder: (context, state) {
        if (state is UserDetailsSuccess) {
          final List<DrawerOptionsModel> options =
              _getOptionsForRole(state.role);
          _updateSelectedPage(selectedIndex);

          return _buildDrawerOptions(options);
        } else {
          return const OptionsLoding();
        }
      },
    );
  }

  // Build the list of drawer options dynamically
  Widget _buildDrawerOptions(List<DrawerOptionsModel> options) {
    return Column(
      children: List.generate(
        options.length,
        (index) => HomeDrawerOptionsCard(
          onTap: () {
            setState(() {
              selectedIndex = index;
              _updateSelectedPage(index);
            });
          },
          optionsModel: options[index],
          isActive: selectedIndex == index,
        ),
      ),
    );
  }

  // Return the list of options based on the user's role
  List<DrawerOptionsModel> _getOptionsForRole(String role) {
    // isAdmin = role != employeeRole && role != "موظف";
    isAdmin = true;
    if (isAdmin) {
      return [
        DrawerOptionsModel(title: "الادارة", img: Assets.imagesDashboardIcon),
        DrawerOptionsModel(title: "البيع", img: Assets.imagesSellIcon),
        DrawerOptionsModel(
            title: "عمليات اخرى", img: Assets.imagesExpnesesIcon),
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
      return [
        DrawerOptionsModel(title: "البيع", img: Assets.imagesSellIcon),
        DrawerOptionsModel(
            title: "عمليات اخرى", img: Assets.imagesExpnesesIcon),
        DrawerOptionsModel(title: "المخزن", img: Assets.imagesInventory),
      ];
    }
  }
}
