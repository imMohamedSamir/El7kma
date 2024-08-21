import 'package:el7kma/Core/Utlis/Constatnts.dart';
import 'package:el7kma/Core/Utlis/DialogMethods.dart';
import 'package:el7kma/Core/widgets/CustomTextField.dart';
import 'package:el7kma/Features/CustomerView/data/models/CustomerModel.dart';
import 'package:flutter/material.dart';

class CustomerCard extends StatefulWidget {
  const CustomerCard({super.key, required this.customer});
  final CustomerModel customer;
  @override
  State<CustomerCard> createState() => _CustomerCardState();
}

class _CustomerCardState extends State<CustomerCard> {
  bool isEdit = false;
  bool secure = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          Expanded(
              child: CustomTextField(
            enabled: isEdit,
            maxLines: 1,
            initialValue: widget.customer.customerName,
          )),
          Expanded(
              child: CustomTextField(
            enabled: isEdit,
            initialValue: widget.customer.customerPhone,
          )),
          Expanded(
              child: CustomTextField(
            enabled: isEdit,
            isEGP: true,
            initialValue: widget.customer.total,
          )),
          Expanded(
              child: CustomTextField(
            isEGP: true,
            enabled: isEdit,
            initialValue: widget.customer.paid,
          )),
          Expanded(
              child: CustomTextField(
            enabled: isEdit,
            isEGP: true,
            initialValue: widget.customer.rest,
          )),
          if (!isEdit)
            Row(
              children: [editIcon(context), viewIcon(context)],
            )
          else
            Row(
              children: [saveIcon(context), deleteIcon(context)],
            ),
          // deleteIcon(context)
        ],
      ),
    );
  }

  Widget editIcon(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isEdit = true;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: pKcolor),
        child: const Icon(
          Icons.edit,
          color: Colors.white,
          size: 18,
        ),
      ),
    );
  }

  Widget saveIcon(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isEdit = false;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: pKcolor),
        child: const Icon(
          Icons.save,
          color: Colors.white,
          size: 18,
        ),
      ),
    );
  }

  Widget deleteIcon(BuildContext context) {
    return InkWell(
      onTap: () {
        Dialogmethods.deleteCustomer(context);
      },
      child: Container(
        padding: const EdgeInsets.all(14),
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Colors.red),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 18,
        ),
      ),
    );
  }

  Widget viewIcon(BuildContext context) {
    return InkWell(
      onTap: () {
        Dialogmethods.showCustomerBills(context);
      },
      child: Container(
        padding: const EdgeInsets.all(14),
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: pKcolor),
        child: const Icon(Icons.remove_red_eye, color: Colors.white, size: 18),
      ),
    );
  }
}
