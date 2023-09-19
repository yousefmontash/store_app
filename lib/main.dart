import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:strore_app/mtObserver.dart';
import 'package:strore_app/pages/cubits/product_page_cubit/product_page_cubit.dart';
import 'package:strore_app/pages/cubits/products_cubit/products_cubit.dart';
import 'package:strore_app/pages/home_page.dart';
import 'package:strore_app/pages/update_product_page.dart';

void main() {
  runApp(StoreApp());
  Bloc.observer = MyObserver();
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductsCubit(),
        ),
        BlocProvider(
          create: (context) => ProductPageCubit(),
        ),
      ],
      child: MaterialApp(
        routes: {
          HomePage.id: (context) => HomePage(),
          UpdateProductPage.id: (context) => UpdateProductPage(),
        },
        debugShowCheckedModeBanner: false,
        initialRoute: HomePage.id,
      ),
    );
  }
}
