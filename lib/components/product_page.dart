import 'package:flutter/material.dart';
import 'package:pr_pks_4/models/product.dart';
import 'package:pr_pks_4/pages/home_page.dart';

class ItemProduct extends StatefulWidget {
  final Product products;

  const ItemProduct({super.key, required this.products});


  @override
  State<ItemProduct> createState() => _ItemProductState();
}

class _ItemProductState extends State<ItemProduct> {

  void _removeProduct(int index){
    setState(() {
      products.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),
      color: const Color.fromARGB(234, 213, 208, 208),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: Text(
              widget.products.productTitle
            ),
          ),
          Center(child: Image.network(widget.products.productImage),),
          Center(child: Text('${widget.products.productPrice}'),),
          Center(child: Text(widget.products.productAbout),),
          Center(child: Text(widget.products.productSpecifications),),
        ],
      ),
    );
  }
}
