import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imtihon_5_oylik/Pages/Page2.dart';
import 'package:imtihon_5_oylik/widgets/CarouselSlider.dart';
import 'package:imtihon_5_oylik/widgets/textfieldWidget.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class Food {
  final String name;
  final String image;
  final String price;
  final String rating;

  Food({
    required this.name,
    required this.image,
    required this.price,
    required this.rating,
  });
}

List<Food> foodsList = [
  Food(
      name: "Original Sushi",
      image: "img/china1.jpg",
      price: "26.00",
      rating: "4.8"),
  Food(
      name: "California Roll",
      image: "img/china2.jpg",
      price: "18.00",
      rating: "4.6"),
  Food(
      name: "Salmon Roll",
      image: "img/china3.jpg",
      price: "16.00",
      rating: "4.7"),
  Food(
      name: "Dragon Roll",
      image: "img/china4.jpg",
      price: "23.00",
      rating: "4.8"),
  Food(
      name: "Canada Roll",
      image: "img/china5.jpg",
      price: "29.00",
      rating: "4.1"),
  Food(
      name: "Korean Roll",
      image: "img/china6.jpg",
      price: "12.00",
      rating: "4.7"),
];

class _HomepageState extends State<Homepage> {
  final TextEditingController _searchController = TextEditingController();
  List<Food> filteredFoods = foodsList; // Filtered list

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterFoods); // Add listener
  }

  void _filterFoods() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      filteredFoods = foodsList.where((food) {
        return food.name.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose(); // Dispose controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage("img/road.png")),
            ),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.notifications_active_outlined,
              color: Colors.black,
              size: 26,
            ),
          ),
        ],
        centerTitle: true,
        title: Column(
          children: [
            const Text(
              "Location",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  CupertinoIcons.location_solid,
                  color: Colors.red,
                  size: 20,
                ),
                Text(
                  "Uzbekistan     ",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselExample(),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        CupertinoIcons.search,
                        color: Colors.black54,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      hintText: 'Search your food ...',
                      hintStyle:
                          TextStyle(color: Colors.grey.shade400, fontSize: 15),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Popular Food",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      const Text(
                        "View all",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    height: 300, // Adjust height for GridView
                    child: GridView.builder(
                      itemCount:
                          filteredFoods.length, // Length of filtered list
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        childAspectRatio: 0.80,
                      ),
                      itemBuilder: (context, index) {
                        return FoodTemplate(
                          context,
                          filteredFoods[index],
                        ); // Data from filtered list
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}

Widget FoodTemplate(BuildContext context, Food food) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Page2(s: food)),
      );
    },
    child: Container(
      height: 300,
      width: 130,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 70),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Icon(
                    Icons.star_rounded,
                    color: Colors.amber,
                    size: 20,
                  ),
                  Text(food.rating), // Display rating
                ],
              ),
            ),
            Container(
              width: 120,
              height: 80,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(food.image), // Food image
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              food.name, // Food name
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${food.price}", // Food price
                  style: const TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                  child: const Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.white,
                    size: 17,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
