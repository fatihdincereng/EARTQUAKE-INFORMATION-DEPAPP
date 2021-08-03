import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import '../constants/const voice.dart';
import '../constants/const_asset.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../models/app_locazition.dart';
import 'package:audioplayers/audioplayers.dart';

import '../dasbord.dart';

final Color backgroundColor = Color(0xff80B34F);

class Sound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deprem Düdüğü',
      debugShowCheckedModeBanner: false,
      supportedLocales: [
        Locale('en', 'US'),
        Locale('tr', 'TR'),
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var isStart = false;
  var audioPlayer = new AudioPlayer();

  int selectedVoiceIndex = 0;

  final imgActive = ConstAsset.whistlePng;
  final imgPassive = ConstAsset.whistleNoClickPng;

  @override
  void initState() {
    super.initState();
    isStart = audioPlayer.state == AudioPlayerState.PLAYING;
  }

  Future playLocal(localFileName) async {
    if (!isStart) {
      await audioPlayer.stop();
    } else {
      final dir = await getApplicationDocumentsDirectory();
      final file = new File("${dir.path}/$localFileName");
      if (!(await file.exists())) {
        final soundData = await rootBundle.load("assets/audios/$localFileName");
        final bytes = soundData.buffer.asUint8List();
        await file.writeAsBytes(bytes, flush: true);
      }
      await audioPlayer.setUrl(file.path, isLocal: true);
      await audioPlayer.setReleaseMode(ReleaseMode.LOOP);
      await audioPlayer.resume();
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> voiceNames = <String>[
      AppLocalizations.of(context).translate('audio_whistle'),
      AppLocalizations.of(context).translate('audio_cat'),
      AppLocalizations.of(context).translate('audio_siren'),
      AppLocalizations.of(context).translate('audio_morse')
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MenuDashboardPage()));
            }),
        backgroundColor: backgroundColor,
        title: Text(
          "Emergency Sound",
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ButtonTheme(
              padding: EdgeInsets.all(40.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)),
              child: RaisedButton(
                color: isStart ? Colors.grey : Color(0xff80B34F),
                onPressed: () => setState(() {
                  isStart = !isStart;
                  playLocal(ConstVoice.getAll[selectedVoiceIndex])
                      .then((value) => (null));
                }),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(isStart ? imgActive : imgPassive, width: 160),
                    Text(AppLocalizations.of(context).translate('sos'),
                        style: TextStyle(color: Colors.white))
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(5.0),
              child: DropdownButton<String>(
                value: voiceNames[selectedVoiceIndex],
                items: voiceNames.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: TextStyle(fontSize: 16)),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedVoiceIndex = voiceNames.indexOf(value);
                    isStart = false;
                    playLocal(ConstVoice.getAll[selectedVoiceIndex])
                        .then((value) => (null));
                  });
                },
                style: TextStyle(color: Colors.black87, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
