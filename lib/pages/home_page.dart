import 'package:coffee_ui/utility/coffee_tile.dart';
import 'package:coffee_ui/utility/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List coffeeType = [
    ['Cappucino', false],
    ['Latte', false],
    ['Black', false],
    ['Tea', false],
  ];
  //coffee type selected
  void coffeeTypeSelected(int index) {
    setState(() {
      for (var i = 0; i < coffeeType.length; i++) {
        coffeeType[i][1] = false;
      }
      coffeeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: Image.asset(
                'lib/images/bg.jpg',
                scale: 1,
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
        ],
      ),
      body: Column(
        children: [
          //Find the best coffee for you
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              'Find the best coffee for you',
              style: GoogleFonts.bebasNeue(fontSize: 60),
            ),
          ),

          const SizedBox(
            height: 25,
          ),

          // Search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Find you coffee..',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade600,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
            ),
          ),

          //list of coffee tiles  horizontally

          const SizedBox(
            height: 25,
          ),

          //horizontal ListView
          Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: coffeeType.length,
              itemBuilder: (context, index) {
                return CoffeeType(
                    coffeeType: coffeeType[index][0],
                    isSelected: coffeeType[index][1],
                    onTap: () {
                      coffeeTypeSelected(index);
                    });
              },
            ),
          ),

          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CoffeeTile(
                  coffeeImagePath: 'lib/images/coffee.jpg',
                  coffeeName: 'Latte',
                  coffeePrice: '4.80',
                ),
                CoffeeTile(
                  coffeeImagePath: 'lib/images/latte.jpg',
                  coffeeName: 'Cappucino',
                  coffeePrice: '3.80',
                ),
                CoffeeTile(
                  coffeeImagePath: 'lib/images/coffee.jpg',
                  coffeeName: 'Black',
                  coffeePrice: '2.80',
                ),
              ],
            ),
          ),

          //
        ],
      ),
    );
  }
}
