import 'package:agro_calculator/database/interface_database.dart';
import 'package:agro_calculator/database/shared_preferences_helper.dart';
import 'package:agro_calculator/models/key_preferences.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  Future<void> _setNoStartLaunch() async {
    final IDataBase db = DataBasePrefs();
    await db.init();
    await db.set(KeyStore.isFirstLaunch.key, false);
  }

  Widget _getButton(BuildContext context) {

    return FilledButton(
      onPressed: () async {
        await _setNoStartLaunch();
        if(!context.mounted) {
          return;
        }
        context.go('/');
      },
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 6),
              child: Text(
                'Спробувати',
                style: TextStyle(fontSize: 18),
              ),
            ),
            Icon(Icons.navigate_next,)
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(),
            ),
            // Wheat + Welcome text
            _getImage(),
            _getTextWelcome(context),

            _getTextAbout(context),

            Expanded(
              child: Container(),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: _getButton(context),
            ),
          ],
        ),
      ),
    );
  }

  Padding _getImage() {
    return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/wheat.png',
              width: 130,
            ),
          );
  }

  Padding _getTextWelcome(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Text(
              'Вітаємо Вас!',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          );
  }

  Text _getTextAbout(BuildContext context) {
    return Text(
            'Наш застосунок - це зручний та функціональний калькулятор для агронома. '
                'Головною особливістю цього додатку є повна безкоштовність, можна опробувати прямо зараз!',
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          );
  }


}
