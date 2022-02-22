class WaterLevel {
  final int level;

  const WaterLevel({required this.level});

  factory WaterLevel.fromJson({required Map<String, dynamic> json}) =>
      WaterLevel(
        level: int.parse(json['feeds'][0]['field1']),
      );
}
