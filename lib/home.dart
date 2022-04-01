import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'cartmodel.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Product> _products = [
    Product(id: 1, title: "Apple", price: 20, imgUrl: "https://img.icons8.com/plasticine/2x/apple.png", qty: 1),
    Product(
        id: 2,
        title: "Banana",
        price: 40,
        imgUrl: "https://img.icons8.com/cotton/2x/banana.png",
        qty: 1),
    Product(
        id: 3,
        title: "Orange",
        price: 20,
        imgUrl: "https://img.icons8.com/cotton/2x/orange.png",
        qty: 1),
    Product(
        id: 4,
        title: "Melon",
        price: 40,
        imgUrl: "https://img.icons8.com/cotton/2x/watermelon.png",
        qty: 1),
    Product(
        id: 5,
        title: "Avocado",
        price: 25,
        imgUrl: "https://img.icons8.com/cotton/2x/avocado.png",
        qty: 1),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[50],
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("Home"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () => Navigator.pushNamed(context, '/cart'),
          )
        ],
      ),
      body: Column(
        children: [

      /*    TextField(


              onChanged: (value) {
                setState(() {
               //   searchString = value.toLowerCase();
                });
              },
              decoration: InputDecoration(
                labelText: 'Search',
                suffixIcon: Icon(Icons.search),
              ),
            ),*/

           Expanded(


                child: ListView.builder(

                     itemCount: _products.length,

                    itemBuilder: (context, index) {
                      return ScopedModelDescendant<CartModel>(
                          builder: (context, child, model) {
                            return Card(

                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 5),
                              child: Container(


                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(20.0)
                                ),
                                height: 100,
                                // padding: EdgeInsets.all(3),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [


                                    Expanded(
                                      flex: 3,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment
                                            .center,

                                        children: [
                                          //
                                          Center(child: Text(
                                            "${_products[index].title}",
                                            style: TextStyle(fontSize: 20,
                                                fontWeight: FontWeight.bold),)),
                                          new Divider(),
                                          Text("${_products[index].price}",
                                            style: TextStyle(color: Colors.white),)


                                        ],
                                      ),
                                    ),
                                    Expanded(
                                        flex: 5,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment
                                              .center,
                                          crossAxisAlignment: CrossAxisAlignment
                                              .end,

                                          children: [
// SizedBox(width: 340,),
                                            IconButton(onPressed: () {
                                              model.addProduct(_products[index]);
                                            }, icon: Icon(Icons.add)),

                                          ],
                                        )),
                                    SizedBox(width: 15,)
                                  ],

                                ),
                              ),

                            );
                          }
                      );
                    }

                ),
              ),


        ],
      )

      // ListView.builder(
      //   itemExtent: 80,
      //   itemCount: _products.length,
      //   itemBuilder: (context, index) {
      //     return ScopedModelDescendant<CartModel>(
      //         builder: (context, child, model) {
      //       return ListTile(
      //           leading: Image.network(_products[index].imgUrl),
      //           title: Text(_products[index].title),
      //           subtitle: Text("\$"+_products[index].price.toString()),
      //           trailing: OutlineButton(
      //               child: Text("Add"),
      //               onPressed: () => model.addProduct(_products[index])));
      //     });
      //   },
      // ),
    );
  }
}
