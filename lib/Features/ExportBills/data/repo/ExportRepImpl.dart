import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:el7kma/Core/Errors/Failurs.dart';
import 'package:el7kma/Core/Utlis/ApiServices.dart';
import 'package:el7kma/Features/ExportBills/data/models/ExportBillModel.dart';
import 'package:el7kma/Features/ExportBills/data/repo/ExportRepo.dart';

class ExportRepImpl implements ExportRepo {
  final ElhekmaServices _elhekmaServices;

  ExportRepImpl(this._elhekmaServices);
  @override
  Future<Either<Failure, List<ExportBillModel>>> getBills(
      {String? userName, String? billNo, String? date}) async {
    try {
      List<ExportBillModel> bills = [
        ExportBillModel(
          userName: "mohamed",
          billNo: "100",
          date: "21/8/2024",
          totalAmount: "130",
          items: [
            ExprotItemModel(
              code: "25025",
              product: "اقلام",
              price: "60",
              qty: "2",
              totalprice: "120",
            ),
            ExprotItemModel(
              code: "22225",
              product: "ورق",
              price: ".5",
              qty: "20",
              totalprice: "10",
            ),
          ],
        ),
        ExportBillModel(
          userName: "ahmed",
          billNo: "101",
          date: "22/8/2024",
          totalAmount: "250",
          items: [
            ExprotItemModel(
              code: "25026",
              product: "مفارش",
              price: "70",
              qty: "3",
              totalprice: "210",
            ),
            ExprotItemModel(
              code: "22226",
              product: "أقلام رصاص",
              price: "1",
              qty: "30",
              totalprice: "30",
            ),
          ],
        ),
        ExportBillModel(
          userName: "ali",
          billNo: "102",
          date: "23/8/2024",
          totalAmount: "170",
          items: [
            ExprotItemModel(
              code: "25027",
              product: "كتب",
              price: "80",
              qty: "4",
              totalprice: "320",
            ),
            ExprotItemModel(
              code: "22227",
              product: "أوراق ملاحظات",
              price: "2",
              qty: "40",
              totalprice: "80",
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
