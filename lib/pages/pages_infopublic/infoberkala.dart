import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoBerkala extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<dynamic, String>> _contentItems = [
      {
        "name": "Nama dan Alamat Badan Publik",
        "link": "https://ppid.cilacapkab.go.id/web-link-opd/"
      },
      {
        "name": "Visi dan Misi",
        "link": "https://ppid.cilacapkab.go.id/wp-content/uploads/2019/09/05.-BAB-V-12-okt.pdf"
      },
      {
        "name": "Tugas Pokok dan Fungsi",
        "link": "https://ppid.cilacapkab.go.id/wp-content/uploads/2019/09/Perbup_Clp_2016_107_SOTK_DisKominfo.pdf"
      },
      {
        "name": "Rekapitulasi PNS",
        "link": "https://ppid.cilacapkab.go.id/wp-content/uploads/2019/08/Rekapitulasi_statistik_pns.pdf"
      },
      {
        "name": "LHKPN Pimpinan",
        "link": "https://ppid.cilacapkab.go.id/wp-content/uploads/2019/08/LHKPN-Bupati-Cilacap.PDF.pdf"
      }
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Informasi Berkala'),
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