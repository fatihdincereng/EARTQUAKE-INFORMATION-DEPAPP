import 'package:deprem_projesi/widget/alertwidget.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

String messageTitle;
String notificationAlert;

class PushNoti extends StatefulWidget {
  PushNoti({Key key}) : super(key: key);

  @override
  _PushNotiState createState() => _PushNotiState();
}

class _PushNotiState extends State<PushNoti> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("naber"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AlertDialog(
              title: const Text('EARTQUAKE ALERT'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text(messageTitle),
                    Text(notificationAlert),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('güvendeyim'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('güvende değilim'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
