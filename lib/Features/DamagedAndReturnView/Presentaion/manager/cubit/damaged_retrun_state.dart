part of 'damaged_retrun_cubit.dart';

@immutable
sealed class DamagedRetrunState {}

final class DamagedRetrunInitial extends DamagedRetrunState {}

final class DamagedRetrunLoading extends DamagedRetrunState {}

final class DamagedRetrunSuccess extends DamagedRetrunState {}

final class DamagedRetrunFailure extends DamagedRetrunState {}

final class DamagedRetrunCleared extends DamagedRetrunState {}
