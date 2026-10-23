import 'package:flutter/foundation.dart';

class Station {
  String id;
  String name;
  String pin;
  bool open;
  int liters;
  int perCar;
  String start;

  Station({
    required this.id,
    required this.name,
    required this.pin,
    this.open = false,
    this.liters = 0,
    this.perCar = 20,
    this.start = '08:00',
  });
}

class Car {
  String id; // رقم اللوحة
  String owner;
  String phone;
  String brand;
  String year;
  String color;
  String fuel;
  String vin;
  String book;
  String status; // pending, approved, rejected
  String reason;

  Car({
    required this.id,
    required this.owner,
    required this.phone,
    required this.brand,
    required this.year,
    required this.color,
    required this.fuel,
    required this.vin,
    required this.book,
    this.status = 'pending',
    this.reason = '',
  });
}

class Registration {
  String id;
  String plate;
  String stationId;
  int group;
  bool done;
  int at;

  Registration({
    required this.id,
    required this.plate,
    required this.stationId,
    required this.group,
    this.done = false,
    required this.at,
  });
}

class DatabaseService extends ChangeNotifier {
  static final DatabaseService _instance = DatabaseService._internal();
  factory DatabaseService() => _instance;
  DatabaseService._internal() {
    _initData();
  }

  int depotStock = 120000;
  String announcement = "📢 تفتح المحطات اليوم على تمام الساعة 8 صباحاً";
  
  List<Station> stations = [];
  List<Car> cars = [];
  List<Registration> regs = [];

  void _initData() {
    stations = [
      Station(id: 's1', name: 'محطة الشاطئ - سبها', pin: '1111', open: true, liters: 25000, perCar: 30, start: '08:00'),
      Station(id: 's2', name: 'محطة المطار - سبها', pin: '2222', open: true, liters: 18000, perCar: 20, start: '08:30'),
      Station(id: 's3', name: 'محطة القرضة', pin: '3333', open: false, liters: 10000, perCar: 25, start: '09:00'),
    ];

    cars = [
      Car(
        id: '5-12345',
        owner: 'يوسف المصري',
        phone: '0910000000',
        brand: 'تويوتا كامري',
        year: '2020',
        color: 'أبيض',
        fuel: 'بنزين',
        vin: 'CH123456789012345',
        book: 'BK-9981',
        status: 'approved',
      )
    ];

    regs = [
      Registration(
        id: '5-12345',
        plate: '5-12345',
        stationId: 's1',
        group: 1,
        done: false,
        at: DateTime.now().millisecondsSinceEpoch,
      )
    ];
  }

  void addRegistration(String plate, String stationId) {
    int count = regs.where((r) => r.stationId == stationId).length;
    int group = (count ~/ 200) + 1;
    regs.add(Registration(
      id: plate,
      plate: plate,
      stationId: stationId,
      group: group,
      at: DateTime.now().millisecondsSinceEpoch,
    ));
    notifyListeners();
  }

  void markDone(String plate, String stationId) {
    var reg = regs.firstWhere((r) => r.plate == plate && r.stationId == stationId);
    reg.done = true;
    notifyListeners();
  }

  void toggleStation(String id, bool open) {
    var s = stations.firstWhere((element) => element.id == id);
    s.open = open;
    notifyListeners();
  }
}
