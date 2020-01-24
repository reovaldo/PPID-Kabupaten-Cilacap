import 'package:flutter/material.dart';

class PermohonanPpid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tata Cara Permohonan PPID'),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1/1.5,
              child: Image.network('https://ppid.cilacapkab.go.id/wp-content/uploads/2019/05/20130626_TataCaraPI.jpg'),
            )
          ],
        ),
      ),
    );
  }
}