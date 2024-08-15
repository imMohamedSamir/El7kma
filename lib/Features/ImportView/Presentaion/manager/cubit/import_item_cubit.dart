import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'import_item_state.dart';

class ImportItemCubit extends Cubit<ImportItemState> {
  ImportItemCubit() : super(ImportItemInitial());
}
