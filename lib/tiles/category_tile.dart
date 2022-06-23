import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/screens/products_screen.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile(this.snapshot,{Key? key}) : super(key: key);
  final DocumentSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 18,
        backgroundColor: Colors.transparent,
        backgroundImage: NetworkImage((snapshot.data() as Map<String, dynamic>)['icon']),
      ),
      title: Text((snapshot.data() as Map<String, dynamic>)['title']),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ProductsScreen(snapshot))
        );
      },
    );
  }
}
