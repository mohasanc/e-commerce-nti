import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:products/features/Add_Product/Data/Models/products.dart';
import 'package:products/features/Home/Presentation/Screens/details_product_screen.dart';

class CustomProductItems extends StatefulWidget {
  const CustomProductItems({super.key, required this.product});
  final Product product;

  @override
  State<CustomProductItems> createState() => _CustomProductItemsState();
}

class _CustomProductItemsState extends State<CustomProductItems> {
  bool isFav = false;
  Dio dio = Dio();

  Future<void> deleteProduct({required int id}) async {
    try {
      Response response = await dio.delete(
        'https://dummyjson.com/products/$id',
      );
      log('Product deleted: ${response.data}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${widget.product.name} deleted successfully')),
      );
    } on DioException catch (e) {
      String errorMessage = e.response?.data ?? e.message.toString();
      log('Error deleting product: ${errorMessage.toString()}');
    } catch (e) {
      log('Error deleting product: ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsProductScreen(product: widget.product),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 235, 235, 235),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: 155,
                  height: 134,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    image: DecorationImage(
                      image: widget.product.image.startsWith('http')
                          ? NetworkImage(widget.product.image)
                          : AssetImage(widget.product.image) as ImageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: IconButton(
                      color: Colors.white,
                      onPressed: () {
                        setState(() => isFav = !isFav);
                      },
                      icon: Icon(
                        isFav ? Icons.favorite_border : Icons.favorite,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.product.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          '\$${widget.product.price}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff6055D8),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Delete Product'),
                          content: Text(
                            'Are you sure you want to delete this product?',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () async {
                                Navigator.of(context).pop();
                                await deleteProduct(id: widget.product.id ?? 1);
                              },
                              child: Text(
                                'Delete',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    icon: const Icon(Icons.delete),
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
