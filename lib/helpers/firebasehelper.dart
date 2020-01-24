import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseHelper {
  final Firestore _db = Firestore.instance;
  String path;
  CollectionReference ref;

  FirebaseHelper(this.path) {
    ref = _db.collection(path);
  }

  Future<QuerySnapshot> getData() {
    return ref.getDocuments();
  }
  
  Future<DocumentReference> addDocument(Map data) {
    return ref.add(data);
  }
}