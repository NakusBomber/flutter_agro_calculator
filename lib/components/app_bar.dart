import 'package:flutter/material.dart';


AppBar getAppBar(BuildContext context, String title) {
  return AppBar(
    elevation: 4,
    foregroundColor: Colors.white,
    backgroundColor: Theme.of(context).colorScheme.primary,
    title: Text(title),
  );
}