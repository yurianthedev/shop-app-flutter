import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';

import '../colors/ships_officer.dart';

import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Rebuild only the return, not the entire method
    // It can combine both mehtods, for example for set listen false to some methods
    final product = Provider.of<Product>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
                arguments: product.id);
          },
          child: Stack(children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                shipsOfficer.withOpacity(0.2),
                shipsOfficer.withOpacity(0.8)
              ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
            )
          ]),
        ),
        header: GridTileBar(
          title: Text(
            product.title,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
          ),
        ),
        footer: Consumer<Product>(
          builder: (ctx, product, child) => GridTileBar(
            leading: IconButton(
              icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: Colors.red,
              ),
              onPressed: () {
                product.toggleFavoriteValue();
              },
            ),
            title: Text(''),
            trailing: IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.green,
              ),
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }
}