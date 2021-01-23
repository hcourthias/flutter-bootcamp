import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String currency = currenciesList.first;
  Map<String, String> exchanges = {};
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI();
  }

  void updateUI() async {
    isLoading = true;
    var data = await CoinData().convertCryptoToCurrency(currency);
    setState(() {
      exchanges = data;
    });
    isLoading = false;
  }

  Widget AndroidPicker() {
    return DropdownButton(
      value: currency,
      onChanged: (value) {
        setState(() {
          currency = value;
          updateUI();
        });
      },
      items: currenciesList
          .map((e) => DropdownMenuItem(child: Text(e), value: e))
          .toList(),
    );
  }

  Widget IOSPicker() {
    return CupertinoPicker(
      itemExtent: 32,
      onSelectedItemChanged: (selectedIndex) {
        setState(() {
          currency = currenciesList[selectedIndex];
          updateUI();
        });
      },
      children: currenciesList
          .map((e) => Text(
                e,
                style: TextStyle(color: Colors.white),
              ))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: exchanges.entries
                .map((entry) => PriceCard(
                    currency: currency, crypto: entry.key, rate: entry.value))
                .toList(),
          ),
          Container(
              height: 150.0,
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 30.0),
              color: Colors.lightBlue,
              child: Platform.isIOS ? IOSPicker() : AndroidPicker())
        ],
      ),
    );
  }
}

class PriceCard extends StatelessWidget {
  final String rate;
  final String crypto;
  final String currency;

  PriceCard({this.currency, this.crypto, this.rate});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            '1 BTC = $rate $currency',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
