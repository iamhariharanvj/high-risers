// import 'package:firebase_database/firebase_database.dart';
//
// class Need {
//   final String name;
//   final String contact;
//   final String city;
//   final String orderid;
//
//   Need({
//     required this.name,
//     required this.contact,
//     required this.city,
//     required this.orderid,
//   });
//
//   Need.fromSnapshot(DataSnapshot snapshot) :
//         name= snapshot.value["Name"],
//         contact = snapshot.value["ContactNo"],
//         city = snapshot.value["City"],
//         orderid = snapshot.value["OrderId"];
//
//   toJson() {
//     return {
//       "Name" : name,
//       "City" : city,
//       "ContactNo" : contact,
//       "OrderId" : orderid,
//     };
//   }
// }