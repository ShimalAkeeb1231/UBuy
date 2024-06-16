import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class AdidasShoeProductPage extends StatelessWidget {
  final String productName;

  const AdidasShoeProductPage({super.key, required this.productName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 60.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(0.0, 0.0, 31.0, 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(
                  color: Colors.grey[350],

                  borderRadius: BorderRadius.circular(20.0),
                  //border: Border.all(
                   // color: Colors.,
                  //),
                ),
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        style: TextStyle(color: Colors.black), // Text color
                        decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle: TextStyle(color: Colors.black), // Hint text color
                          contentPadding: EdgeInsets.all(10.0),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20.0),
            const SizedBox(height: 16.0),
            // Add space between AppBar and CarouselSlider
            CarouselSlider(
              options: CarouselOptions(
                height: 250.0,
                // Adjust the height of CarouselSlider
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                enableInfiniteScroll: false,
                viewportFraction: 0.8,
              ),
              items: [
                Container(
                  margin: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: const DecorationImage(
                      image: AssetImage('images/adidassoe.jpeg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: const DecorationImage(
                      image: AssetImage('images/shoe.jpeg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    '\$100.00',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const Row(
                    children: [
                      Text(
                        'Rating: ',
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      // Add your star rating widget here
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            _buildSection(
              'Description',
              'These adidas trainers are all clean lines and a smooth coated leather upper atop a skater-style Vulcanised outsole. Wear yours with crop pants or a floaty skirt. Either way, you will want to show off every angle. Lightweight cushioning and a soft lining keep the foot wrapped in comfort right through the \n',
             // backgroundColor: Colors.blueGrey[200], // Background color

            ),
            const SizedBox(height: 16.0), // Add a gap between sections

            _buildSectionWithBulletPoints(
              'Highlights',
              [
                'Lorem ipsum dolor sit amet.',
                'Feature 2: Consectetur adipiscing elit.',
                'Feature 3: Sed do eiusmod tempor .\n\n',
              ],
             // backgroundColor: Colors.blueGrey[200], // Background color
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration:  BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(0.0),
            topRight: Radius.circular(0.0),
          ),
          color: Colors.blueGrey[200],
          border: const Border(
            top: BorderSide(
              color: Colors.blueGrey, // Border color// Border color
              width: 2.0, // Border width
            ),
          ),
        ),
        height: 55.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: const Icon(Icons.chat),
              onPressed: () {
                // Handle chat functionality
              },
              color: Colors.black,
            ),
            ElevatedButton(
              onPressed: () {
                // Handle Buy Now functionality
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text(
                'Buy Now',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle Add to Cart functionality
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: const Text(
                'Add to Cart',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),

    );
  }

  Widget _buildSection(String title, String content) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0)

        ),
        color: Colors.grey[600], // Background color for the section
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16.0),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            content,
            style: const TextStyle(
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionWithBulletPoints(String title, List<String> points) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0)
        ),
        color: Colors.grey[600], // Background color for the section
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16.0),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          // Use Column for bullet points
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: points.map((point) {
              return Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 4.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(width: 10.0), // Adjusted width for indentation
                    const Text(
                      '• ',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        point,
                        style: const TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

}
