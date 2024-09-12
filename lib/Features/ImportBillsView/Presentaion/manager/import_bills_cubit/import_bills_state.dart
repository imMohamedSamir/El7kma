part of 'import_bills_cubit.dart';

@immutable
sealed class ImportBillsState {}

final class ImportBillsInitial extends ImportBillsState {}

final class ImportBillsLoading extends ImportBillsState {}

final class ImportBillsSuccess extends ImportBillsState {
  final List<ImportBillsModel> bills;

  ImportBillsSuccess({required this.bills});
}

final class ImportBillsFailure extends ImportBillsState {}
