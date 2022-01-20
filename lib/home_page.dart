import 'dart:convert';

import 'package:crypto_price_tracker/coin_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'coin.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<List<Coin>> fetchCoin () async{

    final response = await http.get(Uri.parse('https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false'));

    coinList = [];
    if(response.statusCode == 200){
      List<dynamic> values = [];
      values = json.decode(response.body);
      if(values.isNotEmpty){
        for (int i = 0; i < values.length; i++){
          if(values[i] != null){
            Map<String, dynamic> map = values[i];
            coinList.add(Coin.fromJson(map));
          }
        }
        setState(() {
          coinList;
        });
      }
      return coinList;
    }
    else {
      throw Exception("faild to load coins");
    }
  }

  @override
  void initState() {
    fetchCoin();
    super.initState();
  }

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
          CoinCard(name: "Ethereum",
              symbol: "eth",
              imageUrl: 'https://assets.coingecko.com/coins/images/279/large/ethereum.png?1595348880',
              price: 3191.78,
              changePrecentage: -2.6),
          CoinCard(name: "Solana",
              symbol: "sol",
              imageUrl: 'https://assets.coingecko.com/coins/images/4128/large/solana.png?1640133422',
              price: 137.3,
              changePrecentage: -7),
          CoinCard(name: "Polkadot",
              symbol: "dot",
              imageUrl: 'https://assets.coingecko.com/coins/images/12171/large/polkadot.png?1639712644',
              price: 25.36,
              changePrecentage: 5.2),
          CoinCard(name: "Chainlink",
              symbol: "link",
              imageUrl: 'https://assets.coingecko.com/coins/images/877/large/chainlink-new-logo.png?1547034700',
              price: 23.27,
              changePrecentage: -22.39),
          CoinCard(name: "Decentraland",
              symbol: "mana",
              imageUrl: 'https://assets.coingecko.com/coins/images/878/large/decentraland-mana.png?1550108745',
              price:  2.87,
              changePrecentage: -2.9),
          CoinCard(name: "Litecoin",
              symbol: "ltc",
              imageUrl: 'https://assets.coingecko.com/coins/images/2/large/litecoin.png?1547033580',
              price:   142.81,
              changePrecentage: 0.32),

        ],
      ),
    );
  }
}
