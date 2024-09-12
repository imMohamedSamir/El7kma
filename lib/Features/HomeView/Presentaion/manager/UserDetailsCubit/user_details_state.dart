part of 'user_details_cubit.dart';

@immutable
sealed class UserDetailsState {}

final class UserDetailsInitial extends UserDetailsState {}

final class UserDetailsLoading extends UserDetailsState {}

final class UserDetailsSuccess extends UserDetailsState {
  final String userName, role;

  UserDetailsSuccess({required this.userName, required this.role});
}

final class UserDetailsFailure extends UserDetailsState {}
