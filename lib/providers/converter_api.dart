import 'package:currency_convter/models/converter.dart';
import 'package:flutter/cupertino.dart';
import '../helper/convter_api.dart';

class ConverterProvider extends ChangeNotifier {
  Converter? data = Converter(amount: 0);

  void convertCurrencies(
      {required String want,
      required String have,
      required double amount}) async {
    data = await CurrencyConverterHelper.currencyConverterHelper
        .convertCurrency(want: want, have: have, amount: amount);

    print(data?.amount.toString());


    notifyListeners();
  }
}
