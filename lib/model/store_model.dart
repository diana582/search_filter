class Dress {
  final String name;
  final String imageUrl;
  final double price;

  Dress({required this.name, required this.imageUrl, required this.price});
}

List<Dress> dresses = [
  Dress(name: 'Dress 1', imageUrl: 'https://...', price: 50.0),
  Dress(name: 'Dress 2', imageUrl: 'https://...', price: 80.0),
  Dress(name: 'Dress 3', imageUrl: 'https://...', price: 120.0),
  // add more dresses
];
