import 'package:dartz/dartz.dart';
import 'package:el7kma/Core/Errors/Failurs.dart';
import 'package:el7kma/Features/CustomerView/data/models/CustomerModel.dart';
import 'package:el7kma/Features/CustomerView/data/models/add_customer_model.dart';

abstract class CustomerRepo {
  Future<Either<Failure, List<CustomerModel>>> getCustomer();
  Future<Either<Failure, dynamic>> addCustomer(
      {required AddCustomerModel custmerModel});
}
