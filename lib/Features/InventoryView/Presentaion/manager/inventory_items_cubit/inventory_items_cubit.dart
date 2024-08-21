import 'package:bloc/bloc.dart';
import 'package:el7kma/Features/InventoryView/data/models/InventoryItemsModel.dart';
import 'package:el7kma/Features/InventoryView/data/repo/IneventoryRepo.dart';
import 'package:meta/meta.dart';

part 'inventory_items_state.dart';

class InventoryItemsCubit extends Cubit<InventoryItemsState> {
  InventoryItemsCubit(this._ineventoryRepo) : super(InventoryItemsInitial());
  final IneventoryRepo _ineventoryRepo;
  void get({String? code, String? name}) async {
    emit(InventoryItemsLoading());
    var result =
        await _ineventoryRepo.getItems(code: code ?? "", name: name ?? "");
    result.fold((fail) => emit(InventoryItemsFailure()),
        (items) => emit(InventoryItemsSuccess(items: items)));
  }
}
