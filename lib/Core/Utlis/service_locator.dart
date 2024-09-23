import 'package:dio/dio.dart';
import 'package:el7kma/Core/Utlis/ApiServices.dart';
import 'package:el7kma/Features/AuthView/data/repo/AuthRepoImpl.dart';
import 'package:el7kma/Features/CustomerView/data/repo/CustomerRepoImpl.dart';
import 'package:el7kma/Features/DamagedAndReturnView/data/repo/DamagedAndReturnRepoImple.dart';
import 'package:el7kma/Features/EmployeesView/data/repo/EmployeeRepoImpl.dart';
import 'package:el7kma/Features/ExpansesView/data/repo/ExpensesRepoImpl.dart';
import 'package:el7kma/Features/ExportBills/data/repo/ExportBillsRepoImpl.dart';
import 'package:el7kma/Features/ImportBillsView/data/repo/ImportBillsRepoImpl.dart';
import 'package:el7kma/Features/ImportView/data/repo/ImportRepoImpl.dart';
import 'package:el7kma/Features/InventoryView/data/repo/InvenetoryRepoImpl.dart';
import 'package:el7kma/Features/SellView/data/repo/ExportRepoImpl.dart';
import 'package:el7kma/Features/SuppliersView/data/repo/SupplierRepoImpl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ElhekmaServices>(ElhekmaServices(Dio()));
  getIt.registerSingleton<AuthRepoImpl>(
      AuthRepoImpl(getIt.get<ElhekmaServices>()));
  getIt.registerSingleton<InvenetoryRepoImpl>(
      InvenetoryRepoImpl(getIt.get<ElhekmaServices>()));
  getIt.registerSingleton<ExportBillsRepoImpl>(
      ExportBillsRepoImpl(getIt.get<ElhekmaServices>()));
  getIt.registerSingleton<EmployeeRepoImpl>(
      EmployeeRepoImpl(getIt.get<ElhekmaServices>()));
  getIt.registerSingleton<CustomerRepoImpl>(
      CustomerRepoImpl(getIt.get<ElhekmaServices>()));
  getIt.registerSingleton<ImportBillsRepoImpl>(
      ImportBillsRepoImpl(getIt.get<ElhekmaServices>()));
  getIt.registerSingleton<SupplierRpoImpl>(
      SupplierRpoImpl(getIt.get<ElhekmaServices>()));
  getIt.registerSingleton<ImportRepoImpl>(
      ImportRepoImpl(getIt.get<ElhekmaServices>()));
  getIt.registerSingleton<ExportRepoImpl>(
      ExportRepoImpl(getIt.get<ElhekmaServices>()));
  getIt.registerSingleton<ExpensesRepoImpl>(
      ExpensesRepoImpl(getIt.get<ElhekmaServices>()));
  getIt.registerSingleton<DamagedAndReturnRepoImpl>(
      DamagedAndReturnRepoImpl(getIt.get<ElhekmaServices>()));
}
