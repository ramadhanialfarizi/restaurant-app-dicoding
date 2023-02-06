import 'package:flutter/material.dart';

class DrinkMenu extends StatefulWidget {
  DrinkMenu({super.key, required this.menu});

  String? menu;

  @override
  State<DrinkMenu> createState() => _DrinkMenuState();
}

class _DrinkMenuState extends State<DrinkMenu> {
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
        clipBehavior: Clip.antiAlias,
        color: Color.fromARGB(255, 255, 197, 97),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/drink.jpg',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.menu}',
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
