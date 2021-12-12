import 'dart:convert';

import 'package:hello/api/api.dart';
import 'package:http/http.dart';
// class Currency {
//   String? symbol;
//   double? value;

//   Currency({this.symbol, this.value});

//   Currency.fromJson({Map<String, dynamic> data}){
//     symbol = data['']
//   }
// }

class CurrencyConverter {
  String? symbol;
  double? value;

  CurrencyConverter({this.symbol, this.value});

  Future<double?> convert(
      {required String from,
      required String to,
      required double amount}) async {
    Response response = await Api().getData(from: from);

    if (response.statusCode == 200) {
      var map = jsonDecode(response.body);

      double result = map['data'][to] * amount;

      return double.parse((result).toStringAsFixed(2));
    }
  }
}
