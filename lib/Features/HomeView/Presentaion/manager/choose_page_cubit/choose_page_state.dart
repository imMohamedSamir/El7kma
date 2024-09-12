part of 'choose_page_cubit.dart';

@immutable
sealed class ChoosePageState {}

final class ChoosePageInitial extends ChoosePageState {}

final class ChoosePageChoosed extends ChoosePageState {
  final Widget page;

  ChoosePageChoosed({required this.page});
}
