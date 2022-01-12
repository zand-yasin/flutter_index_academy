import 'dart:convert';

class Album2 {
  Album2({
    required this.rates,
  });

  Map<String, double> rates;
  factory Album2.fromJson(Map<String, dynamic> json) =>
      Album2(rates: Map.from(json["rates"]));
}
