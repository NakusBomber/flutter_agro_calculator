
/// Вид культури
enum Cultures {
  wheat('Пшениця', 400),
  rye('Жито', 275),
  barley('Ячмінь', 350);

  static String get info => 'Культура:';

  const Cultures(this.label, this.value);
  final String label;
  final int value;
}

/// Якість насіння
enum QualitySeeds {
  normaBig('Вище норми', -30),
  norma('Як норма', 0),
  normaSmall('Нижче норми', 30);

  static String get info => 'Маса 1000 насінин:';

  const QualitySeeds(this.label, this.value);
  final String label;
  final int value;
}

/// Терміни посіву
enum TimingOfSeeding {
  late('Пізні', 20),
  norma('Нормальні', 0),
  early('Ранні', -20);

  static String get info => 'Терміни посіву:';

  const TimingOfSeeding(this.label, this.value);
  final String label;
  final int value;
}

/// Стан грунту під посів
enum SoilCondition {
  excellent('Відмінний', 0),
  good('Добрий', 10),
  bad('Поганий', 20);

  static String get info => 'Стан грунту:';
  const SoilCondition(this.label, this.value);
  final String label;
  final int value;
}

/// Відсоток вимерзання
enum FreezingPercentage {
  large('Більше 15%', 30),
  medium('10-15%', 0),
  small('Менше 10%', -20);


  static String get info => 'Відсоток вимерзання:';
  const FreezingPercentage(this.label, this.value);
  final String label;
  final int value;
}

/// Норма кущення
enum CroppingRate {
  large('Більше 1.6', -20),
  medium('1.4-1.6', 0),
  small('Менше 1.4', 20);

  static String get info => 'Норма кущення:';
  const CroppingRate(this.label, this.value);
  final String label;
  final int value;
}

/// Густота стеблостою
enum StemThick {
  large('Більше 500', 20),
  medium('400-500', 0),
  small('Менше 400', -20);

  static String get info => 'Густота стеблостою:';
  const StemThick(this.label, this.value);
  final String label;
  final int value;
}