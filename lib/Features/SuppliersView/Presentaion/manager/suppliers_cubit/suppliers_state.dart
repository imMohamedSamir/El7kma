part of 'suppliers_cubit.dart';

@immutable
sealed class SuppliersState {}

final class SuppliersInitial extends SuppliersState {}

final class SuppliersLoading extends SuppliersState {}

final class SuppliersSuccess extends SuppliersState {
  final List<SuppliersModel> suppliers;

  SuppliersSuccess({required this.suppliers});
}

final class SuppliersFailure extends SuppliersState {}

final class SuppliersEdited extends SuppliersState {}
