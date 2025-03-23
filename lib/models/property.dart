class Property {
  final String id;
  final String address;
  final String imageUrl;
  final double latitude;
  final double longitude;
  final bool isForSale;
  final bool isForRent;
  final double price;

  Property({
    required this.id,
    required this.address,
    required this.imageUrl,
    required this.latitude,
    required this.longitude,
    required this.isForSale,
    required this.isForRent,
    required this.price,
  });

  // Mock data for sample properties
  static List<Property> getSampleProperties() {
    return [
      Property(
        id: '1',
        address: 'Gladkova St., 25',
        imageUrl: 'assets/images/property1.jpg',
        latitude: 59.939,
        longitude: 30.315,
        isForSale: true,
        isForRent: false,
        price: 250000,
      ),
      Property(
        id: '2',
        address: 'Trefoleva St., 43',
        imageUrl: 'assets/images/property2.jpg',
        latitude: 59.932,
        longitude: 30.345,
        isForSale: true,
        isForRent: true,
        price: 320000,
      ),
      Property(
        id: '3',
        address: 'Nevsky Ave., 67',
        imageUrl: 'assets/images/property3.jpeg',
        latitude: 59.925,
        longitude: 30.305,
        isForSale: false,
        isForRent: true,
        price: 120000,
      ),
      Property(
        id: '4',
        address: 'Sedova St., 22',
        imageUrl: 'assets/images/property4.jpg',
        latitude: 59.918,
        longitude: 30.295,
        isForSale: true,
        isForRent: false,
        price: 185000,
      ),
    ];
  }
}
