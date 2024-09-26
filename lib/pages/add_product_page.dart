import 'package:flutter/material.dart';
import 'package:pr_pks_4/models/product.dart';

class addProductPage extends StatefulWidget {
  const addProductPage({super.key});

  @override
  State<addProductPage> createState() => _addProductPageState();
}

class _addProductPageState extends State<addProductPage> {
  final TextEditingController productTitleController = TextEditingController();
  final TextEditingController productImageController = TextEditingController();
  final TextEditingController productPriceController = TextEditingController();
  final TextEditingController productAboutController = TextEditingController();
  final TextEditingController productSpecificationController = TextEditingController();

  void createProduct() {
    String productTitle = productTitleController.text;
    String productImage = productImageController.text;
    int productPrice = int.tryParse(productPriceController.text) ?? 0;
    String productAbout = productAboutController.text;
    String productSpecifications = productSpecificationController.text;
    
    if (productTitle.isNotEmpty && productImage.isNotEmpty && productPrice > 0 &&
        productAbout.isNotEmpty && productSpecifications.isNotEmpty){
      Product product = Product(productTitle: productTitle, productImage: productImage,
          productAbout: productAbout, productPrice: productPrice,
          productSpecifications: productSpecifications);
      Navigator.pop(context, product);
    }
  }

  @override
  void dispose() {
    productTitleController.dispose();
    productImageController.dispose();
    productPriceController.dispose();
    productAboutController.dispose();
    productSpecificationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Добавление товара"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: productTitleController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  hintText: "Введите название товара",
                  labelText: "Название",
                ),
                maxLines: 1,
              ),
              SizedBox(height: 16),
              TextField(
                controller: productImageController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  hintText: "Введите ссылку на изображение",
                  labelText: "Ссылка",
                ),
                maxLines: 1,
              ),
              SizedBox(height: 16),
              TextField(
                controller: productPriceController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  hintText: "Введите стоимость товара",
                  labelText: "Стоимость",
                ),
                maxLines: 1,
              ),
              SizedBox(height: 16),
              TextField(
                controller: productAboutController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  hintText: "Введите описание товара",
                  labelText: "Описание",
                ),
                maxLines: 7,
              ),
              SizedBox(height: 16),
              TextField(
                controller: productSpecificationController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  hintText: "Введите характеристики товара",
                  labelText: "Характеристики",
                ),
                maxLines: 7,
              ),
              SizedBox(height: 16),
        
              //кнопка перехода к методу создания экземпляра класса Product
              ElevatedButton(
                onPressed: createProduct,
                child: Text("Добавить товар",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amberAccent,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  minimumSize: const Size(300, 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
