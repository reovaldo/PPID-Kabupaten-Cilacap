import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoKecuali extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<dynamic, String>> _contentItems = [
      {
        "name": "Keputusan Bupati Cilacap Nomor 481.16/99/17/Tahun 2015",
        "link": "https://ppid.cilacapkab.go.id/wp-content/uploads/2019/07/KEPUTUSAN-BUPATI-CILACAP-NO-481.16-99-17-TAHUN-2015-DAFTAR-INFORMASI-YANG-DIKECUALIKAN.pdf"
      },
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Informasi Dikecualikan'),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Wrap(
              children: <Widget>[
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Image.network('https://ppid.cilacapkab.go.id/wp-content/uploads/2019/05/bg-clp-2-2.jpg'),
                    Text('INFORMASI BERKALA', style: TextStyle(color: Colors.white, fontSize: 28))
                  ],
                )
              ],
            ),
            SizedBox(
              height: 25,
            ),                
            for (var i in _contentItems) 
              ListTile(
                title: Text(i['name']),
                trailing: IconButton(
                  icon: Icon(Icons.info),
                  onPressed: () {
                    launch(i["link"]);
                  },
                ),
              )
          ],
        ),
      ),
    );
  }
}