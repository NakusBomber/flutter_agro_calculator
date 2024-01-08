import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CardCalculator extends StatelessWidget {
  final BuildContext context;
  final String? title;
  final String? info;
  final String? path;

  const CardCalculator({
    super.key,
    required this.context,
    this.title,
    this.info,
    this.path,
  });

  @override
  Widget build(BuildContext context) {
    final colorsGradient = [
      const Color(0xff388d3c),
      const Color(0xFF269729),
      Theme.of(context).primaryColor,
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
            colors: colorsGradient,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
        child: InkWell(
          onTap: () {
            if (path != null) {
              context.go(path!);
            }
          },
          child: infoCard == ''
              ? _getSmallCard(titleCard)
              : _getLargeCard(titleCard, infoCard),
        ),
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




