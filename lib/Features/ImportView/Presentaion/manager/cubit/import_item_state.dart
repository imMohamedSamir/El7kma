part of 'import_item_cubit.dart';

@immutable
sealed class ImportItemState {}

final class ImportItemInitial extends ImportItemState {}

final class ImportItemLoadign extends ImportItemState {}

final class ImportItemSuccess extends ImportItemState {}

final class ImportItemFailure extends ImportItemState {}

final class ImportItemClear extends ImportItemState {}
