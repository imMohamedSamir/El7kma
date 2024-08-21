import 'package:bloc/bloc.dart';
import 'package:el7kma/Features/CustomerView/Presentaion/CustomerView.dart';
import 'package:el7kma/Features/DashboardView/Presentaion/DashboardView.dart';
import 'package:el7kma/Features/EmployeesView/Presentaion/EmployeesView.dart';
import 'package:el7kma/Features/ExpansesView/Presentaion/ExpensesView.dart';
import 'package:el7kma/Features/ExportBills/Presentaion/ExportBillsView.dart';
import 'package:el7kma/Features/ImportBillsView/Presentaion/ImportBillsView.dart';
import 'package:el7kma/Features/ImportView/Presentaion/ImportView.dart';
import 'package:el7kma/Features/InventoryView/Presentaion/InventoryView.dart';
import 'package:el7kma/Features/SellView/Presentaion/SellView.dart';
import 'package:flutter/material.dart';

part 'choose_page_state.dart';

class ChoosePageCubit extends Cubit<ChoosePageState> {
  ChoosePageCubit() : super(ChoosePageInitial());
  void choosePage({required int page}) {
    emit(ChoosePageInitial());
    if (5 > 0) {
      switch (page) {
        case 0:
          emit(ChoosePageChoosed(page: const DashboardView()));
          break;
        case 1:
          emit(ChoosePageChoosed(page: const SellView()));
          break;
        case 2:
          emit(ChoosePageChoosed(page: const ExpenesesView()));
          break;
        case 3:
          emit(ChoosePageChoosed(page: const InventoryView()));
          break;
        case 4:
          emit(ChoosePageChoosed(page: const ImportView()));
          break;
        case 5:
          emit(ChoosePageChoosed(page: const ImportBillsView()));
          break;
        case 6:
          emit(ChoosePageChoosed(page: const ExportBillsView()));
          break;

        case 7:
          emit(ChoosePageChoosed(page: const Employeesview()));
          break;
        case 8:
          emit(ChoosePageChoosed(page: const CustomerView()));
          break;

        default:
      }
    } else {
      switch (page) {
        case 0:
          emit(ChoosePageChoosed(page: const SellView()));
          break;
        case 1:
          emit(ChoosePageChoosed(page: const ExpenesesView()));
          break;
        case 2:
          emit(ChoosePageChoosed(page: const InventoryView()));
          break;

        default:
      }
    }
  }
}
