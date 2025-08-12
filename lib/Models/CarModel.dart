List<String> tabs = [
  "الكل",
  "2024",
  "2019",
  "2007",
  "2025",
  "2022",
  "2020",
  "2015",
  "2021"
];

class Car {
  final String id;
  final String image;
  final String name;
  final String code;
  final String model;
  final String year ; // Default year, can be modified if needed
  final String type; // Manual or Automatic
  final int seats;
  final String pricePerKm;

  Car({
    required this.id,
    required this.image,
    required this.name,
    required this.code,
    required this.model,
    required this.year,
    required this.type,
    required this.seats,
    required this.pricePerKm,
  });
}

final List<Car> cars = [
  Car(
    id: '1',
    image: 'assets/img/car.png',
    name: 'Toyota-Haise',
    code: 'HIS-8618',
    model: 'NewShape',
    year: "2024",
    type: 'Manual',
    seats: 13,
    pricePerKm: 'للكيلومتر EGP',
  ),
  Car(
    id: '2',
    image: 'assets/img/car.png',
    name: 'Toyota-Haise - HIS-8618',
    code: 'LC-2024',
    model: 'OldShape',
    year: "2024",
    type: 'Automatic',
    seats: 7,
    pricePerKm: 'للكيلومتر EGP',
  ),
  Car(
    id: '3',
    image: 'assets/img/car.png',
    name: 'Toyota-Haise - HIS-519',
    code: 'LC-2024',
    model: 'OldShape',
    year: "2007",
    type: 'Automatic',
    seats: 7,
    pricePerKm: 'للكيلومتر EGP',
  ),
  Car(
    id: '4',
    image: 'assets/img/car.png',
    name: 'FIAT-TIPO - Limo-6291',
    code: 'LC-2024',
    model: 'NewShape',
    year: "2004",
    type: 'Automatic',
    seats: 7,
    pricePerKm: 'للكيلومتر EGP',
  ),
  Car(
    id: '5',
    image: 'assets/img/car.png',
    name: 'Mercedes-MCV500 - BUS-814',
    code: 'LC-2024',
    model: 'OldShape',
    year: "2025",
    type: 'Automatic',
    seats: 50,
    pricePerKm: 'للكيلومتر EGP',
  ),
  Car(
    id: '6',
    image: 'assets/img/car.png',
    name: 'Toyota-Land Cruiser',
    code: 'LC-2024',
    model: 'NewShape',
    year: "2022",
    type: 'Automatic',
    seats: 7,
    pricePerKm: 'للكيلومتر EGP',
  ),
  Car(
    id: '7',
    image: 'assets/img/car.png',
    name: 'Toyota-Land Cruiser',
    code: 'LC-2024',
    model: 'OldShape',
    year: "2020",
    type: 'Automatic',
    seats: 7,
    pricePerKm: 'للكيلومتر EGP',
  ),
  Car(
    id: '8',
    image: 'assets/img/car.png',
    name: 'Toyota-Land Cruiser',
    code: 'LC-2024',
    model: 'NewShape',
    year: "2015",
    type: 'Automatic',
    seats: 7,
    pricePerKm: 'للكيلومتر EGP',
  ),
    Car(
    id: '8',
    image: 'assets/img/car.png',
    name: 'Toyota-Land Cruiser',
    code: 'LC-2024',
    model: 'NewShape',
    year: "2019",
    type: 'Automatic',
    seats: 7,
    pricePerKm: 'للكيلومتر EGP',
  ),

];
class Booking {
  final Car car;
  final String tripType;
  final DateTime goDate;
  final DateTime? returnDate;
  final bool fullPayment;

  Booking({
    required this.car,
    required this.tripType,
    required this.goDate,
    this.returnDate,
    required this.fullPayment,
  });
}
