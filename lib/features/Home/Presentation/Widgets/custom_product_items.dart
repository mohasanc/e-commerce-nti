import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products/features/add_product/data/models/products.dart';
import 'package:products/features/home/Presentation/Screens/details_product_screen.dart';
import 'package:products/features/home/presentation/Cubits/products_cubit/products_cubit.dart';

class CustomProductItems extends StatefulWidget {
  const CustomProductItems({super.key, required this.product});
  final Product product;

  @override
  State<CustomProductItems> createState() => _CustomProductItemsState();
}

class _CustomProductItemsState extends State<CustomProductItems> {
  bool isFav = false;

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
                        builder: (ctxt) => AlertDialog(
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
                                await BlocProvider.of<ProductsCubit>(
                                  context,
                                ).deleteProduct(id: widget.product.id!);
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
