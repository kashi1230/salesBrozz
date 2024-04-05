import 'package:flutter/material.dart';

class PriceListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search by product name or category',
                prefixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: 10, // Replace with actual product count
                itemBuilder: (BuildContext context, int index) {
                  return ProductCard(
                    productName: 'Product ${index + 1}',
                    price: '\$${(index + 1) * 10}', // Sample price calculation
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String productName;
  final String price;

  const ProductCard({
    required this.productName,
    required this.price,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(productName),
        subtitle: Text('Price: $price'),
        trailing: IconButton(
          icon: Icon(Icons.more_vert),
          onPressed: () {
            // Add functionality to show more details/options for the product
          },
        ),
      ),
    );
  }
}
