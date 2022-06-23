import 'package:cloud_firestore/cloud_firestore.dart';

class ProductData{

  late String id;
  late String title;
  late String description;
  late double price;
  late List images;
  late List sizes;
  late String category;
  late String description2;

  ProductData.fromDocument(DocumentSnapshot snapshot){
    id = snapshot.id;
    title = (snapshot.data() as Map<String, dynamic>)['title'];
    description = (snapshot.data() as Map<String, dynamic>)['description'];
    price = (snapshot.data() as Map<String, dynamic>)['price'] + 0.0;
    images = (snapshot.data() as Map<String, dynamic>)['images'];
    sizes = (snapshot.data() as Map<String, dynamic>)['sizes'];
    description2 = (snapshot.data() as Map<String, dynamic>)['description2'];
  }




}