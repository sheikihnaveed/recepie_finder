import 'package:flutter/material.dart';
import 'package:recipe_finder/models/getAnalyzedInstructions.dart';


class Instructions extends StatefulWidget {

  const Instructions({
    super.key,
    required this.data,
  });

  final List<GetAnalyzedInstructions> data;

  @override
  State<Instructions> createState() => _InstructionsState();
}

class _InstructionsState extends State<Instructions> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Instruction to Prepare:',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        widget.data.isEmpty ? const Center(child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("Currently no Instruction found"),
        ),) : ListView.builder(
          // scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: widget.data[0].steps.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: Card(
                  child: ListTile(
                    title: Text(
                      'Step - ${widget.data[0].steps[index].number.toString()}',
                      style:
                      const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    subtitle: Text(
                      widget.data[0].steps[index].step,
                      style: const TextStyle(
                        fontStyle: FontStyle.normal,
                      ),
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
      ],
    );
  }
}

