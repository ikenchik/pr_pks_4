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


  void removeProduct(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.amberAccent,
          title: const Text('Подтверждение удаления'),
          content: const Text('Вы уверены, что хотите удалить этот товар?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Отмена',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Удалить',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                setState(() {
                  products.removeAt(index);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Добавленные товары",
          style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: products.isEmpty
          ? const Center(child: Text("Нет добавленных товаров"),)
          : ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index){
            return ItemProduct(products: products[index], index: index, removeProduct: removeProduct,);
          }
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amberAccent,
        onPressed: () => navigateToAddProductPage(context),
        child: Icon(Icons.add_box_rounded),
        tooltip: "Добавить товар",
      ),
    );
  }
}
