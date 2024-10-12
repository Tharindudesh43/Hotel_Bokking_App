import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseServices {
  static gethotels() async {
    CollectionReference hotelCollectionReference =
        FirebaseFirestore.instance.collection("hotels");

    final hotels = await hotelCollectionReference.get();

    print(hotels.docs[0]["title"]);

    hotels.docs.forEach((hotel) {
      print(hotel["prices"][0]);
    });
  }
}
