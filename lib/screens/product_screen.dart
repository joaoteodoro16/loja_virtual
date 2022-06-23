import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../datas/product_data.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen(this.product, {Key? key}) : super(key: key);
  final ProductData product;


  @override
  State<ProductScreen> createState() => _ProductScreenState(product);
}

class _ProductScreenState extends State<ProductScreen> {
  _ProductScreenState(this.product);
  final ProductData product;
  String sizeS = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          product.title,
          style: TextStyle(fontSize: 16),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: CarouselSlider(
              items: [
                ...?product.images.map((image) {
                  return Image.network(
                    image,
                    fit: BoxFit.cover,
                  );
                })
              ],
              options: CarouselOptions(
                disableCenter: true,
                enlargeCenterPage: true,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  product.title,
                  maxLines: 2,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  "R\$ ${product.price.toStringAsFixed(2)}",
                  style: TextStyle(
                      fontSize: 23,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  product.description,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Escolha o tamanho",
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 34,
                  child: GridView(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 8.0,
                      childAspectRatio: 0.5,
                    ),
                    children: [
                      ...?product.sizes!.map((size) {
                        return InkWell(
                          onTap: (){
                            setState((){
                              sizeS = size;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(4),
                              ),
                              border: Border.all(
                                color: sizeS == size  ? Theme.of(context).primaryColor : Colors.grey,
                                width: 2,
                              ),
                            ),
                            width: 50,
                            alignment: Alignment.center,
                            child: Text(size,style: TextStyle(color: sizeS == size  ? Theme.of(context).primaryColor : Colors.black),),
                          ),
                        );
                      })
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
