import 'package:agro_calculator/components/app_bar.dart';
import 'package:agro_calculator/components/drawer.dart';
import 'package:flutter/material.dart';


class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AgroAppBar(context: context, label: 'Історія'),
        drawer: getDrawer(context),
        body: Center(
          child: Text('history page (/history)'),
        )
    );
  }
}
