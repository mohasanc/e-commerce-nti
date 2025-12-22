import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:products/models/validators.dart';
import 'package:products/screens/login_screen.dart';
import 'package:products/widgets/custom_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isActive = false;
  bool? isCheckBoxActive = false;
  GlobalKey<FormState> key = GlobalKey();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    passwordController.dispose();
  }

  Dio dio = Dio();
  Future<void> signUp() async {
    try {
      Response response = await dio.post(
        'https://accessories-eshop.runasp.net/api/auth/register',
        data: {
          'firstName': firstNameController.text,
          'lastName': lastNameController.text,
          'email': emailController.text,
          'password': passwordController.text,
        },
      );
      log('Response: ${response.data}');
    } on DioException catch (e) {
      String errorMessage = e.response?.data.toString() ?? e.message.toString();
      log('Error: $errorMessage');
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(27, 40, 28, 0),
          child: SingleChildScrollView(
            child: Form(
              key: key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Create an account',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Connect with your friends today!',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff999EA1),
                    ),
                  ),

                  SizedBox(height: 50),
                  CustomTextField(
                    labelText: "First Name",
                    hintText: "Please enter your first name",
                    controller: firstNameController,
                    validator: (value) {
                      return Validator.validateUserName(value!);
                    },
                  ),
                  SizedBox(height: 10),
                  CustomTextField(
                    labelText: "Last Name",
                    hintText: "Please enter your last name",
                    controller: lastNameController,
                    validator: (value) {
                      return Validator.validateUserName(value!);
                    },
                  ),
                  SizedBox(height: 10),
                  CustomTextField(
                    labelText: "Email",
                    hintText: "Please enter your email",
                    controller: emailController,
                    validator: (value) {
                      return Validator.validateEmail(value!);
                    },
                  ),

                  SizedBox(height: 10),

                  CustomTextField(
                    labelText: "Password",
                    hintText: "Please enter your password",
                    obscureText: isActive,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isActive = !isActive;
                        });
                      },
                      icon: Icon(
                        isActive ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                    controller: passwordController,
                    validator: (value) {
                      return Validator.validatePassword(value!);
                    },
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: isCheckBoxActive,
                        onChanged: (newValue) {
                          setState(() {
                            isCheckBoxActive = newValue;
                          });
                          log(isCheckBoxActive.toString());
                        },
                      ),
                      Text(
                        'Remember Me',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot Password',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff4E0189),
                      minimumSize: Size(double.infinity, 45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(10),
                      ),
                    ),
                    onPressed: () {
                      if (key.currentState!.validate()) {
                        log('First Name : ${firstNameController.text}');
                        log('Last Name : ${lastNameController.text}');
                        log('Email : ${emailController.text}');
                        log('Password : ${passwordController.text}');
                        signUp();
                        // Navigator.of(context).pushNamed('/products_screen');
                      }

                      // Navigator.of(context).pushReplacement(
                      //   MaterialPageRoute(
                      //     builder: (context) {
                      //       return ProductsScreen();
                      //     },
                      //   ),
                      // );
                    },
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(child: Divider(thickness: 2)),
                      Text(
                        '  Or With  ',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                        ),
                      ),
                      Expanded(child: Divider(thickness: 2)),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(10),
                              side: BorderSide(color: Colors.grey),
                            ),
                          ),
                          label: Text(
                            'Githhub',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          icon: SvgPicture.asset('assets/icons/github.svg'),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(10),
                              side: BorderSide(color: Colors.grey),
                            ),
                          ),
                          label: Text(
                            'Githlab',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          icon: SvgPicture.asset('assets/icons/gitlab.svg'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account ?',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff999EA1),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) {
                                return LoginScreen();
                              },
                            ),
                          );
                        },
                        child: Text('Login'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
