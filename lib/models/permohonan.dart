class Permohonan {
  String id;
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

  Permohonan({this.id, this.nama, this.alamat, this.pekerjaan, this.noHp, this.noKtp, this.email, this.info, this.tujuan, this.getInfo, this.takeInfo});

  Permohonan.fromMap(Map snapshot, String id) : 
    id = id ?? '',
    nama = snapshot['nama'],
    alamat = snapshot['alamat'],
    pekerjaan = snapshot['pekerjaan'],
    noHp = snapshot['noHp'],
    noKtp = snapshot['noKtp'],
    email = snapshot['email'],
    info = snapshot['info'],
    tujuan = snapshot['tujuan'],
    getInfo = snapshot['getInfo'],
    takeInfo = snapshot['tujuan'];

  toJson() {
    return {
      "nama": nama,
      "alamat": alamat,
      "pekerjaan": pekerjaan,
      "noHp": noHp,
      "noKtp": noKtp,
      "email": email,
      "info": info,
      "tujuan": tujuan,
      "getInfo": getInfo,
      "takeInfo": takeInfo,
    };
  }

}