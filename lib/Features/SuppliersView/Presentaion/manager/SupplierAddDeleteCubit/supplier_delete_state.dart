part of 'SupplierAddDeleteCubit.dart';

@immutable
sealed class SupplierDeleteState {}

final class SupplierDeleteInitial extends SupplierDeleteState {}

final class SupplierDeleteLoading extends SupplierDeleteState {}

final class SupplierDeleteSuccess extends SupplierDeleteState {}

final class SupplierAddSuccess extends SupplierDeleteState {}

final class SupplierDeleteFailure extends SupplierDeleteState {}
