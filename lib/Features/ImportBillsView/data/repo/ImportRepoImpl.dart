import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:el7kma/Core/Errors/Failurs.dart';
import 'package:el7kma/Core/Utlis/ApiServices.dart';
import 'package:el7kma/Features/ImportBillsView/data/models/ImportBillsModel.dart';
import 'package:el7kma/Features/ImportBillsView/data/models/ImportItemModel.dart';
import 'package:el7kma/Features/ImportBillsView/data/repo/ImportRepo.dart';

class ImportRepoImpl implements ImportRepo {
  final ElhekmaServices _elhekmaServices;

  ImportRepoImpl(this._elhekmaServices);
  @override
  Future<Either<Failure, List<ImportBillsModel>>> getBills(
      {String? supplierName, String? billNo, String? date}) async {
    try {
      List<ImportBillsModel> bills = [
        ImportBillsModel(
          supplierName: "mohamed",
          billNo: "100",
          date: "21/8/2024",
          totalAmount: "130",
          items: [
            ImportItemModel(
                code: "25025",
                product: "اقلام",
                price: "60",
                qty: "2",
                totalprice: "120",
                package: true,
                packageQty: "5"),
            ImportItemModel(
                code: "22225",
                product: "ورق",
                price: ".5",
                qty: "20",
                totalprice: "10",
                package: true,
                packageQty: "500"),
          ],
        ),
        ImportBillsModel(
          supplierName: "ahmed",
          billNo: "101",
          date: "22/8/2024",
          totalAmount: "250",
          items: [
            ImportItemModel(
              code: "25026",
              product: "مفارش",
              price: "70",
              qty: "3",
              totalprice: "210",
              package: false,
            ),
            ImportItemModel(
                code: "22226",
                product: "أقلام رصاص",
                price: "1",
                qty: "30",
                totalprice: "30",
                package: true,
                packageQty: "5"),
          ],
        ),
        ImportBillsModel(
          supplierName: "ali",
          billNo: "102",
          date: "23/8/2024",
          totalAmount: "170",
          items: [
            ImportItemModel(
              code: "25027",
              product: "كتب",
              price: "80",
              qty: "4",
              totalprice: "320",
              package: false,
            ),
            ImportItemModel(
              code: "22227",
              product: "أوراق ملاحظات",
              price: "2",
              qty: "40",
              totalprice: "80",
              package: false,
            ),
          ],
        ),
      ];
      return right(bills);
    } catch (e) {
      if (e is DioException) {
        return left(
            ServerFailure.fromResponse(e.response?.statusCode, e.response));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
