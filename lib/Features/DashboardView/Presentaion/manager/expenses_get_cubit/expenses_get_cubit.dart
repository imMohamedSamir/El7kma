import 'package:bloc/bloc.dart';
import 'package:el7kma/Features/OthersView/data/models/expenses_model/expenses_model.dart';
import 'package:el7kma/Features/OthersView/data/repo/ExpensesRepo.dart';
import 'package:meta/meta.dart';

part 'expenses_get_state.dart';

class ExpensesGetCubit extends Cubit<ExpensesGetState> {
  ExpensesGetCubit(this._expensesRepo) : super(ExpensesGetInitial());
  final ExpensesRepo _expensesRepo;
  void get({String? employeeName}) async {
    emit(ExpensesGetLoading());
    final result = await _expensesRepo.get(employeeName: employeeName);
    result.fold((l) => emit(ExpensesGetFailure()),
        (expneses) => emit(ExpensesGetSuccess(expneses: expneses)));
  }
}
