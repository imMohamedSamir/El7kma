import 'package:bloc/bloc.dart';
import 'package:el7kma/Features/CustomerView/data/models/CustomerModel.dart';
import 'package:el7kma/Features/CustomerView/data/repo/CustomerRepo.dart';
import 'package:meta/meta.dart';

part 'customer_state.dart';

class CustomerCubit extends Cubit<CustomerState> {
  CustomerCubit(this._customerRepo) : super(CustomerInitial());
  final CustomerRepo _customerRepo;
  void get() async {
    emit(CustomerLaoding());
    var result = await _customerRepo.getCustomer();
    result.fold((fail) => emit(CustomerFailure()),
        (customers) => emit(CustomerSuccess(customers: customers)));
  }
}
