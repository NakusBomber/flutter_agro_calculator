import '../models/norm_seeding_grain.dart';

/// Допоміжний клас для математичних розрахунків в додатку
abstract class AgroMath {

  /// Розрахунок норми висіву зернових
  /// Повертає кількість насінин на 1 кв.м.
  static int normSeedingGrain(
      Cultures culture,
      QualitySeeds qualitySeeds,
      TimingOfSeeding timingOfSeeding,
      SoilCondition soilCondition,
      FreezingPercentage freezingPercentage,
      CroppingRate croppingRate,
      StemThick stemThick
      ) {

    final List<int> list = [
      culture.value,
      qualitySeeds.value,
      timingOfSeeding.value,
      soilCondition.value,
      freezingPercentage.value,
      croppingRate.value,
      stemThick.value
    ];

    return list.reduce((value, element) => value + element);
  }
}