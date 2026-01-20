import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products/Core/Shared/custom_text_field.dart';
import 'package:products/features/add_product/presentation/Cubits/add_product_cubit/add_product_cubit.dart';
import 'package:products/features/add_product/presentation/Cubits/add_product_cubit/add_product_states.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  final _imageUrlController = TextEditingController();
  final _stockController = TextEditingController();
  final _priceController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    _imageUrlController.dispose();
    _stockController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  void clearFields() {
    _titleController.clear();
    _descController.clear();
    _imageUrlController.clear();
    _stockController.clear();
    _priceController.clear();
  }

  void addProduct(BuildContext context) {
    if (_titleController.text.isEmpty ||
        _priceController.text.isEmpty ||
        _imageUrlController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all required fields')),
      );
      return;
    }

    context.read<AddProductCubit>().addProduct(
      name: _titleController.text,
      image: _imageUrlController.text,
      price: double.parse(_priceController.text),
      description: _descController.text,
      category: 'electronics',
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddProductCubit(),
      child: BlocListener<AddProductCubit, AddProductStates>(
        listener: (context, state) {
          if (state is AddProductSuccess) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
            clearFields();
            log('Product added successfully');
          } else if (state is AddProductFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Error: ${state.error}')));
            log('Error: ${state.error}');
          }
        },
        child: Scaffold(
          appBar: AppBar(title: const Text('Add Product'), centerTitle: true),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomTextField(
                  labelText: 'Title',
                  hintText: 'Enter title',
                  controller: _titleController,
                ),
                CustomTextField(
                  labelText: 'Description',
                  hintText: 'Enter description',
                  controller: _descController,
                  maxLines: 3,
                ),
                CustomTextField(
                  labelText: 'Image URL',
                  hintText: 'Enter image url',
                  controller: _imageUrlController,
                ),
                CustomTextField(
                  labelText: 'Stock',
                  hintText: 'Enter stock',
                  controller: _stockController,
                  keyboardType: TextInputType.number,
                ),
                CustomTextField(
                  labelText: 'Price',
                  hintText: 'Enter price',
                  controller: _priceController,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                ),
                const SizedBox(height: 16),
                BlocBuilder<AddProductCubit, AddProductStates>(
                  builder: (context, state) {
                    bool isLoading = state is AddProductLoading;
                    return ElevatedButton(
                      onPressed: isLoading ? null : () => addProduct(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0XFF4E0189),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: isLoading
                          ? const Padding(
                              padding: EdgeInsets.symmetric(vertical: 14.0),
                              child: SizedBox(
                                height: 24,
                                width: 24,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2.0,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.white,
                                  ),
                                ),
                              ),
                            )
                          : const Padding(
                              padding: EdgeInsets.symmetric(vertical: 14.0),
                              child: Text(
                                'Add Product',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
