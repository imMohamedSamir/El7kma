part of 'expenses_get_cubit.dart';

@immutable
sealed class ExpensesGetState {}

final class ExpensesGetInitial extends ExpensesGetState {}

final class ExpensesGetLoading extends ExpensesGetState {}

final class ExpensesGetSuccess extends ExpensesGetState {
  final List<ExpensesModel> expneses;

  ExpensesGetSuccess({required this.expneses});
}

final class ExpensesGetFailure extends ExpensesGetState {}
