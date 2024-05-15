extension NumberExtension on num {
  double toMyDouble() => toDouble();
}

extension DoubleExtension on double {
  double toMyDouble() => toDouble();
}

extension IntExtension on int {
  double toMyDouble() => toDouble();
}

double parseToDouble(dynamic d) => (d as num).toMyDouble();
