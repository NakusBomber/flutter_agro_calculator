import 'package:flutter/material.dart';


import 'my_dropdown_menu.dart';


class DropdownMenuRow<T> extends StatelessWidget {
  final String label;
  final List<T> list;
  final T? value;
  final void Function(dynamic)? onSelected;

  const DropdownMenuRow({
    Key? key,
    required this.label,
    required this.list,
    this.value,
    this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const errorStr = 'Не обрано!';
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(child: Text(label)),
          MyDropdownMenu<T>(
            list: list,
            errorText: value == null ? errorStr : null,
            onSelected: onSelected,
          ),
        ],
      ),
    );
  }
}

