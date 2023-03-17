import 'package:flutter/material.dart';
import 'package:projeto/app/app_routes.dart';
import 'package:projeto/pages/home_page.dart';
import 'package:projeto/providers/item_list.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ItemList(),
        child: MaterialApp(
            routes: {AppRoutes.home: (context) => const HomePage()}));
  }
}
