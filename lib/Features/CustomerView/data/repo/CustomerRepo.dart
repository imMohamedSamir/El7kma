import 'package:dartz/dartz.dart';
import 'package:el7kma/Core/Errors/Failurs.dart';
import 'package:el7kma/Features/CustomerView/data/models/CustomerModel.dart';

abstract class CustomerRepo {
  Future<Either<Failure, List<CustomerModel>>> getCustomer();
}
