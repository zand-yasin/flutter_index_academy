class Currency {
  final double? usd;
  final double? iqd;

  Currency({
    this.iqd,
    this.usd,
  });

  factory Currency.fromMap(json) {
    final rates = json['rates'];

    return Currency(
      iqd: rates['IQD'],
      usd: rates['USD'],
    );
  }
}
