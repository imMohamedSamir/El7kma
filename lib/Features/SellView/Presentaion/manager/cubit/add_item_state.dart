part of 'add_item_cubit.dart';

@immutable
sealed class AddItemState {}

final class AddItemInitial extends AddItemState {}

final class AddItemAdded extends AddItemState {
  final List<String> items;

  AddItemAdded({required this.items}); // Use the appropriate type
}

class AddItemUpdated extends AddItemState {
  final List<String> items; // Use the appropriate type

  AddItemUpdated(this.items);
}
