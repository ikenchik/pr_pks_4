import 'package:flutter/material.dart';
import 'package:pr_pks_4/components/product_page.dart';
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
    final Product result = await Navigator.push(context,
      MaterialPageRoute(builder: (context) => const addProductPage()),
    );

    if (result != null){
      setState(() {
        products.add(result);
      });
    }
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
            return ItemProduct(products: products[index]);
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
