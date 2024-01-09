import 'package:agro_calculator/components/app_bar.dart';
import 'package:agro_calculator/components/drawer.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';


class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {

  final _tgNickname = 'i_nakus';
  final _infoAbout =
  '''
AgroCalculator - це результат моєї студентської творчості та 
відданості сучасній аграрній галузі.
Розробивши цей додаток, я прагнув надати фермерам та 
сільськогосподарським підприємцям простий, 
але потужний інструмент для оптимізації їхньої діяльності.
Розробив: Трегуб Ігор 943
  '''.replaceAll('\n', ' ');

  void _launchTgUrl() async {
    final Uri url = Uri(
      scheme: 'https',
      host: 't.me',
      path: '/$_tgNickname',
    );
    if(!await launchUrl(url)) {
      throw Exception('Error with open url: $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AgroAppBar(context: context, label: 'Інформація',),
      drawer: getDrawer(context),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          children: [
            textAbout,
            const SizedBox(height: 20,),
            telegramButton,
            const Spacer(),
            version
          ],
        ),
      ),
    );
  }

  Text get textAbout => Text(_infoAbout, style: const TextStyle(fontSize: 18), textAlign: TextAlign.justify,);

  OutlinedButton get telegramButton {
    return OutlinedButton.icon(
        onPressed: _launchTgUrl,
        style: ButtonStyle(
          side: MaterialStatePropertyAll<BorderSide>(BorderSide(color: Theme.of(context).primaryColor)),
          textStyle: const MaterialStatePropertyAll<TextStyle>(TextStyle(fontSize: 18)),
          iconSize: const MaterialStatePropertyAll<double>(26)
        ),
        icon: const Icon(Icons.telegram_rounded),
        label: Text('@$_tgNickname'),
      );
  }

  FutureBuilder<PackageInfo> get version {
    return FutureBuilder(
        future: PackageInfo.fromPlatform(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          String text;
          if (snapshot.connectionState == ConnectionState.waiting) {
            text = '...';
          }
          if (snapshot.hasError) {
            text = 'Помилка!';
          }
          if (snapshot.data == null) {
            text = 'Нема доступу!';
          }
          else {
            text = 'v${snapshot.data!.version}';
          }
          return Text(text);
        },
      );
  }
}
