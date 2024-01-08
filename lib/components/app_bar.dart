import 'package:flutter/material.dart';

class AgroAppBar extends AppBar {
  AgroAppBar({
    Key? key,
    required this.context,
    this.label,
  }) : super(
    key: key,
    elevation: 4,
    foregroundColor: Colors.white,
    backgroundColor: Theme.of(context).colorScheme.primary,
    title: Text(label ?? ''),
  );

  final BuildContext context;
  final String? label;
}
