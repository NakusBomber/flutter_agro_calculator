import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../components/app_bar.dart';
import '../components/drawer.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});


  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Головна"),
      drawerEnableOpenDragGesture: true,
      drawer: getDrawer(context),
      body: ListView(
      children: [
        _getCard(title: 'Норма висіву зернових'),
        _getCard(
            title: 'Норма висіву зернових',
            info: 'Вирахувати для певної культури, виходячи з якості насіння, термінів '
                'посіву, стану грунту, вимерзання, кущення та густоти стеблостою, норму висіву '
                'зернових.',
          path: '/norm_seeding_grain'
        ),
        _getCard(
            title: 'Норма внесення азотних добрив',
            info: 'Прорахування норми внесення азотних добрив того чи іншого типу,'
                ' при заданій потребі рослини у чистому азоті.'
        ),
        _getCard(title: 'Норма висіву зернових'),
        _getCard(title: 'Норма висіву зернових'),
        _getCard(
            title: 'Норма висіву зернових',
            info: 'Вирахувати для певної культури, виходячи з якості насіння, термінів '
                'посіву, стану грунту, вимерзання, кущення та густоти стеблостою, норму висіву '
                'зернових.'
        ),
      ],
      )
    );
  }


  Widget _getCard({
    String? title,
    String? info,
    String path = '/'
  }) {
    final colorsGradient = [
      const Color(0xff388d3c),
      const Color(0xFF269729),
      Theme.of(context).primaryColor
    ];

    final titleCard = title ?? '';
    final infoCard = info ?? '';

    const radius = 50.0;

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: colorsGradient
          )
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
        child: InkWell(
          onTap: () {
            context.go(path);
          },
          child: infoCard == '' ? _getSmallCard(titleCard) : _getLargeCard(titleCard, infoCard),
        )
      ),
    );
  }

  Text _getSmallCard(String title) {
    return Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold
        ),
      );
  }

  Widget _getLargeCard(String title, String info) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: _getSmallCard(title)
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Text(info, style: TextStyle(
            color: Colors.white.withOpacity(0.8),
            fontSize: 16
          ),),
        )
      ],
    );
  }
}