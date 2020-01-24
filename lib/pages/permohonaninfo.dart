import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fredo_app/helpers/firebasehelper.dart';
import 'package:fredo_app/models/permohonan.dart';

class PermohonanInfo extends StatefulWidget {
  @override
  _PermohonanInfoState createState() => _PermohonanInfoState();
}

class _PermohonanInfoState extends State<PermohonanInfo> {
  ScaffoldState scaffold;
  final _formKey = GlobalKey<FormState>();
  FirebaseHelper db = FirebaseHelper('fredo_app');
  List<Permohonan> permohonan;
  String nama;
  String alamat;
  String pekerjaan;
  String noHp;
  String noKtp;
  String email;
  String info;
  String tujuan;
  String getInfo;
  String takeInfo;
  
  //
  String _selectedPekerjaan;
  List<String> _listPekerjaan = ['Pelajar/Mahasiswa', 'Pengusaha', 'PNS', 'TNI/POLRI', 'Karyawan BUMN', 'Karyawan Swasta', 'Tidak Bekerja'];
  
  //
  String _selectedGetInfo;
  List<String> _listGetInfo = ['Melihat / Membaca / Mencatat / Mendengarkan', 'Mendapat Salinan Informasi (Hardcopy / Softcopy)'];
  
  //
  String _selectedTakeInfo;
  List<String> _listTakeInfo = ['Mengambil Langsung', 'Kurir', 'Pos', 'Faksimile', 'Email'];
  
  //
  void showToas() {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text("snackbar")));
  }
  //
  void changePekerjaan(String value) {
    setState(() {
      _selectedPekerjaan = value;
    });
  }
  void changeGetInfo(String value) {
    setState(() {
      _selectedGetInfo = value;
    });
  }
  void changeTakeInfo(String value) {
    setState(() {
      _selectedTakeInfo = value;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Permohonan Informasi'),
      ),
      body: Container(
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[

              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20, left: 15, right: 15),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Nama',                  
                    hintText: 'Masukan Nama',
                    filled: true,                   
                  ),
                  onSaved: (value) => nama = value,
                )
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20, left: 15, right: 15),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Alamat',                  
                    hintText: 'Masukan Alamat',
                    filled: true,                   
                  ),
                  onSaved: (value) => alamat = value,
                )
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20, left: 15, right: 15),
                child: DropdownButtonFormField(
                  items: _listPekerjaan.map((value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value)
                    );
                  }).toList(),
                  value: _selectedPekerjaan,
                  decoration: InputDecoration(          
                    hintText: 'Masukan Pekerjaan',
                    filled: true,                   
                  ),
                  onSaved: (value) => pekerjaan = value,
                  onChanged: (value) {
                    changePekerjaan(value);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20, left: 15, right: 15),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'No HP',                  
                    hintText: 'Masukan No HP',
                    filled: true,                   
                  ),
                  onSaved: (value) => noHp = value
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20, left: 15, right: 15),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'No KTP',                  
                    hintText: 'Masukan No KTP',
                    filled: true,                   
                  ),
                  onSaved: (value) => noKtp = value
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20, left: 15, right: 15),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',                  
                    hintText: 'Masukan Email',
                    filled: true,                   
                  ),
                  onSaved: (value) => email = value
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20, left: 15, right: 15),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Informasi Yang Dibutuhkan',                  
                    hintText: 'Masukan Detail Informasi',
                    filled: true,                   
                  ),
                  onSaved: (value) => info = value
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20, left: 15, right: 15),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Tujuan Penggunaan Informasi',                  
                    hintText: 'Masukan Penggunaan Informasi',
                    filled: true,                   
                  ),
                  onSaved: (value) => tujuan = value
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20, left: 15, right: 15),
                child: DropdownButtonFormField(
                  isExpanded: true,
                  items: _listGetInfo.map((value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value)
                    );
                  }).toList(),
                  value: _selectedGetInfo,
                  decoration: InputDecoration(          
                    hintText: 'Cara Memperoleh Informasi',
                    filled: true,                   
                  ),
                  onSaved: (value) => getInfo = value,
                  onChanged: (value) {
                    changeGetInfo(value);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20, left: 15, right: 15),
                child: DropdownButtonFormField(
                  items: _listTakeInfo.map((value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value)
                    );
                  }).toList(),
                  value: _selectedTakeInfo,
                  decoration: InputDecoration(          
                    hintText: 'Cara Mendapatkan Informasi ',
                    filled: true,                   
                  ),
                  onSaved: (value) => takeInfo = value,
                  onChanged: (value) {
                    changeTakeInfo(value);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20, top: 10, left: 15, right: 15),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: RaisedButton(
                        child: Text('Save'),
                        onPressed: () {
                          _formKey.currentState.save();
                          saveData(context);
                          print('save');
                        },
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        width: 5,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: RaisedButton(
                        child: Text('Reset'),
                        onPressed: () {
                          print('reset');
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void saveData(BuildContext context) async {
    var result = await db.addDocument(Permohonan(nama: nama, alamat: alamat, pekerjaan: pekerjaan, noHp: noHp, noKtp: noKtp, email: email, info: info, tujuan: tujuan, getInfo: getInfo, takeInfo: takeInfo).toJson());
    if(result.documentID.isNotEmpty) {
      Navigator.pop(context);
    } else {
      Scaffold.of(context).showSnackBar(SnackBar(content: Text("snackbar")));
    }
    
  }

  void getData() async {
    var result = await db.getData();
    permohonan = result.documents.map((doc) => Permohonan.fromMap(doc.data, doc.documentID)).toList();
    for ( var i in permohonan) {
      print(i.toJson());
    }
    // database.collection('fredo_app').getDocuments().then((snapshot) {
    //   snapshot.documents.forEach((f) => print('${f.data}'));
    // });
  }
}