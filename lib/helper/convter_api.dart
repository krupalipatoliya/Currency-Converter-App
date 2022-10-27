import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/converter.dart';

class CurrencyConverterHelper {
  CurrencyConverterHelper._();

  static final CurrencyConverterHelper currencyConverterHelper =
      CurrencyConverterHelper._();

  Future<Converter?> convertCurrency(
      {required String want,
      required String have,
      required double amount}) async {
    http.Response response = await http.get(
        Uri.parse(
            "https://api.api-ninjas.com/v1/convertcurrency?want=$want&have=$have&amount=$amount"),
        headers: {
          "X-API-Key": "BbdjFu7k58JCQtGl8UBO3Q==VcC9boICj9ebGcH0",
        });

    if (response.statusCode == 200) {
      Map decodedData = jsonDecode(response.body);

      double rawData = decodedData["new_amount"];

      Converter data = Converter.fromMap(e: rawData);

      return data;
    }
    return null;
  }
}
