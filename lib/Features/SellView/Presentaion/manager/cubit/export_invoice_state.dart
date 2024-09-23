part of 'export_invoice_cubit.dart';

@immutable
sealed class ExportInvoiceState {}

final class ExportInvoiceInitial extends ExportInvoiceState {}

final class ExportInvoiceLoading extends ExportInvoiceState {}

final class ExportInvoiceSuccess extends ExportInvoiceState {}

final class ExportInvoiceFailure extends ExportInvoiceState {}

final class ExportInvoiceCleared extends ExportInvoiceState {}

final class ExportInvoiceOutOfStock extends ExportInvoiceState {
  final String itemName;

  ExportInvoiceOutOfStock({required this.itemName});
}
