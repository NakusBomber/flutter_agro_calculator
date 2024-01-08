import 'package:flutter/material.dart';

class MyDropdownMenu<T> extends DropdownMenu {
  MyDropdownMenu({
    Key? key,
    required List<T> list,
    dynamic initialSelection,
    String hintText = 'Оберіть...',
    String? errorText,
    bool enableSearch = false,
    void Function(dynamic)? onSelected
  }) : super(
      key: key,
      dropdownMenuEntries: list
          .map((dynamic entity) => DropdownMenuEntry<T>(
          value: entity as T, label: (entity as dynamic).label as String))
          .toList(),
      hintText: hintText,
      initialSelection: initialSelection,
      errorText: errorText,
      enableSearch: enableSearch,
      onSelected: onSelected
  );

}