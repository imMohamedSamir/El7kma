part of 'add_customer_cubit.dart';

@immutable
sealed class AddCustomerState {}

final class AddCustomerInitial extends AddCustomerState {}

final class AddCustomerLoading extends AddCustomerState {}

final class AddCustomerSuccess extends AddCustomerState {}

final class AddCustomerDeleted extends AddCustomerState {}

final class AddCustomerFailure extends AddCustomerState {
  final String errMsg;

  AddCustomerFailure({required this.errMsg});
}
