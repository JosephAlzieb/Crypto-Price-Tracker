import 'package:crypto_price_tracker/widgets.dart';
import 'package:flutter/material.dart';

class CoinCard extends StatelessWidget {
  String name;
  String symbol;
  String imageUrl;
  double price;
  double changePrecentage;

  CoinCard({
    @required this.name,
    @required this.symbol,
    @required this.imageUrl,
    @required this.price,
    @required this.changePrecentage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            getBoxShadow(Colors.grey[600], const Offset(4, 4)),
            getBoxShadow(Colors.white, const Offset(-4, -4)),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: 65,
                  width: 65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      getBoxShadow(Colors.grey[500], const Offset(4, 4)),
                      getBoxShadow(Colors.white, const Offset(-4, -4)),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(imageUrl),
                  )),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                Text(
                  symbol,
                  style: TextStyle(color: Colors.grey[900], fontSize: 20),
                )
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      price.toDouble().toString(),
                      style: TextStyle(
                          color: Colors.grey[900],
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                    Text(
                      changePrecentage.toDouble() > 0 ?
                      "+" + changePrecentage.toDouble().toString() + "%":
                      "-" + changePrecentage.toDouble().toString() + "%",
                      style: TextStyle(
                        color: changePrecentage.toDouble() > 0 ? Colors.green:Colors.red,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
