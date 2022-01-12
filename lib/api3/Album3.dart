import 'dart:convert';

class Album3 {
  Album3({
    required this.rates,
  });

  Map<String, double> rates;
  factory Album3.fromJson(Map<String, dynamic> json) =>
      Album3(rates: Map.from(json["rates"]));
}
