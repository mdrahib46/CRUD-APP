import 'dart:convert';

import 'package:crudapp/Add_New_Product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'class.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  List<Product> products = [];

  @override
  void initState() {
    getProduct();
    super.initState();
  }

  getProduct() async {
    ///  www.crud.teamrabbil.com/api/v1/ReadProduct
    /// cal Get method()
    ///Url should convert to URI(Universal Resource Identifier )
    Response response = await get(
        Uri.parse('https://www.crud.teamrabbil.com/api/v1/ReadProduct'));
    print(response.statusCode);
    print(response.body);

    final Map<String, dynamic> decodeResponse = jsonDecode(response.body);
    // print("decoded value ${decodeResponse['data'].length}");

    if (response.statusCode == 200) {
      for(var e in decodeResponse['data']){
        products.add(Product.toJson(e));
      }





      setState(() {});
    }

    //
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('CRUD APP'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddNewProducts()));
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            onLongPress: () {
              showDialog(
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                      titlePadding: const EdgeInsets.only(left: 16),
                      contentPadding: const EdgeInsets.only(left: 5),
                      title: Row(
                        children: [
                          const Text('Choose an option'),
                          const Spacer(),
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.close))
                        ],
                      ),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                              onTap: () {},
                              leading: const Icon(Icons.edit),
                              title: const Text('Edit')),
                          ListTile(
                              onTap: () {},
                              leading: const Icon(Icons.delete_forever),
                              title: const Text('Remove')),
                        ],
                      ),
                    );
                  });
            },
            leading: Container(
              height: 46,
              width: 46,
              child: Image.network(
                products[index].image,
                errorBuilder: (_, __, ___) {
                  return const Icon(
                    Icons.image_outlined,
                    size: 50,
                  );

                },
              ),
            ),
            title:  Text(products[index].productName),
            subtitle: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Product Code: ${products[index].productCode}'),
                Text('Build Date: ${products[index].createAt}'),

              ],
            ),
            trailing: Column(
              children: [
                const Text('Unit Price',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text(products[index].unitPrice),
              ],
            ),
          );
        },
        itemCount: products.length,
      ),
    );
  }
}
