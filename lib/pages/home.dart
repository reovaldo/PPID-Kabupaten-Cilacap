import 'package:flutter/material.dart';
import 'package:fredo_app/pages/infopublic.dart';
import 'package:fredo_app/pages/permohonaninfo.dart';
import 'package:fredo_app/pages/permohonanppid.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> _menuNames = ['Tata Cara Permohonan PPID', 'FORM PERMOHONAN INFORMASI', 'DAFTAR INFORMASI PUBLIK', 'PORTAL DATA TERBUKA', 'STATISTIK LAYANAN INFORMASI PUBLIK'];
  List<dynamic> _pageRoute = [PermohonanPpid(), PermohonanInfo(), InfoPublic(title: 'DAFTAR INFORMASI PUBLIK'), InfoPublic(title: 'DAFTAR INFORMASI PUBLIK'), InfoPublic(title: 'DAFTAR INFORMASI PUBLIK')];
  List<GestureDetector> _buildMenuCards(BuildContext context, int count) {
    List<GestureDetector> cards = List.generate(count, (index) => GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => _pageRoute[index]));
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18.0 / 11.0,
              child: Image.asset('images/icon.png'),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(_menuNames[index], style: TextStyle(fontSize: 14), textAlign: TextAlign.center,)
                ],
              ),
            )
          ],
        ),
      ),
    ));
    return cards;
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('PPID CILACAP'),
      ),
      drawer: Drawer(
        child: ListTile(
          onTap: () {
            print('test');
          },
          title: Text('Data Permohonan PPID'),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Wrap(
              children: <Widget>[
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Image.network('https://ppid.cilacapkab.go.id/wp-content/uploads/2019/05/bg-clp-2-2.jpg'),
                    // Container(
                    //   decoration: BoxDecoration(
                    //     gradient: LinearGradient(
                    //       colors: [Colors.green, Colors.blue])
                    //   ),
                    //   child: Center(
                    //     child: Text('Gradients are cool!',
                    //       style: TextStyle(
                    //         fontSize: 35,
                    //         color: Colors.white,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Text('PPID Kabupaten Cilacap', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold))
                  ],
                )
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.all(16.0),
              childAspectRatio: 8.0 / 9.0,
              children: _buildMenuCards(context, 5),
            ),
          ),
        ],
      )
    );
  }
}
