import 'package:agro_calculator/components/app_bar.dart';
import 'package:agro_calculator/components/dropdown_menu_row.dart';
import 'package:agro_calculator/logic/agro_math.dart';
import 'package:flutter/material.dart';

import '../../models/norm_seeding_grain.dart';

class NormSeedingGrainPage extends StatefulWidget {
  const NormSeedingGrainPage({super.key});

  @override
  State<NormSeedingGrainPage> createState() => _NormSeedingGrainPageState();
}

class _NormSeedingGrainPageState extends State<NormSeedingGrainPage> {

  final _scrollController = ScrollController();

  Cultures? culture;
  QualitySeeds? quality;
  TimingOfSeeding? timing;
  SoilCondition? soil;
  FreezingPercentage? freezing;
  CroppingRate? cropping;
  StemThick? stem;

  int? result;

  void _clickButton() {
    setState(() {
      if (culture == null || quality == null || timing == null || soil == null) {
        return;
      }
      if (freezing == null || cropping == null || stem == null) {
        return;
      }

      result = AgroMath.normSeedingGrain(
          culture!.value,
          quality!.value,
          timing!.value,
          soil!.value,
          freezing!.value,
          cropping!.value,
          stem!.value);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AgroAppBar(context: context, label: 'Норма висіву зернових'),
        body: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverList(delegate: SliverChildListDelegate([
              Container(
                margin: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    DropdownMenuRow<Cultures>(
                        label: Cultures.info,
                        list: Cultures.values,
                        value: culture,
                        onSelected: (value) {
                          setState(() {
                            culture = value;
                          });
                        }
                    ),
                    DropdownMenuRow<QualitySeeds>(
                        label: QualitySeeds.info,
                        list: QualitySeeds.values,
                        value: quality,
                        onSelected: (value) {
                          setState(() {
                            quality = value;
                          });
                        }
                    ),
                    DropdownMenuRow<TimingOfSeeding>(
                        label: TimingOfSeeding.info,
                        list: TimingOfSeeding.values,
                        value: timing,
                        onSelected: (value) {
                          setState(() {
                            timing = value;
                          });
                        }),
                    DropdownMenuRow<SoilCondition>(
                        label: SoilCondition.info,
                        list: SoilCondition.values,
                        value: soil,
                        onSelected: (value) {
                          setState(() {
                            soil = value;
                          });
                        }),
                    DropdownMenuRow<FreezingPercentage>(
                        label: FreezingPercentage.info,
                        list: FreezingPercentage.values,
                        value: freezing,
                        onSelected: (value) {
                          setState(() {
                            freezing = value;
                          });
                        }),
                    DropdownMenuRow<CroppingRate>(
                        label: CroppingRate.info,
                        list: CroppingRate.values,
                        value: cropping,
                        onSelected: (value) {
                          setState(() {
                            cropping = value;
                          });
                        }),
                    DropdownMenuRow<StemThick>(
                        label: StemThick.info,
                        list: StemThick.values,
                        value: stem,
                        onSelected: (value) {
                          setState(() {
                            stem = value;
                          });
                        }),
                  ],
                ),
              )
            ])),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  result == null
                      ? Container()
                      : Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text('$result насінин на 1 кв.м.', style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                                          ),),
                      ),
                  FilledButton(
                      onPressed: _clickButton,
                      child: const Text('Порахувати', style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                      ),)
                  ),
                ],
              ),
            )
          ],
        ));
  }



}


