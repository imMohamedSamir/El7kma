part of 'customer_cubit.dart';

@immutable
sealed class CustomerState {}

final class CustomerInitial extends CustomerState {}

final class CustomerLaoding extends CustomerState {}

final class CustomerSuccess extends CustomerState {
  final List<CustomerModel> customers;

  CustomerSuccess({required this.customers});
}

final class CustomerFailure extends CustomerState {}
