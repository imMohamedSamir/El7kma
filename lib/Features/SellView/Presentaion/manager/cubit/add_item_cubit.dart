import 'package:bloc/bloc.dart';
import 'package:el7kma/Core/Utlis/Constatnts.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'add_item_state.dart';

class AddItemCubit extends Cubit<AddItemState> {
  AddItemCubit() : super(AddItemInitial());
  final List<String> _items = []; // List of items
  int key = 0;
  void addItem(String item) {}

  void removeItem(int index) {
    _items.removeAt(index);
    emit(AddItemUpdated(List.from(_items)));
  }
}
