import 'dart:math';

import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bitcoin_ticker/coin_data.dart';

import 'dart:async';
import 'network_helper.dart';

CoinData coinData = new CoinData();

class PriceScreen extends StatefulWidget {
  PriceScreen({this.currencyRate});

  final dynamic currencyRate;
  //TODO: get entire jsonresposnedata  from coin data , use it to get asset it quote and  and rate
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = "USD";
  String rateDisplay = '0.00';

  void updateUI(double rate) {
    setState(() {
      if (rate == null) {
        rateDisplay = 'Error';
        return;
      }

      rateDisplay = rate.round().toStringAsFixed(3);
    });
  }

  List<DropdownMenuItem> dropdownItems() {
    List<DropdownMenuItem> dropDownItems = [];
    for (String currency in currenciesList) {
      dropDownItems.add(
        DropdownMenuItem(child: Text(currency), value: currency),
      );
    }
    return dropDownItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('🤑 Coin Ticker')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC =$rateDisplay',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: DropdownButton(
              value: selectedCurrency,
              items: dropdownItems(),
              onChanged: (value) {
                setState(() async {
                  selectedCurrency = value!;
                  updateUI(await coinData.getRate4_BTC(selectedCurrency));
                });
              },
            ),
          ),
        ],
      ),
    );
    //TODO: diaplay rate value in on screen..
  }
}

/*
//import 'dart:io' show Platform;
//import 'package:flutter/foundation.dart' show kIsWeb;
static bool get isMobile {
  //   if (kIsWeb) {
  //     return false;
  //   } else {
  //     return Platform.isIOS || Platform.isAndroid;
  //   }
  // }


CupertinoPicker getIOSpicker() {
    List<Text> pickerItems = [];
    for (String currency in currenciesList) {
      var newItem = Text(currency);
      pickerItems.add(Text(currency));
    }
    return CupertinoPicker(
      itemExtent: 42.0,
      onSelectedItemChanged: (onSelectedItemChanged) {
        print(onSelectedItemChanged);
      },
      children: pickerItems,
    );
  }
 */
