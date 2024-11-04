// Image Carousel
import 'package:flutter/material.dart';
import 'package:mobiletesting/news_screen/news_screen.dart';

class ImageCarousel extends StatelessWidget {
  // List of news images
  final List<String> newsImages = [
    // 'https://via.placeholder.com/600x400.png?text=News+1',
    // 'https://via.placeholder.com/600x400.png?text=News+2',
    // 'https://via.placeholder.com/600x400.png?text=News+3',
    // 'https://via.placeholder.com/600x400.png?text=News+4',
  ];

  ImageCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.0, // Set the height of the carousel
      width: 70.0,
      child: PageView.builder(
        itemCount: newsImages.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Navigate to the DetailsPage
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewsScreen(imageURL: newsImages[index]),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0), // Adjust radius here
                child: Image.network(
                  newsImages[index],
                  fit: BoxFit.cover,
                  width: double.infinity, // Stretch image to fill width
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// Background gradient container

