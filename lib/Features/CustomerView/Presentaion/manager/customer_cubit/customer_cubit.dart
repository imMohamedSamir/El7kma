import 'package:bloc/bloc.dart';
import 'package:el7kma/Features/CustomerView/data/models/CustomerModel.dart';
import 'package:el7kma/Features/CustomerView/data/models/add_customer_model.dart';
import 'package:el7kma/Features/CustomerView/data/repo/CustomerRepo.dart';
import 'package:meta/meta.dart';

part 'customer_state.dart';

class CustomerCubit extends Cubit<CustomerState> {
  CustomerCubit(this._customerRepo) : super(CustomerInitial());
  final CustomerRepo _customerRepo;
  AddCustomerModel editedCustomer = AddCustomerModel();
  void get() async {
    emit(CustomerLaoding());
    var result = await _customerRepo.getCustomer();
    result.fold((fail) => emit(CustomerFailure()),
        (customers) => emit(CustomerSuccess(customers: customers)));
  }

  void edit({required String id}) async {
    editedCustomer.lastPurchaseDate = DateTime.now();
    editedCustomer.email = "email@sss";
    editedCustomer.debtAmount = 0;
    editedCustomer.address = "0";
    emit(CustomerLaoding());
    var result =
        await _customerRepo.editCustomer(id: id, customer: editedCustomer);
    result.fold((fail) => emit(CustomerFailure()),
        (customers) => emit(CustomerEdited()));
  }
}
