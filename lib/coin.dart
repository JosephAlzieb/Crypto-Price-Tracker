import 'package:flutter/material.dart';

class Coin {
  String name;
  String symbol;
  String imageUrl;
  double price;
  double changePrecentage;

  Coin({
    @required this.name,
    @required this.symbol,
    @required this.imageUrl,
    @required this.price,
    @required this.changePrecentage,
  });

  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(
        name: json['name'],
        symbol: json['symbol'],
        imageUrl: json['image'],
        price: json['current_price'],
        changePrecentage: json['price_change_percentage_24h']);
  }

}
List<Coin> coinList = [];
