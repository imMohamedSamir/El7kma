import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_item_state.dart';

class AddItemCubit extends Cubit<AddItemState> {
  AddItemCubit() : super(AddItemInitial());
  List<String> _items = []; // List of items

  void addItem(String item) {
    _items.add(item);
    emit(AddItemUpdated(List.from(_items)));
  }

  void removeItem(int index) {
    _items.removeAt(index);
    emit(AddItemUpdated(List.from(_items)));
  }
}
