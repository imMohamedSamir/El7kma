import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:el7kma/Features/InventoryView/data/models/InventoryItemsModel.dart';
import 'package:el7kma/Features/InventoryView/data/repo/IneventoryRepo.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'edit_item_state.dart';

class EditItemCubit extends Cubit<EditItemState> {
  EditItemCubit(this._ineventoryRepo) : super(EditItemInitial());
  final IneventoryRepo _ineventoryRepo;
  final key = GlobalKey<FormState>();
  Inventoryitemsmodel savedItem = Inventoryitemsmodel();
  void edit() async {
    log(savedItem.toJson().toString());
  }
}
