import 'package:flutter/material.dart';

import '../../model/item.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.item});

  final Item item;

  @override
  Widget build(BuildContext context) {
    final avaibleHeight = (MediaQuery.of(context).size.width - 30) / 2;

    return Card(
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                width: avaibleHeight,
                height: avaibleHeight * 0.8,
                child: Image.network(
                  item.urlImage,
                  fit: BoxFit.fitHeight,
                  errorBuilder: (context, error, stackTrace) => const Center(
                    child: Text("Imagem não encontrada"),
                  ),
                ),
              ),
              Text(item.name),
            ],
          ),
          Card(
              margin: const EdgeInsets.all(5),
              color: Colors.green,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(item.quantify.toString()),
              ))
        ],
      ),
    );
  }
}
