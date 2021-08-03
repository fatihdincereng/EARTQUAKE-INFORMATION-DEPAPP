import 'package:deprem_projesi/screens/sound.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 8) {
      resultText =
          'SAKİN BİR ŞEKİLDE DEPREM ANINDA YAPILMASI GEREKEN KURALLARI GERÇEKLEŞTRİRİNİZ';
    } else if (resultScore <= 12) {
      resultText = 'SAKİN BİR ŞEKİLDE BULUNDUĞUNUZ KONUMU TERK ETMELİSİNİZ';
    } else if (resultScore <= 16) {
      resultText = 'LÜTFEN YETKİLİLERİ ARAMAK İÇİN BUTONA TIKLAYINIZ';
    } else {
      resultText = 'YARDIM İÇİN BİLDİRİMİNİZİ ALINMIŞTIR';
    }
    return resultText;
  }

  void customLaunch(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print("$command bulunamadı");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text(
              'ACİL SES ÇIKARMA İÇİN BUTONA TIKLAYINIZ',
            ),
            textColor: Colors.blue,
            onPressed: () {
              setState(() {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Sound()));
              });
            },
          ),
          FlatButton(
            child: Text(
              'YETKİLİLERE ULAŞMAK İÇİN TIKLAYINIZ',
            ),
            textColor: Colors.blue,
            onPressed: () {
              customLaunch("tel:155");
            },
          ),
        ],
      ),
    );
  }

  void setState(Null Function() param0) {}
}
