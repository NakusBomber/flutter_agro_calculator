import 'package:agro_calculator/components/app_bar.dart';
import 'package:agro_calculator/components/drawer.dart';
import 'package:flutter/material.dart';


class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AgroAppBar(context: context, label: 'Інформація',),
      drawer: getDrawer(context),
      body: Center(
        child: Text('info (/info)'),
      ),
    );
  }
}
