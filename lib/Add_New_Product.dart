import 'package:flutter/material.dart';

class AddNewProducts extends StatefulWidget {
  const AddNewProducts({Key? key}) : super(key: key);

  @override
  State<AddNewProducts> createState() => _AddNewProductsState();
}

class _AddNewProductsState extends State<AddNewProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Products'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const TextField(
              decoration: InputDecoration(hintText: 'Product Name'),
            ),
            const SizedBox(height: 8),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Descriptions',
              ),
              maxLines: 2,
            ),
            const SizedBox(height: 8),
            const TextField(
              decoration: InputDecoration(hintText: 'Price'),
            ),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(hintText: 'Image', suffixIcon: IconButton(onPressed: (){}, icon: const Icon(Icons.upload)), border: const OutlineInputBorder(borderSide: BorderSide(width: 0, color: Colors.white))
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Upload'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
