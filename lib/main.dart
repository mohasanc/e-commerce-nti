import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products/Core/theme/app_theme_cubit.dart';
import 'package:products/Core/theme/app_theme_data.dart';
import 'package:products/features/Auth/presentation/cubits/auth_cubit.dart';
import 'package:products/features/add_product/presentation/screens/add_product_screen.dart';
import 'package:products/features/profile/Presentation/Screens/edit_profile_screen.dart';
import 'package:products/features/auth/Presentation/Screens/login_screen.dart';
import 'package:products/features/home/Presentation/Screens/products_screen.dart';
import 'package:products/features/auth/Presentation/Screens/sign_up_screen.dart';
import 'package:products/features/profile/Presentation/Screens/myProfile_screen.dart';
import 'package:products/features/main/presentation/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppThemeCubit(),
      child: BlocBuilder<AppThemeCubit, ThemeMode>(
        builder: (context, state) {
          return MaterialApp(
            theme: AppThemeData.lightMode,
            darkTheme: AppThemeData.darkMode,
            themeMode: state,

            routes: {
              '/products_screen': (context) => ProductsScreen(),
              //(context) => MultiBlocProvider(
              //   providers: [
              //     BlocProvider(create: (context) => ProductsCubit()),
              //     BlocProvider(create: (context) => CategoriesCubit()),
              //   ],
              //   child: ProductsScreen(),
              // ),
              '/add_product': (context) => AddProductScreen(),
              '/sign_up_screen': (context) => SignUpScreen(),
              '/login_screen': (context) => BlocProvider(
                create: (context) => LoginCubit(),
                child: LoginScreen(),
              ),
              '/edit_profile': (context) => EditProfile(),
              '/my_profile': (context) => ProfileCard(),
              '/main_screen': (context) => MainView(),
            },
            initialRoute: '/main_screen',
            title: 'E-commerce',
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
