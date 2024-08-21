part of 'edit_item_cubit.dart';

@immutable
sealed class EditItemState {}

final class EditItemInitial extends EditItemState {}

final class EditItemLoading extends EditItemState {}

final class EditItemSuccess extends EditItemState {}

final class EditItemFailure extends EditItemState {}
