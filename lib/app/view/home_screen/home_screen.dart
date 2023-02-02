import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Home'),
      //   centerTitle: false,
      // ),
      body: SingleChildScrollView(
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
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: 10,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return restaurantCard();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget restaurantCard() {
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
                child: Image.asset(
                  'assets/images/restaurant.jpeg',
                  scale: 3.9,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Restaurant 1',
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
                      Text('St. Somewhare on earth'),
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
                      Text('4.6'),
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
