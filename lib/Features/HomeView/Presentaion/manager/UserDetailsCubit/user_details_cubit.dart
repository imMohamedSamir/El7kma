import 'package:bloc/bloc.dart';
import 'package:el7kma/Core/Utlis/TokenManger.dart';
import 'package:meta/meta.dart';

part 'user_details_state.dart';

class UserDetailsCubit extends Cubit<UserDetailsState> {
  UserDetailsCubit() : super(UserDetailsInitial());
  void get() async {
    emit(UserDetailsLoading());
    await TokenManager.getUserDetails().then((value) {
      emit(UserDetailsSuccess(userName: value.userName!, role: value.role!));
    });
  }
}
