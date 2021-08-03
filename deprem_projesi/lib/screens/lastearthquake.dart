import 'package:flutter/material.dart';
import 'package:deprem_projesi/models/deprem.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

import '../dasbord.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int earthQuakeCount = 10;

  Future<EarthQuakeResponse> getData() async {
    final response = await http.get(
        'https://api.orhanaydogdu.com.tr/deprem/live.php?limit=$earthQuakeCount');
    return earthQuakeResponseFromJson(response.body);
  }

  @override
  void initState() {
    super.initState();
    //getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff80B34F),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MenuDashboardPage()));
            }),
        title: Text(
          'Last Earthquakes',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
          child: FutureBuilder<EarthQuakeResponse>(
        future: getData(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Loading...'),
                    SizedBox(
                      height: 50,
                    ),
                    CircularProgressIndicator(),
                  ],
                ),
              );
              break;
            default:
              if (snapshot.hasError)
                return Center(
                  child: Text('Hata: ${snapshot.error}'),
                );
              else
                return ListView.builder(
                  itemCount: snapshot.data.result.length,
                  itemBuilder: (context, index) {
                    List<EarthQuake> response = snapshot.data.result;
                    EarthQuake item = response[index];
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                      child: InkWell(
                        onTap: () => launch(
                            'https://maps.google.com/maps?q=${item.lat},${item.lng}'),
                        child: ListTile(
                          leading: Text(
                            (index + 1).toString(),
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                item.title,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              Text(
                                item.date,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ],
                          ),
                          trailing: Text(
                            '${item.mag}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                      ),
                    );
                  },
                );
          }
        },
      )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff80B34F),
        onPressed: () {
          setState(() {
            earthQuakeCount += 5;
          });
        },
        tooltip: 'Yenile',
        child: Icon(Icons.control_point_duplicate_sharp),
      ),
    );
  }
}
