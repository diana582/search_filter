
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SearchPage(),
    );
  }
}

class Product {
  final String id;
  final String name;
  final String imageUrl;
  final double price;

  Product({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
  });
}

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final List<Product> _products = [
    Product(
      id: '1',
      name: 'Red Dress',
      imageUrl: 'https://assets.ajio.com/medias/sys_master/root/20220915/l6KC/63230d46f997dd1f8d00dee4/avaasa_set_red_floral_print_fit_%26_flare_dress_with_shrug.jpg',
      price: 50.0,
    ),
    Product(
      id: '2',
      name: 'Blue Shirt',
      imageUrl: 'https://sslimages.shoppersstop.com/sys-master/images/h0c/h9c/26466234662942/S21182FSAGD1RB_ROYAL_BLUE_alt1.jpg_2000Wx3000H',
      price: 25.0,
    ),
    Product(
      id: '3',
      name: 'Green Skirt',
      imageUrl: 'https://i.pinimg.com/originals/f8/0f/30/f80f306d3b93b8a7309727ddf641aa3d.jpg',
      price: 35.0,
    ),
    Product(
      id: '4',
      name: 'Yellow Blouse',
      imageUrl: 'https://i.pinimg.com/originals/f8/0f/30/f80f306d3b93b8a7309727ddf641aa3d.jpg',
      price: 45.0,
    ),
    Product(
      id: '5',
      name: 'Black Jeans',
      imageUrl: 'https://lp2.hm.com/hmgoepprod?set=format%5Bwebp%5D%2Cquality%5B79%5D%2Csource%5B%2Ffa%2Fdc%2Ffadc316dd4a1408e17e3f166ac8d6c113be9fb3d.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url%5Bfile%3A%2Fproduct%2Fmain%5D',
      price: 55.0,
    ),
  ];

  List<Product> _filteredProducts = [];

  @override
  void initState() {
    super.initState();
    _filteredProducts = List.from(_products);
  }

  void _filterProducts(String query) {
    setState(() {
      _filteredProducts = _products
          .where((product) =>
              product.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Search for a product',
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade200,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                hintText: 'Search a keyword or product ID',
                prefixIcon: Icon(Icons.search),
                prefixIconColor: Colors.black,
              ),
              onChanged: (value) {
                _filterProducts(value);
              },
            ),
            SizedBox(
              height: 20,
),
Expanded(
child: ListView.builder(
itemCount: _filteredProducts.length,
itemBuilder: (context, index) {
final product = _filteredProducts[index];
return ListTile(
leading: Image.network(
product.imageUrl,
width: 50,
height: 50,
),
title: Text(product.name),
subtitle: Text('${product.price.toStringAsFixed(2)}'),
);
},
),
)
],
),
),
);
}
}