import 'package:flutter/material.dart';
import 'package:recipe_finder/components/progress.dart';

class Ingredients extends StatefulWidget {

  const Ingredients({
    super.key,
    required this.data,
  });

  final List<dynamic> data;

  @override
  State<Ingredients> createState() => _IngredientsState();
}

class _IngredientsState extends State<Ingredients> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Ingredients:',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          widget.data.isEmpty ? const loading() :  SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: widget.data.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 250,
                    child: Card(
                      child: ListTile(
                        title: Text(
                            widget.data[index].name.toUpperCase(),
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        subtitle: Text(
                          '${widget.data[index].amount.us.value} - ${widget.data[index].amount.us.unit}',
                          style: const TextStyle(fontStyle: FontStyle.normal, ),
                        ),
                        onTap: () {
                          // Handle tap on list item
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


