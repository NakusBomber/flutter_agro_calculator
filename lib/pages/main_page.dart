import 'package:flutter/material.dart';

import '../components/app_bar.dart';
import '../components/drawer.dart';
import '../components/card_calculator.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AgroAppBar(context: context, label: 'Головна',),
        drawer: getDrawer(context),
        body: ListView(
          children: [
            CardCalculator(context: context, title: 'Норма висіву зернових'),
            CardCalculator(
                context: context,
                title: 'Норма висіву зернових',
                info:
                    'Вирахувати для певної культури, виходячи з якості насіння, термінів '
                    'посіву, стану грунту, вимерзання, кущення та густоти стеблостою, норму висіву '
                    'зернових.',
                path: '/norm_seeding_grain'),
            CardCalculator(
                context: context,
                title: 'Норма внесення азотних добрив',
                info:
                    'Прорахування норми внесення азотних добрив того чи іншого типу,'
                    ' при заданій потребі рослини у чистому азоті.'),
            CardCalculator(context: context, title: 'Норма висіву зернових'),
            CardCalculator(context: context, title: 'Норма висіву зернових'),
            CardCalculator(
                context: context,
                title: 'Норма висіву зернових',
                info:
                    'Вирахувати для певної культури, виходячи з якості насіння, термінів '
                    'посіву, стану грунту, вимерзання, кущення та густоти стеблостою, норму висіву '
                    'зернових.'),
          ],
        ));
  }
}
