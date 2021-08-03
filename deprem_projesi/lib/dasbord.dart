import 'dart:ui';
import 'package:deprem_projesi/maps/map.dart';
import 'package:deprem_projesi/quiz/quizmain.dart';
import 'package:deprem_projesi/screens/deprembag.dart';
import 'package:deprem_projesi/screens/sound.dart';
import 'package:deprem_projesi/services/pushnoti.dart';
import 'package:deprem_projesi/widget/alertwidget.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'screens/lastearthquake.dart';
import 'package:flutter/material.dart';

//final Color backgroundColor = Color(0xff80B34F);

class MenuDashboardPage extends StatefulWidget {
  @override
  _MenuDashboardPageState createState() => _MenuDashboardPageState();
}

class _MenuDashboardPageState extends State<MenuDashboardPage>
    with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 300);
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _menuScaleAnimation;
  Animation<Offset> _slideAnimation;
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  void customLaunch(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print("$command bulunamadı");
    }
  }

  launchWhatsapp() async {
    const url = "https://wa.me/+905445586763";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'ulaşılamadı $url';
    }
  }

  @override
  void initState() {
    super.initState();

    _firebaseMessaging.configure(
      onMessage: (message) async {
        print("geldi");
        setState(
          () {
            PlatformDuyarliAlertDialog(
                    baslik: message["notification"]["title"],
                    icerik: message["notification"]["body"],
                    anaButonYazisi: "Okey")
                .goster(context);
          },
        );
      },
      onResume: (message) async {
        print("geldi");
        setState(() {
          messageTitle = message["data"]["title"];
          notificationAlert = "Application opened from Notification";
        });
      },
    );
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    _menuScaleAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Scaffold(
      //  backgroundColor: backgroundColor,
      body: Stack(
        children: <Widget>[
          menu(context),
          dashboard(context),
        ],
      ),
    );
  }

  Widget menu(context) {
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _menuScaleAnimation,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    customLaunch("mailto:deppAPP@gmail.com");
                  },
                  child: Row(
                    children: [
                      Image.asset("assets/icons/mail.png"),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Mail",
                          style: TextStyle(
                              color: Color(0xffBCD676), fontSize: 22)),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    customLaunch("tel:05445586763");
                  },
                  child: Row(
                    children: [
                      Image.asset("assets/icons/call.png"),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Call",
                          style: TextStyle(
                              color: Color(0xffBCD676), fontSize: 22)),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    launchWhatsapp();
                  },
                  child: Row(
                    children: [
                      Image.asset("assets/icons/whatsapp.png"),
                      SizedBox(
                        width: 20,
                      ),
                      Text("WhatsApp",
                          style: TextStyle(
                              color: Color(0xffBCD676), fontSize: 22)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dashboard(context) {
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: isCollapsed ? 0 : 0.6 * screenWidth,
      right: isCollapsed ? 0 : -0.2 * screenWidth,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          animationDuration: duration,
          borderRadius: BorderRadius.all(Radius.circular(40)),
          elevation: 8,
          //color: backgroundColor,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: ClampingScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 22.0,
                          child: Image.asset(
                            "assets/icons/av.png",
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            if (isCollapsed)
                              _controller.forward();
                            else
                              _controller.reverse();

                            isCollapsed = !isCollapsed;
                          });
                        },
                      ),
                      Padding(padding: EdgeInsets.only(left: 75)),
                      Container(
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black54, width: 4),
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            new BoxShadow(
                              color: Color(0xffBCD676),
                              offset: new Offset(6.0, 6.0),
                            ),
                          ],
                        ),
                        child: Text("DEPP APP",
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontSize: 24, color: Colors.white)),
                      ),
                    ],
                  ),
                  // SizedBox(height: 1),
                  Container(
                    height: 275,
                    child: PageView(
                      controller: PageController(viewportFraction: 0.8),
                      scrollDirection: Axis.horizontal,
                      pageSnapping: true,
                      children: <Widget>[
                        ListView(
                          children: [
                            CarouselSlider(
                              items: [
                                Container(
                                  width: 300,
                                  margin: EdgeInsets.all(6.0),
                                  decoration: BoxDecoration(
                                    color: Color(0xffBCD676),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: InkWell(
                                      child: Column(
                                        children: [
                                          Expanded(
                                            child: Image.asset(
                                              "assets/images/depremc.png",
                                            ),
                                          ),
                                          Text("Earthquake Bag")
                                        ],
                                      ),
                                      onTap: () {
                                        setState(() {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DepremBag()));
                                        });
                                      }),
                                ),
                                Container(
                                  margin: EdgeInsets.all(6.0),
                                  decoration: BoxDecoration(
                                    color: Color(0xffBCD676),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: InkWell(
                                      child: Column(
                                        children: [
                                          Expanded(
                                            child: Image.asset(
                                              "assets/images/aa.png",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Text("Last Earthquakes")
                                        ],
                                      ),
                                      onTap: () {
                                        setState(() {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      HomePage()));
                                        });
                                      }),
                                ),
                                Container(
                                  margin: EdgeInsets.all(6.0),
                                  decoration: BoxDecoration(
                                    color: Color(0xffBCD676),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: InkWell(
                                      child: Column(
                                        children: [
                                          Expanded(
                                            child: Image.asset(
                                              "assets/images/route_map.png",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Text("Safe Area")
                                        ],
                                      ),
                                      onTap: () {
                                        setState(() {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Maps()));
                                        });
                                      }),
                                ),
                              ],

                              //Slider Container properties
                              options: CarouselOptions(
                                scrollDirection: Axis.horizontal,
                                height: 200.0,
                                enlargeCenterPage: true,
                                autoPlay: true,
                                aspectRatio: 16 / 9,
                                autoPlayCurve: Curves.fastOutSlowIn,
                                enableInfiniteScroll: true,
                                autoPlayAnimationDuration:
                                    Duration(milliseconds: 800),
                                viewportFraction: 0.8,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    height: 100,
                    child: Container(
                      child: InkWell(
                          child: Column(
                            children: [
                              Expanded(
                                child: Image.asset(
                                  "assets/images/ses.png",
                                ),
                              ),
                              Text("Emergency Sound")
                            ],
                          ),
                          onTap: () {
                            setState(() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Sound()));
                            });
                          }),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: Color(0xffBCD676),
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      //   color: Colors.redAccent,
                      width: 450,
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    height: 100,
                    child: Container(
                      child: InkWell(
                          child: Column(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Image(
                                    image: NetworkImage(
                                        "https://d.neoldu.com/news/71477.jpg"),
                                  ),
                                ),
                              ),
                              Text("I Feel EarthQuake")
                            ],
                          ),
                          onTap: () {
                            setState(() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => QuizApp()));
                            });
                          }),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: Color(0xffBCD676),
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      //   color: Colors.redAccent,
                      width: 450,
                    ),
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  Container(
                    height: 300,
                    child: PageView(
                      controller: PageController(viewportFraction: 0.8),
                      scrollDirection: Axis.horizontal,
                      pageSnapping: true,
                      children: <Widget>[
                        ListView(children: [
                          CarouselSlider(
                            items: [
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "There are 3 major fault lines in Turkey, namely the North Anatolian Fault Line, the East Anatolian Fault Line and the West Anatolian Fault Line.",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ),
                                width: 300,
                                margin: EdgeInsets.all(2.0),
                                decoration: BoxDecoration(
                                  color: Color(0xffBCD676),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "In the 7.4 magnitude earthquake that took place in Gölcük on 17 August 1999, 18,373 lives were lost.",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ),
                                margin: EdgeInsets.all(2.0),
                                decoration: BoxDecoration(
                                  color: Color(0xffBCD676),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Although it is impossible to prevent earthquakes, it is possible to reduce earthquake damage with conscious and effective methods.",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ),
                                margin: EdgeInsets.all(2.0),
                                decoration: BoxDecoration(
                                  color: Color(0xffBCD676),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Depremlerin önlenmesi olanak dışı da olsa,  Bilinçli ve etkili yöntemler ile Deprem hasarlarının azaltılması mümkün olmaktadır.",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ),
                                margin: EdgeInsets.all(2.0),
                                decoration: BoxDecoration(
                                  color: Color(0xffBCD676),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Deprem habercisi olarak en belirgin doğa değişimi, deprem merkezi ve çevresindeki yer kabuğunda görülen yatay ve düşey hareketlerdir.",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ),
                                margin: EdgeInsets.all(2.0),
                                decoration: BoxDecoration(
                                  color: Color(0xffBCD676),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Türkiye’deki nüfusun %90’ından fazlası deprem tehditti altında yaşamaktadır.",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ),
                                margin: EdgeInsets.all(2.0),
                                decoration: BoxDecoration(
                                  color: Color(0xffBCD676),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Türkiye’de yaşanan doğal afetler daha çok klimatik ve yer kökenlidir.",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ),
                                margin: EdgeInsets.all(2.0),
                                decoration: BoxDecoration(
                                  color: Color(0xffBCD676),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Deprem, yer sarsıntısı veya zelzele, yer kabuğunda beklenmedik bir anda ortaya çıkan enerji sonucunda meydana gelen sismik dalgalanmalar ve bu dalgaların yeryüzünü sarsması olayıdır.",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ),
                                margin: EdgeInsets.all(2.0),
                                decoration: BoxDecoration(
                                  color: Color(0xffBCD676),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "İlk sismoskop M.S. 132 yılında Çinli filozof Chang Heng tarafından icat edilmiştir",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ),
                                margin: EdgeInsets.all(2.0),
                                decoration: BoxDecoration(
                                  color: Color(0xffBCD676),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Depremin yer yüzeyindeki etkileri depremin şiddeti olarak tanımlanır",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ),
                                margin: EdgeInsets.all(2.0),
                                decoration: BoxDecoration(
                                  color: Color(0xffBCD676),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ],

                            //Slider Container properties
                            options: CarouselOptions(
                              scrollDirection: Axis.vertical,
                              height: 145.0,
                              enlargeCenterPage: true,
                              autoPlay: true,
                              aspectRatio: 16 / 9,
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enableInfiniteScroll: true,
                              autoPlayAnimationDuration:
                                  Duration(milliseconds: 800),
                              viewportFraction: 0.8,
                            ),
                          ),
                        ])
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
