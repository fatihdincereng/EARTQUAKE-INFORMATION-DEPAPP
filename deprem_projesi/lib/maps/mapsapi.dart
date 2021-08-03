import 'package:google_maps_flutter/google_maps_flutter.dart';

class Place {
  String shopName;
  String address;
  String description;
  String thumbNail;
  LatLng locationCoords;

  Place(
      {this.shopName,
      this.address,
      this.description,
      this.thumbNail,
      this.locationCoords});
}

final List<Place> coffeeShops = [
  Place(
      shopName: 'Yükselen Park',
      address: 'Osmangazi/Bursa',
      description: 'Soğanlı, Nilüfer Cd., 16190 Osmangazi/Bursa',
      locationCoords: LatLng(40.21479924493883, 29.043901000490244),
      thumbNail:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMgdTy3oQrhqjrtGV5HtFwzp8p977TEgy3gQ&usqp=CAU'),
  Place(
      shopName: 'Botanik park',
      address: 'Osmangazi/Bursa',
      description: 'AÇukurcaköy, Nilüfer Cd., 16190 Osmangazi/Bursa',
      locationCoords: LatLng(40.21875989515202, 29.04052013653664),
      thumbNail:
          'https://lh5.googleusercontent.com/p/AF1QipMqmHNsibB45LXVx4M6IxkDmC1nNChLvx4QX92C=w408-h306-k-no'),
  Place(
      shopName: 'Küçükbalıklı Parkı',
      address: 'Osmangazi/Bursa',
      description: 'Altınova, 1. Ova Sk. No:32, 16250 Osmangazi/Bursa',
      locationCoords: LatLng(40.22102166101331, 29.068507099623666),
      thumbNail:
          'https://lh5.googleusercontent.com/p/AF1QipMNk-qCU1zMjq94FLS8NxiqHGA-iZkRq0OI51cT=w426-h240-k-no'),
  Place(
      shopName: 'Karasu Çocuk Parkı',
      address: 'Osmangazi/Bursa',
      description: 'Küçükbalıklı, Karasu Sk., 16250 Osmangazi/Bursa',
      locationCoords: LatLng(40.21495933623281, 29.078902910645272),
      thumbNail:
          'https://lh4.googleusercontent.com/f-V_Bd5zcWB8ekeSV3hxO6YTS7kOIJkngXyRuuQdOJWqaXv-IDZZQowwfQU-vu1m=w426-h240-k-no'),
  Place(
      shopName: 'Millet Maden Parkı',
      address: 'Yıldırım/Bursa',
      description: 'Millet, Millet Cd., 16270 Yıldırım/Bursa',
      locationCoords: LatLng(40.213484609954314, 29.10276384171303),
      thumbNail:
          'https://img.piri.net/mnresize/840/-/resim/imagecrop/2019/03/22/04/32/resized_f519e-fb534feepark211.jpg'),
  Place(
      shopName: 'Millet Parkı',
      address: '16260 Yıldırım/Bursa',
      description: 'Millet, 16260 Yıldırım/Bursa',
      locationCoords: LatLng(40.2076509343481, 29.09409494124075),
      thumbNail:
          'https://www.bursa.bel.tr/dosyalar/projeler/14ywmzdrtwu8sk8.jpg'),
  Place(
      shopName: 'Yildırim Belediyesi Türkan Parkı',
      address: 'Yıldırım/Bursa',
      description: 'Millet, 16270 Demirtaş Dumlupınar Osb/Yıldırım/Bursa',
      locationCoords: LatLng(40.21761376242121, 29.094438263966072),
      thumbNail:
          'https://lh5.googleusercontent.com/p/AF1QipNexpZAFTNz32ShVxwEQC3ukTuawDRMjTpl-BV8=w408-h400-k-no'),
  Place(
      shopName: 'Reşat Oyal Kultur Parkı',
      address: 'Osmangazi/Bursa',
      description: 'Gaziakdemir, Çekirge Cd. No:6, 16190 Osmangazi/Bursa',
      locationCoords: LatLng(40.19665341141731, 29.043391269265964),
      thumbNail:
          'https://lh5.googleusercontent.com/p/AF1QipPSRweX_fmvyTltg3ebpX7Q8M1xoCggo3lop8ce=w408-h306-k-no'),
  Place(
      shopName: 'Merinos Kultur Parkı',
      address: 'Osmangazi/Bursa',
      description:
          'Santral Garaj, Ulubatlı Hasan Blv. No:1, 16200 Osmangazi/Bursa',
      locationCoords: LatLng(40.199142168303005, 29.054135914933116),
      thumbNail:
          'https://lh5.googleusercontent.com/p/AF1QipPVaMUHO2B2N9DaHUyf60Sb0ShQBX37lvEBa_CX=w426-h240-k-no'),
  Place(
      shopName: 'Muradiye Dinlenme',
      address: 'Osmangazi/Bursa',
      description: 'Muradiye, Kaplıca Cd. No:62, 16050 Osmangazi/Bursa',
      locationCoords: LatLng(40.19032936444508, 29.046549818864698),
      thumbNail:
          'https://lh3.googleusercontent.com/p/AF1QipMqQhNKO4OyesxEIlpizWBSvKrsaIirYiBOY6-p=w600-k'),
  Place(
      shopName: 'Atatürk Meydanı',
      address: 'Osmangazi/Bursa',
      description: 'Gaziakdemir, Stadyum Cd. No:1 D:3, 16190 Osmangazi/Bursa',
      locationCoords: LatLng(40.193049556472864, 29.049320773950317),
      thumbNail:
          'http://www.kackartv.com.tr/images/haberler/eski-stat-ataturk-meydani-oluyor-2-9184649_o.jpg'),
  Place(
      shopName: 'Haşim İşçan Bisaş Parkı',
      address: 'Osmangazi/Bursa',
      description: 'Kuruçeşme, 2. Bayır Sk. No:17, 16050 Osmangazi/Bursa',
      locationCoords: LatLng(40.188685123796006, 29.0527445721051),
      thumbNail: 'http://wowturkey.com/tr260/k_Erol_Gunduz_hasim_iscan_6.jpg'),
  Place(
      shopName: 'Selimiye Parkı',
      address: 'Osmangazi/Bursa',
      description: 'Selimiye, Bursalı Tahir Cd. No:74, 16050 Osmangazi/Bursa',
      locationCoords: LatLng(40.19153727517395, 29.05355996360994),
      thumbNail:
          'https://lh4.googleusercontent.com/lpv8y964pmY6LZ7RlBCn1om2g8Dkq9mzcAX2mr8FtcgNpNsKv_BLK0Wortp36I96=w408-h306-k-no'),
  Place(
      shopName: 'Okçu Baba Parkı',
      address: 'Osmangazi/Bursa',
      description: 'Osmangazi, Cemal Nadir Cd. No:3, 16040 Osmangazi/Bursa',
      locationCoords: LatLng(40.19153727517395, 29.05355996360994),
      thumbNail:
          'https://lh3.googleusercontent.com/p/AF1QipOeqLgaFjBtlJ9lRbUgUVj_WSMYacVCvK0P_Vp8=w1024-k'),
  Place(
      shopName: 'Gökdere Vadisi Parkı',
      address: 'Osmangazi/Bursa',
      description: 'Kurtoğlu, 1. Aziz Sk. No:10, 16360, 16360 Yıldırım/Bursa',
      locationCoords: LatLng(40.18173455150725, 29.071284000284404),
      thumbNail:
          'https://lh5.googleusercontent.com/p/AF1QipMQ64Z1ruDB58cpNLzwJRloghygplL9o_G7Q95j=w408-h306-k-no'),
  Place(
      shopName: 'Temenyeri Parkı',
      address: 'Osmangazi/Bursa',
      description: 'Karaağaç, Eşrefiler Sk. No:34, 16360 Yıldırım/Bursa',
      locationCoords: LatLng(40.17740647686229, 29.06557626006429),
      thumbNail:
          'https://lh5.googleusercontent.com/p/AF1QipO0eMF1bwfSqnJt8uhvq_1Pke58kvT-leN3LYQ=w426-h240-k-no'),
  Place(
      shopName: 'Timurtaşpaşa Parkı',
      address: 'Osmangazi/Bursa',
      description: 'Kavaklı, 2. Osman Gazi Cd. No:5, 16040 Osmangazi/Bursa',
      locationCoords: LatLng(40.18511156932476, 29.059782688845722),
      thumbNail:
          'https://lh5.googleusercontent.com/p/AF1QipOqW1HdVaIxgcZosF28zvYhUgZabKqLf-p2zq4p=w408-h725-k-no'),
  Place(
      shopName: 'Merinos Kültür Parkı',
      address: 'Osmangazi/Bursa',
      description:
          'Santral Garaj, Ulubatlı Hasan Blv. No:1, 16200 Osmangazi/Bursa',
      locationCoords: LatLng(40.199025900235476, 29.05421468922635),
      thumbNail:
          'https://lh5.googleusercontent.com/p/AF1QipPVaMUHO2B2N9DaHUyf60Sb0ShQBX37lvEBa_CX=w426-h240-k-no'),
  Place(
      shopName: 'Elmasbahçeler Parkı',
      address: 'Osmangazi/Bursa',
      description: 'Elmasbahçeler, Ali Ferruh Yücel Cd., 16230 Osmangazi/Bursa',
      locationCoords: LatLng(40.18801220177604, 29.077256181356418),
      thumbNail:
          'https://lh5.googleusercontent.com/p/AF1QipNS_pvIy4NzpiBTVXiP16F7M8D8w2EiyGliFY-t=w408-h725-k-no'),
  Place(
      shopName: 'Hüdavendigar Park',
      address: 'Osmangazi/Bursa',
      description: 'Hüdavendigar, 16090 Osmangazi/Bursa',
      locationCoords: LatLng(40.20255638816382, 29.00296157780819),
      thumbNail:
          'https://lh5.googleusercontent.com/p/AF1QipOpov11sm8RmXgbchzwlxBkxWNy4IGMpc9nWHDe=w487-h240-k-no'),
  Place(
      shopName: 'Karaağaç Parkı',
      address: 'Osmangazi/Bursa',
      description: 'Hüdavendigar, 1. Sk., 16360 Yıldırım/Osmangazi/Bursa',
      locationCoords: LatLng(40.20019637911296, 29.006480636058278),
      thumbNail:
          'https://lh5.googleusercontent.com/p/AF1QipNUS4xhtPROUhNxTK3I3NVVmfflbzFljmzt7ce3=w408-h544-k-no'),
  Place(
      shopName: 'Kiremitli Parkı',
      address: 'Osmangazi/Bursa',
      description: 'Kükürtlü Mh, Kükürtlü Cd., 16110 Osmangazi/Bursa',
      locationCoords: LatLng(40.206751756962596, 29.021157683547315),
      thumbNail:
          'https://lh4.googleusercontent.com/mSd4_7uyqx646Im_53WXZ2fuhtPIhlb2Fx1eFbxw1tvmlO60N0FqnUzeTY239eps=w408-h306-k-no'),
  Place(
      shopName: 'Selamet Çocuk Parkı',
      address: 'Osmangazi/Bursa',
      description: 'Selamet, Gazi Cd. No:94, 16240 Osmangazi/Bursa',
      locationCoords: LatLng(40.20606596161438, 29.07680634432008),
      thumbNail:
          'https://lh5.googleusercontent.com/p/AF1QipP3qIPeQ8pvfmB6xGmDwUcwqJ0ugCCkjhLzKdGk=w408-h306-k-no'),
  Place(
      shopName: 'Çamlıca Parkı',
      address: 'Nilüfer/Bursa',
      description: 'Çamlıca, Eğitimciler Cd., 16110 Nilüfer/Bursa',
      locationCoords: LatLng(40.20086684117711, 28.976057518953947),
      thumbNail:
          'https://lh5.googleusercontent.com/p/AF1QipPqpmj57AyaQTJMJevR2qAklgqlSQmOvawFWmoE=w426-h240-k-no'),
  Place(
      shopName: 'Cephanelik Parkı',
      address: 'Nilüfer/Bursa',
      description: 'Kültür, 16110, Gültekin Cd. 30-34, 16110 Nilüfer/Bursa',
      locationCoords: LatLng(40.20274562130836, 28.97138531265143),
      thumbNail:
          'https://lh5.googleusercontent.com/p/AF1QipNIptWcOYmC-_A8Xg77ETNMx8TRpMHXoPTAcSaz=w408-h839-k-no'),
  Place(
      shopName: 'Mimoza Çocuk Parkı',
      address: 'Nilüfer/Bursa',
      description: 'Çamlıca, 16000 Nilüfer/Bursa',
      locationCoords: LatLng(40.19926218979118, 28.982547210504784),
      thumbNail:
          'https://lh5.googleusercontent.com/p/AF1QipP_bETQz5RARKGk4wAWF7Iw8tf5U2imvDG3JlIt=w408-h306-k-no'),
  Place(
      shopName: 'Dalyan Parkı',
      address: 'Nilüfer/Bursa',
      description: 'Barış, Kale Sk. No:11, 16140 Nilüfer/Bursa',
      locationCoords: LatLng(40.216061931749586, 28.973309559266855),
      thumbNail:
          'https://lh5.googleusercontent.com/p/AF1QipNUVVKbncO3zT3hkhr5hUBLXAwhQWEObPuCtX8s=w426-h240-k-no'),
  Place(
      shopName: 'Ziraat Park Bursa',
      address: 'Osmangazi/Bursa',
      description: 'Yenikaraman, 1. Hürriyet Cd. No:205, 16170 Osmangazi/Bursa',
      locationCoords: LatLng(40.22757595208555, 28.994785492725804),
      thumbNail:
          'https://lh5.googleusercontent.com/p/AF1QipMSTdQkh-yaRlhYnG0vY7q8E5LapD5bki0yIVQJ=w408-h306-k-no'),
];
