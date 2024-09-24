import 'package:flutter/material.dart';
import 'package:pr_pks_4/models/product.dart';
import 'package:pr_pks_4/pages/add_product_page.dart';

final List<Product> products = <Product>[];

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  void navigateToAddProductPage(BuildContext context) async{
    final result = await Navigator.push(context,
      MaterialPageRoute(builder: (context) => const addProductPage()),
    );

    if (result != null && result.isNotEmpty){
      setState(() {
        products.add(result);
      });
    }
  }

  void _removeProduct(int index){
    setState(() {
      products.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Добавленные товары"),
      ),
      body: products.isEmpty
        ? const Center(child: Text("Нет добавленных товаров"),)
          : ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index){
          return ListTile(
            title: Text(products[index].toString()),
            trailing: IconButton(
              icon: const Icon(Icons.delete_outline_outlined),
              onPressed: () => _removeProduct(index),
            ),
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => navigateToAddProductPage(context),
        child: Icon(Icons.add_box_rounded),
        tooltip: "Добавить товар",
      ),
    );
  }
}
