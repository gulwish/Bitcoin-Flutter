import 'package:bitcoin_ticker/network_helper.dart';
import 'package:bitcoin_ticker/price_screen.dart';

const KapiKey = 'b3840714-e761-4130-a6ef-e8c199b9119d';

const String exchnageRateURL =
    'https://api-realtime.exrates.coinapi.io/v1/exchangerate/BTC/';
//'https://api-realtime.exrates.coinapi.io/v1/exchangerate/BTC/EUR?apiKey=b3840714-e761-4130-a6ef-e8c199b9119d';

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
  'ZAR',
];

const List<String> cryptoList = ['BTC', 'ETH', 'LTC'];

class CoinData {
  Future<double> getRate4_BTC(String selectedCurrency) async {
    if (currenciesList.contains(selectedCurrency) == true) {
      NetworkHelper networkHelper = NetworkHelper(
        '$exchnageRateURL$selectedCurrency?&apiKey=$KapiKey',
      );

      var decodedData = await networkHelper.getResponse();
      return decodedData['rate'];
    }
    return 0;
  } //end if
} //end method
