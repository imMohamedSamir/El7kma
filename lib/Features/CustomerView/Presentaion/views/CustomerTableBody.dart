import 'package:el7kma/Features/CustomerView/Presentaion/manager/customer_cubit/customer_cubit.dart';
import 'package:el7kma/Features/CustomerView/Presentaion/views/CustomerCard.dart';
import 'package:el7kma/Features/EmployeesView/Presentaion/views/EmployeeLoading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerTableBody extends StatelessWidget {
  const CustomerTableBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerCubit, CustomerState>(
      builder: (context, state) {
        if (state is CustomerSuccess) {
          final customers = state.customers;
          return Column(
            children: [
              ...List.generate(
                  customers.length,
                  (index) => CustomerCard(
                        customer: customers[index],
                      ))
            ],
          );
        } else if (state is CustomerLaoding) {
          return EmployeeLoadingBuilder();
        } else {
          return SizedBox();
        }
      },
    );
  }
}
