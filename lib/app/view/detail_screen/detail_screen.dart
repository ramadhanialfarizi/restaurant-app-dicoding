import 'package:flutter/material.dart';
import 'package:restaurant_app/app/model/restaurant_model.dart';
import 'package:restaurant_app/app/view/detail_screen/widget/drink_menu.dart';
import 'package:restaurant_app/app/view/detail_screen/widget/food_menu.dart'
    as food;

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final parameter =
        ModalRoute.of(context)!.settings.arguments as RestaurantModel;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
                child: Image.network('${parameter.pictureId}'),
              ),
              const SizedBox(
                height: 18,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${parameter.name}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 4,
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
                        Text('${parameter.city}'),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text('${parameter.rating}'),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'Description',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      '${parameter.description}',
                      style: const TextStyle(fontSize: 15),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'Menu',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: const [
                        Icon(Icons.food_bank),
                        SizedBox(
                          width: 6,
                        ),
                        Text('Makanan'),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    food.FoodMenu(menu: parameter.foodMenu),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: const [
                        Icon(Icons.local_drink),
                        SizedBox(
                          width: 6,
                        ),
                        Text('Minuman'),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    // nanti diganti
                    DrinkMenu(menu: parameter.drinkMenu),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
