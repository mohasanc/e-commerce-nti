import 'package:flutter/material.dart';
import 'package:products/screens/details_product_screen.dart';

class CustomProductItems extends StatefulWidget {
  const CustomProductItems({
    super.key,
    required this.title,
    required this.image,
    required this.price,
  });
  final String title;
  final String image;
  final String price;

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
            builder: (context) => DetailsProductScreen(
              title: widget.title,
              image: widget.image,
              price: widget.price,
            ),
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
                      image: widget.image.startsWith('http')
                          ? NetworkImage(widget.image)
                          : AssetImage(widget.image) as ImageProvider,
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
                          widget.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          '${widget.price} EGP',
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
                    onPressed: () {},
                    icon: const Icon(Icons.add_circle),
                    color: const Color(0xff6055D8),
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
