import 'package:flutter/material.dart';
import 'package:recipe_finder/components/Ingredients.dart';
import 'package:recipe_finder/components/Nutrients.dart';
import 'package:recipe_finder/controller/appLogic.dart';

import '../components/Instructions.dart';

class detailedView extends StatefulWidget {
  final int recipeID;
  final String title;
  final String ImgUrl;

  const detailedView(
      {required this.recipeID, required this.ImgUrl, required this.title});

  @override
  State<detailedView> createState() => _detailedViewState();
}

class _detailedViewState extends State<detailedView> {

  final AppLogic _appLogic = AppLogic();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    await _appLogic.getIngredients(widget.recipeID);
    await _appLogic.getInstructions(widget.recipeID);
    await _appLogic.getNutrients(widget.recipeID);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Screeen"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    widget.ImgUrl, // Placeholder image URL
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              widget.title, // Example recipe title
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Prep Time: 30 mins | Cook Time: 45 mins', // Example time information
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  optionButton(
                    btnName: 'Instructions',
                    onPress: () {
                      print("object");
                      setState(() {
                        // data = getAnalyzedInstructions;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  optionButton(
                    btnName: 'Ingredients',
                    onPress: () {
                      print("object");
                      setState(() {
                        // data = ind;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  optionButton(
                    btnName: 'Nutritions',
                    onPress: () {
                      print("object");
                      setState(() {
                        // data = nutrients;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            Ingredients(data: _appLogic.ingredients),

            const SizedBox(height: 16.0),
            Nutrients(data: _appLogic.nutrients),

            const SizedBox(height: 16.0),
            Instructions(data: _appLogic.analyzedInstructions),

            const SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }
}

class optionButton extends StatelessWidget {
  String btnName;
  Function() onPress;

  optionButton({required this.btnName, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      child: Text(
        btnName,
        style: const TextStyle(color: Colors.black54),
      ),
      style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
    );
  }
}
