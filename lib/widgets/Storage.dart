import 'dart:html';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class Storage{
  final firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;
 Future<void> uploadFile(
  String filename,
  String filepath,
     ) async {
   // File file = File(filepath);
   //
   // try{
   //   await storage.ref('images/$filename').putFile(file);
   //
   // } catch (e){
   //   print(e);
   // }

 }
}