import 'package:el7kma/Core/Utlis/Constatnts.dart';
import 'package:el7kma/Core/Utlis/DialogMethods.dart';
import 'package:el7kma/Core/widgets/CustomTextField.dart';
import 'package:el7kma/Features/SuppliersView/Presentaion/manager/suppliers_cubit/suppliers_cubit.dart';
import 'package:el7kma/Features/SuppliersView/data/models/suppliers_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SupplierCard extends StatefulWidget {
  const SupplierCard({super.key, required this.supplier});
  final SuppliersModel supplier;
  @override
  State<SupplierCard> createState() => _SupplierCardState();
}

class _SupplierCardState extends State<SupplierCard> {
  bool isEdit = false;
  bool secure = true;
  late SuppliersCubit cubit;
  @override
  void initState() {
    cubit = BlocProvider.of<SuppliersCubit>(context);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          Expanded(
              child: CustomTextField(
            initialValue: widget.supplier.supplierName,
            enabled: isEdit,
            maxLines: 1,
            onChanged: (value) {
              cubit.editedSupplier.supplierName = value.trim();
            },
          )),
          Expanded(
              child: CustomTextField(
                  initialValue: widget.supplier.contactInfo,
                  enabled: isEdit,
                  onChanged: (value) {
                    cubit.editedSupplier.contactInfo = value.trim();
                  })),
          Expanded(
              child: CustomTextField(
            initialValue: widget.supplier.totalAmount.toString(),
            enabled: false,
            isEGP: true,
          )),
          Expanded(
              child: CustomTextField(
            initialValue: widget.supplier.paid.toString(),
            isEGP: true,
            enabled: false,
          )),
          Expanded(
              child: CustomTextField(
            initialValue: widget.supplier.rest.toString(),
            enabled: false,
            isEGP: true,
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
        cubit.editedSupplier = widget.supplier;
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
        cubit.edit();
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
        Dialogmethods.deleteSupplier(context, widget.supplier.supplierId ?? "");
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
        Dialogmethods.showSupplierBills(context,
            supplierName: widget.supplier.supplierName ?? "");
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
