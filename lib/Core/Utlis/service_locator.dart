import 'package:dio/dio.dart';
import 'package:el7kma/Core/Utlis/ApiServices.dart';
import 'package:el7kma/Features/AuthView/data/repo/AuthRepoImpl.dart';
import 'package:el7kma/Features/CustomerView/data/repo/CustomerRepoImpl.dart';
import 'package:el7kma/Features/EmployeesView/data/repo/EmployeeRepoImpl.dart';
import 'package:el7kma/Features/ExportBills/data/repo/ExportRepImpl.dart';
import 'package:el7kma/Features/ImportBillsView/data/repo/ImportBillsRepoImpl.dart';
import 'package:el7kma/Features/ImportView/data/repo/ImportRepoImpl.dart';
import 'package:el7kma/Features/InventoryView/data/repo/InvenetoryRepoImpl.dart';
import 'package:el7kma/Features/SuppliersView/data/repo/SupplierRepoImpl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ElhekmaServices>(ElhekmaServices(Dio()));
  getIt.registerSingleton<AuthRepoImpl>(
      AuthRepoImpl(getIt.get<ElhekmaServices>()));
  getIt.registerSingleton<InvenetoryRepoImpl>(
      InvenetoryRepoImpl(getIt.get<ElhekmaServices>()));
  getIt.registerSingleton<ExportRepImpl>(
      ExportRepImpl(getIt.get<ElhekmaServices>()));
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
}
