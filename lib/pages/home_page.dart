import 'package:flutter/material.dart';
import 'package:projeto/app/components/item_card.dart';
import 'package:projeto/providers/item_list.dart';
import 'package:provider/provider.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getItems();
  }

  Future<void> getItems() async {
    try {
      await Provider.of<ItemList>(context, listen: false).getItems();
    } catch (exception) {
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
    }
  }

  @override
  Widget build(BuildContext context) {
    final itemList = Provider.of<ItemList>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Produtos"),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
        padding:  const EdgeInsets.all(10),
        itemCount: itemList.items.length,
        itemBuilder: (context, index) =>  ItemCard(item : itemList.items[index]),
      ),
    );
  }
}
