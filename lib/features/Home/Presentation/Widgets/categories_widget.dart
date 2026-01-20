import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products/features/home/Presentation/Screens/filter_products_by_category_screen.dart';
import 'package:products/features/home/presentation/Cubits/filter_products_cubit/filter_products_cubit.dart';

class CategoriesWidget extends StatelessWidget {
  final List<dynamic> categories;

  const CategoriesWidget({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider(create: (context) => FilterProductsCubit(),
                        child: FilterProductsByCategory(
                          categoryName: categories[index]['name'],
                        ),
                      ),
                    ),
                  );
                },
                child: Container(
                  width: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xff6055D8)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        '${categories[index]['name']}',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
