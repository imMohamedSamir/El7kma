part of 'inventory_items_cubit.dart';

@immutable
sealed class InventoryItemsState {}

final class InventoryItemsInitial extends InventoryItemsState {}

final class InventoryItemsLoading extends InventoryItemsState {}

final class InventoryItemsSuccess extends InventoryItemsState {
  final List<Inventoryitemsmodel> items;

  InventoryItemsSuccess({required this.items});
}

final class InventoryItemsFailure extends InventoryItemsState {}
