import 'package:crypto_price_tracker/coin_card.dart';
import 'package:crypto_price_tracker/widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: Text(
          "CRYPTOBASE",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.grey[900],
          ),
        ),
      ),
      body: ListView(
        children: [
          CoinCard(name: "Bitcoin",
              symbol: "btc",
              imageUrl: 'https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579',
              price: 41482,
              changePrecentage: 20),
        ],
      ),
    );
  }
}
