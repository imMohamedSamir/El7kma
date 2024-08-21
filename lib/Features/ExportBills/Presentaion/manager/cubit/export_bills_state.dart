part of 'export_bills_cubit.dart';

@immutable
sealed class ExportBillsState {}

final class ExportBillsInitial extends ExportBillsState {}

final class ExportBillsLoading extends ExportBillsState {}

final class ExportBillsSuccess extends ExportBillsState {
  final List<ExportBillModel> bills;

  ExportBillsSuccess({required this.bills});
}

final class ExportBillsFailure extends ExportBillsState {}
