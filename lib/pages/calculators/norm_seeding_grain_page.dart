import 'package:agro_calculator/components/app_bar.dart';
import 'package:flutter/material.dart';

class NormSeedingGrainPage extends StatelessWidget {
  const NormSeedingGrainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, 'Норма висіву зернових'),
      body: Container(
        margin: EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              children: [
                Flexible(child: Text('Культура:олиолимилукиомиол')),

                DropdownMenu(
                 /* menuStyle: MenuStyle(*/
                    /*shape: MaterialStateProperty.resolveWith<OutlinedBorder?>(
                            (states) => states.contains(value)
                                // TODO: Сделать обводку зеленую
                    ),*/
                         /*backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                           (Set<MaterialState> states) {
                             if (states.contains(MaterialState.focused)) {
                               return Theme.of(context).colorScheme.primary.withOpacity(0.5);
                             }
                             return null; // Use the component's default.
                           },
                         ),
                       ),*/
                    dropdownMenuEntries: <DropdownMenuEntry<int>>[
                      DropdownMenuEntry(value: 400, label: 'Пшениця'),
                      DropdownMenuEntry(value: 275, label: 'Жито'),
                      DropdownMenuEntry(value: 350, label: 'Ячмінь'),
                    ]
                )
              ],
            )
          ],
        ),
      )
    );
  }
}
