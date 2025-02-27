
import 'package:flutter/material.dart';
import 'package:recipe_finder/models/getRecipe.dart';
import 'package:recipe_finder/network/apiCall.dart';
import 'package:recipe_finder/utilities/constants.dart';
import 'package:recipe_finder/views/detailedView.dart';

import '../navigation_controller.dart';
// import 'package:connectivity/connectivity.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TextEditingController _searchController = TextEditingController();
  List<GetRecipe> recipe = [];
  late String searchText;

  bool isLoading = false;
  String? errorMessage;

  apicall ap = apicall();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> getData(String url) async {

    setState(() {
      isLoading = true;
      errorMessage = null;
    });


    try {
      var response = await ap.getData(url);
      setState(() {
        recipe = getRecipeFromJson(response);
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        errorMessage = 'Error fetching data';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipe Finder'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Enter ingredients',
                helperText: "E.g Banana, Apple, Egg, Bread etc",
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    searchText = _searchController.text;
                    var url = '$findByIngredients?ingredients=$searchText&apiKey=$apiKey';
                    getData(url);
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              ),
            ),
            const SizedBox(height: 16.0),
            if (isLoading)
              const CircularProgressIndicator()
            else if (errorMessage != null)
              Text(errorMessage!)
            else
              Expanded(
                child: recipe.isEmpty
                    ? const Center(child: Text('Nothing to show.'))
                    : ListView.builder(
                  itemCount: recipe.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => detailedView(
                              recipeID: recipe[index].id,
                              ImgUrl: recipe[index].image,
                              title: recipe[index].title,
                            ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10),
                        child: Card(
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  height: 150,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        recipe[index].image,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius:
                                    const BorderRadius.only(
                                        topLeft:
                                        Radius.circular(10),
                                        topRight:
                                        Radius.circular(10)),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  '${recipe[index].title.toUpperCase()}.',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
