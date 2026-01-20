import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:products/features/Auth/Data/models/validators.dart';
import 'package:products/features/Auth/presentation/Screens/sign_up_screen.dart';
import 'package:products/Core/Shared/custom_text_field.dart';
import 'package:products/features/Auth/presentation/cubits/auth_cubit.dart';
import 'package:products/features/Auth/presentation/cubits/auth_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isCheckBoxActive = false;
  bool isActive = false;
  GlobalKey<FormState> key = GlobalKey();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hi, Wecome Back! 👋",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Hello again, you’ve been missed!",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 40),
                  CustomTextField(
                    labelText: "Email",
                    hintText: "Please enter your email",
                    controller: emailController,
                    validator: (value) {
                      return Validator.validateEmail(value!);
                    },
                  ),
                  SizedBox(height: 16),
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
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: isCheckBoxActive,
                        onChanged: (newValue) {
                          setState(() {
                            isCheckBoxActive = newValue!;
                          });
                          log(isCheckBoxActive.toString());
                        },
                      ),
                      Text(
                        "Remember Me",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forgot Password",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(251, 52, 79, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),

                  BlocListener<LoginCubit, AuthState>(
                    listener: (context, state) {
                      if (state is LogingLoading) {
                        Fluttertoast.showToast(
                          msg: "Logging in...",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.grey,
                          textColor: Colors.white,
                        );
                      } else if (state is LoginSuccess) {
                        Fluttertoast.showToast(
                          msg: "Login Successful!",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                        );
                        Navigator.of(
                          context,
                        ).pushNamed('/main_screen');
                      } else if (state is LoginFailure) {
                        Fluttertoast.showToast(
                          msg: state.message,
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                        );
                      }
                    },
                    child: SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff4E0189),
                          minimumSize: Size(double.infinity, 45),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(10),
                          ),
                        ),
                        onPressed: () {
                          if (key.currentState!.validate()) {
                            //login();
                            log('Email : ${emailController.text}');
                            log('Password : ${passwordController.text}');
                            // BlocProvider.of<LoginCubit>(context).login(
                            //   emailController: emailController.text,
                            //   passwordController: passwordController.text,
                            // );
                          }
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(thickness: .5, color: Colors.black),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Or With",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(thickness: .5, color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
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
                  SizedBox(height: 70),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t have an account ? ",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) {
                                return SignUpScreen();
                              },
                            ),
                          );
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(78, 1, 137, 1),
                          ),
                        ),
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
