import 'package:flutter/material.dart';

class FoodMenu extends StatefulWidget {
  const FoodMenu({super.key});

  @override
  State<FoodMenu> createState() => _FoodMenuState();
}

class _FoodMenuState extends State<FoodMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: double.infinity,
      child: ListView.builder(
        //physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 7,
        itemBuilder: (context, index) {
          return cardMenu();
        },
      ),
    );
  }

  Widget cardMenu() {
    return SizedBox(
      // width: 200,
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        //clipBehavior: Clip.antiAlias,
        color: Color.fromARGB(255, 255, 197, 97),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/food_image.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Makanan 1 aaaaa',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    const Text('IDR 5.000')
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
