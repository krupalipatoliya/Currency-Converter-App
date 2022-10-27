class Converter {
  double amount;

  Converter({required this.amount});

  factory Converter.fromMap({required double e}) {
    return Converter(amount: e);
  }
}
