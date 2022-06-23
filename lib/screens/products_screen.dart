import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/datas/product_data.dart';

import '../tiles/products_tile.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen(this.snapshot, {Key? key}) : super(key: key);

  final DocumentSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text((snapshot.data() as Map<String, dynamic>)['title']),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Colors.white70,
            tabs: [
              Tab(
                icon: Icon(Icons.grid_on),
              ),
              Tab(
                icon: Icon(Icons.list),
              )
            ],
          ),
        ),
        body: FutureBuilder<QuerySnapshot>(
          future: FirebaseFirestore.instance
              .collection("products")
              .doc(snapshot.id)
              .collection("itens")
              .get(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  GridView.builder(
                    padding: EdgeInsets.all(4),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                      childAspectRatio: 0.51,
                    ),
                    itemBuilder: (context, index) {
                      return ProductTile(
                          "grid",
                          ProductData.fromDocument(
                              (snapshot.data!).docs[index]));
                    },
                    itemCount: snapshot.data?.docs.length,
                  ),
                  ListView.builder(
                    padding: EdgeInsets.all(3),
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index) {
                      return ProductTile(
                          "list",
                          ProductData.fromDocument(
                              (snapshot.data!).docs[index]));
                    },
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
