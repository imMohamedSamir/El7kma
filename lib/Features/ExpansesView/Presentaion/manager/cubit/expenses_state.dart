part of 'expenses_cubit.dart';

@immutable
sealed class ExpensesState {}

final class ExpensesInitial extends ExpensesState {}

final class ExpensesLoading extends ExpensesState {}

final class ExpensesFailure extends ExpensesState {}

final class ExpensesSuccess extends ExpensesState {}

final class ExpensesCleared extends ExpensesState {}
