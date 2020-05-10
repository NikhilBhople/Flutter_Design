class Hotel {
  String imageUrl;
  String name;
  String address;
  int price;

  Hotel({
    this.imageUrl,
    this.name,
    this.address,
    this.price,
  });
}

final List<Hotel> hotels = [
  Hotel(
    imageUrl: 'assets/images/hotel1.jpg',
    name: 'Hotel Address Boutique',
    address: '404 Great St',
    price: 300,
  ),
  Hotel(
    imageUrl: 'assets/images/hotel2.jpg',
    name: 'InterContenal Resort',
    address: '404 Great St',
    price: 240,
  ),
  Hotel(
    imageUrl: 'assets/images/hotel0.jpg',
    name: 'Grand hotel',
    address: '404 Great St',
    price: 175,
  ),
];
