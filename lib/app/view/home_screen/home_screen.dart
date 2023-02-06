import 'package:flutter/material.dart';
import 'package:restaurant_app/app/model/data_source/remote_data_source.dart';
import 'package:restaurant_app/core/global_widget/empty_data.dart';

import '../../model/restaurant_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  RemoteDataSource source = RemoteDataSource();

  Future refresh() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Home'),
      //   centerTitle: false,
      // ),
      body: RefreshIndicator(
        onRefresh: refresh,
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Restaurant',
                    style: TextStyle(fontSize: 30),
                  ),
                  const Text(
                    'Recomendation restaurant for you',
                    style: TextStyle(fontSize: 12),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FutureBuilder(
                    future: source.getAllRestaurant(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return const EmptyData();
                      } else if (snapshot.hasData) {
                        var items = snapshot.data as List<RestaurantModel>;
                        return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            var images = items[index].pictureId;
                            var name = items[index].name;
                            var location = items[index].city;
                            var rating = items[index].rating.toString();
                            var description = items[index].description;
                            var foodMenu = items[index].foodMenu;
                            var drinkMenu = items[index].drinkMenu;
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                  '/detail',
                                  arguments: RestaurantModel(
                                    pictureId: images,
                                    name: name,
                                    city: location,
                                    rating: rating,
                                    description: description,
                                    foodMenu: foodMenu,
                                    drinkMenu: drinkMenu,
                                  ),
                                );
                              },
                              child: Card(
                                elevation: 0,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        child: Image.network(
                                          images ?? 'images',
                                          scale: 3.9,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              name ?? 'Restaurant',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.location_pin,
                                                  color: Colors.blue,
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Text(location ?? 'Jakarta'),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                const Icon(Icons.star,
                                                    color: Colors.amber),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  rating,
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
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
