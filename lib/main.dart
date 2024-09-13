import 'package:el7kma/Core/Manager/language_cubit/language_cubit.dart';
import 'package:el7kma/Core/Utlis/HiveAdapters.dart';
import 'package:el7kma/Core/Utlis/InitHive.dart';
import 'package:el7kma/Core/Utlis/WindowSize.dart';
import 'package:el7kma/Core/Utlis/blocObs.dart';
import 'package:el7kma/Core/Utlis/service_locator.dart';
import 'package:el7kma/Features/AuthView/Presentaion/AuthView.dart';
import 'package:el7kma/Features/CustomerView/Presentaion/manager/add_customer_cubit/add_customer_cubit.dart';
import 'package:el7kma/Features/CustomerView/data/repo/CustomerRepoImpl.dart';
import 'package:el7kma/Features/EmployeesView/Presentaion/manager/add_employee_cubit/add_employee_cubit.dart';
import 'package:el7kma/Features/EmployeesView/Presentaion/manager/employee_cubit/employee_cubit.dart';
import 'package:el7kma/Features/EmployeesView/data/repo/EmployeeRepoImpl.dart';
import 'package:el7kma/Features/HomeView/Presentaion/HomeView.dart';
import 'package:el7kma/Features/InventoryView/Presentaion/manager/inventory_items_cubit/inventory_items_cubit.dart';
import 'package:el7kma/Features/InventoryView/data/repo/InvenetoryRepoImpl.dart';
import 'package:el7kma/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  windowSize();

  Bloc.observer = SimpleBlocObserver();
  setupServiceLocator();
  await Hive.initFlutter();
  await callHiveAdapters();
  await openHiveBox();
  runApp(const El7kmaApp());
}

class El7kmaApp extends StatelessWidget {
  const El7kmaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LanguageCubit()),
        BlocProvider(
            create: (context) => EmployeeCubit(getIt.get<EmployeeRepoImpl>())),
        BlocProvider(
            create: (context) =>
                AddEmployeeCubit(getIt.get<EmployeeRepoImpl>())),
        BlocProvider(
            create: (context) =>
                AddCustomerCubit(getIt.get<CustomerRepoImpl>())),
        BlocProvider(
            create: (context) =>
                InventoryItemsCubit(getIt.get<InvenetoryRepoImpl>()))
        // BlocProvider(create: (context) => AnotherCubit()),
        // BlocProvider(create: (context) => YetAnotherCubit()),
      ],
      child: BlocBuilder<LanguageCubit, Locale>(
        builder: (context, state) {
          return MaterialApp(
            theme: ThemeData(scaffoldBackgroundColor: const Color(0xffEFF1F2)),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            locale: state,
            supportedLocales: S.delegate.supportedLocales,
            debugShowCheckedModeBanner: false,
            home: const AuthView(),
          );
        },
      ),
    );
  }
}
