import 'package:flutter/material.dart';

class CoinCard extends StatelessWidget {
  String name;
  String imageUrl;
  double price;
  double changePrecentage;

  CoinCard({
    @required this.name,
    @required this.imageUrl,
    @required this.price,
    @required this.changePrecentage,
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
