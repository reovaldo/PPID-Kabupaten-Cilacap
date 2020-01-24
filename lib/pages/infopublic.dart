import 'package:flutter/material.dart';
import 'package:fredo_app/pages/pages_infopublic/infoberkala.dart';
import 'package:fredo_app/pages/pages_infopublic/infokecuali.dart';
import 'package:fredo_app/pages/pages_infopublic/infosertamerta.dart';

class InfoPublic extends StatefulWidget {
  InfoPublic({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _InfoPublicState createState() => _InfoPublicState();
}

class _InfoPublicState extends State<InfoPublic> {

  @override
  Widget build(BuildContext context) {
    List<Map<dynamic, dynamic>> menuNames = [
      {
        "name": "Informasi Berkala",
        "page": InfoBerkala()
      },
      {
        "name": "Informasi Serta Merta", 
        "page": InfoSertaMerta(),
      },
      {
        "name": "Informasi Setiap Saat",
        "page": InfoBerkala()
      },
      {
        "name": "Informasi Yang Dikecualikan",
        "page": InfoKecuali()
      } 
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('PPID CILACAP'),
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => i['page']));
              },
              child: Card(
                elevation: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 3/1,
                      child: Image.asset('images/icon.png'),
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
