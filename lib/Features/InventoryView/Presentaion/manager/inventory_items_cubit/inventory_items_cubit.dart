import 'package:bloc/bloc.dart';
import 'package:el7kma/Features/InventoryView/data/models/inventory_items_model.dart';
import 'package:el7kma/Features/InventoryView/data/repo/IneventoryRepo.dart';
import 'package:meta/meta.dart';

part 'inventory_items_state.dart';

class InventoryItemsCubit extends Cubit<InventoryItemsState> {
  InventoryItemsCubit(this._ineventoryRepo) : super(InventoryItemsInitial());
  final IneventoryRepo _ineventoryRepo;
  Inventoryitemsmodel savedItem = Inventoryitemsmodel();
  void get({String? code, String? name, int? pageSize}) async {
    emit(InventoryItemsLoading());
    var result = await _ineventoryRepo.getItems(
        code: code ?? "", name: name ?? "", pageSize: pageSize);
    result.fold((fail) => emit(InventoryItemsFailure(errMsg: fail.errMessage)),
        (items) => emit(InventoryItemsSuccess(items: items)));
  }

  void edit() async {
    emit(InventoryItemsLoading());
    var result = await _ineventoryRepo.editItems(item: savedItem);
    result.fold((fail) => emit(InventoryItemsFailure(errMsg: fail.errMessage)),
        (items) {
      get();
    });
  }

  void delete({required String id}) async {
    emit(InventoryItemsLoading());
    var result = await _ineventoryRepo.deleteItems(id: id);
    result.fold((fail) => emit(InventoryItemsFailure(errMsg: fail.errMessage)),
        (items) {
      get();
    });
  }
}
