import 'dart:convert';

import 'package:http/http.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const API_KEY = "YOUR_API_KEY";

class CoinData {
  CoinData();

  Future convertCryptoToCurrency(String currency) async {
    Map<String, String> exchanges = {};
    for (var i = 0; i < cryptoList.length; i++) {
      Response response = await get(
          'https://rest.coinapi.io/v1/exchangerate/${cryptoList[i]}/$currency?apikey=$API_KEY');
      if (response.statusCode == 200) {
        String data = response.body;
        double value = jsonDecode(data)['rate'];
        exchanges[cryptoList[i]] = value.toStringAsFixed(2);
      } else {
        print(response.statusCode);
      }
    }
    return exchanges;
  }
}
