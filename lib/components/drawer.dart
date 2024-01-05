import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Drawer getDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 4),
                child: Image.asset('assets/images/wheat.png', width: 40,),
              ),
              const Text(
                'AgroCalculator',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
        ),
        ListTile(
          leading: const Icon(Icons.home_rounded),
          title: const Text('Головна'),
          onTap: () {
            Navigator.pop(context);
            context.go('/');
          },
        ),
        ListTile(
          leading: const Icon(Icons.history_rounded),
          title: const Text('Історія'),
          onTap: () {
            Navigator.pop(context);
            context.go('/history');
          },
        ),
        ListTile(
          leading: const Icon(Icons.info_rounded),
          title: const Text('Інформація'),
          onTap: () {
            Navigator.pop(context);
            context.go('/info');
          },
        ),
      ],
    ),
  );
}