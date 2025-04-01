import 'package:http/http.dart' as http;
import 'dart:convert';

const KapiKey = 'b3840714-e761-4130-a6ef-e8c199b9119d';

const String url =
    'https://api-realtime.exrates.coinapi.io/v1/exchangerate/BTC/USD?apiKey=$KapiKey';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future<dynamic> getResponse() async {
    try {
      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        String data = response.body;

        return jsonDecode(data);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }
}
