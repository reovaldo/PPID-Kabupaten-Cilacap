import 'package:flutter/material.dart';
import 'package:fredo_app/pages/pages_infopublic/infoberkala.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoSertaMerta extends StatefulWidget {
  InfoSertaMerta({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _InfoSertaMertaState createState() => _InfoSertaMertaState();
}

class _InfoSertaMertaState extends State<InfoSertaMerta> {

  @override
  Widget build(BuildContext context) {
    List<Map<dynamic, dynamic>> menuNames = [
      {
        "name": "Informasi Cuaca Terkini",
        "image": "https://ppid.cilacapkab.go.id/wp-content/uploads/2019/05/58981ae34a2a4-waspada-cuaca-ekstrem-melanda-indonesia_665_374.jpg",
        "link": "http://www.bmkg.go.id/cuaca/prakiraan-cuaca.bmkg?Kota=Cilacap&AreaID=501242&Prov=11"
      },
      {
        "name": "Informasi Gempa Terkini", 
        "image": "https://ppid.cilacapkab.go.id/wp-content/uploads/elementor/thumbs/1514636175_ber-e1558624270887-o8913w5ix5drwtiu1yq0d0rpl108mak1ogkwz7hbdy.jpg",
        "link": "http://www.bmkg.go.id/gempabumi/gempabumi-dirasakan.bmkg"
      },
      {
        "name": "Informasi Bencana Terkini",
        "image": "https://ppid.cilacapkab.go.id/wp-content/uploads/elementor/thumbs/bpbd-cilacap-siapkan-dana-air-bersih-TZTQdUE3km-o9s82j343tfk4va5dh4ruiiihblnja86w8q6coaj1i.jpg",
        "link": "http://bpbd.cilacapkab.go.id/informasi-bencana/"
      }
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('INFORMASI SERTA MERTA'),
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Wrap(
              children: <Widget>[
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Image.network('https://ppid.cilacapkab.go.id/wp-content/uploads/2019/05/bg-clp-2-2.jpg'),
                    Text('DAFTAR INFORMASI', style: TextStyle(color: Colors.white, fontSize: 28))
                  ],
                )
              ],
            ),
            SizedBox(
              height: 25,
            ),            
            for (var i in menuNames) GestureDetector(
              onTap: () {
                launch(i['link']);
              },
              child: Card(
                elevation: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 3/1,
                      child: Image.network(i['image']),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(
                            child: Text(i['name'], style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300)),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );      
  }
}
