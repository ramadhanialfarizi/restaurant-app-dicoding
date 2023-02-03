import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/app/viewModel/restaurant_provider.dart';
import 'package:restaurant_app/core/global_widget/empty_data.dart';
import 'package:restaurant_app/core/global_widget/load.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          physics: ScrollPhysics(),
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
                  Consumer<RestaurantProvider>(
                    builder: (BuildContext context, restaurant, Widget? _) {
                      final isLoading =
                          restaurant.state == RestaurantState.loading;
                      final isError = restaurant.state == RestaurantState.error;

                      if (isLoading) {
                        return const Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Color.fromARGB(194, 249, 7, 108),
                          ),
                        );
                      }
                      if (isError) {
                        return const EmptyData();
                      } else {
                        return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: restaurant.restaurantList.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            var resName = restaurant.restaurantList[index].name;
                            var resDescription =
                                restaurant.restaurantList[index].description;
                            var resPicture =
                                restaurant.restaurantList[index].pictureId;
                            var resCity = restaurant.restaurantList[index].city;
                            var resRating = restaurant
                                .restaurantList[index].rating
                                .toString();
                            return restaurantCard(
                              resName,
                              resDescription,
                              resPicture,
                              resCity,
                              resRating,
                            );
                          },
                        );
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

  Widget restaurantCard(
    String? name,
    String? description,
    String? picture,
    String? city,
    String? rating,
  ) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('/detail');
      },
      child: Card(
        elevation: 0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.network(
                  picture ?? 'empty',
                  scale: 3.9,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name ?? 'empty',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_pin,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(city ?? 'empty'),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber),
                      SizedBox(
                        width: 5,
                      ),
                      Text(rating ?? 'empty'),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
