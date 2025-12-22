import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:products/Core/Shared/custom_text_field.dart';

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

  bool isLoading = false;
  Dio dio = Dio();
  Future<void> addProduct() async {
    setState(() {
      isLoading = true;
    });
    try {
      Response response = await dio.post(
        'https://dummyjson.com/products/add',
        data: {
          'title': _titleController.text,
          'description': _descController.text,
          'image': _imageUrlController.text,
          'stock': int.parse(_stockController.text),
          'price': double.parse(_priceController.text),
        },
      );
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Product added successfully!')));
      log('Product added: ${response.data}');
      clearFields();
    } on DioException catch (e) {
      String errorMessage = e.response?.data ?? e.message.toString();
      log('Error: $errorMessage');
      isLoading = false;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: $errorMessage')));
    } catch (e) {
      log('Error: ${e.toString()}');
      isLoading = false;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: ${e.toString()}')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Product'), centerTitle: true),
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
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                addProduct();
                //Navigator.of(context).pushNamed('/products_screen');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0XFF4E0189),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: isLoading
                  ? Center(child: CircularProgressIndicator())
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
            ),
          ],
        ),
      ),
    );
  }
}
