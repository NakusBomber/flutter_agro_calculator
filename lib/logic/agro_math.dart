import '../models/norm_seeding_grain.dart';

/// Допоміжний клас для математичних розрахунків в додатку
abstract class AgroMath {

  /// Розрахунок норми висіву зернових
  /// Повертає кількість насінин на 1 кв.м.
  static int normSeedingGrain(
      int culture,
      int qualitySeeds,
      int timingOfSeeding,
      int soilCondition,
      int freezingPercentage,
      int croppingRate,
      int stemThick
      ) {

    final List<int> list = [
      culture,
      qualitySeeds,
      timingOfSeeding,
      soilCondition,
      freezingPercentage,
      croppingRate,
      stemThick
    ];

    return list.reduce((value, element) => value + element);
  }
}