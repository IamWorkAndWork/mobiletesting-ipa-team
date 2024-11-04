import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  final String imageURL;

  NewsScreen({required this.imageURL});

  // List of news images
  final List<String> newsImages = [
    'https://via.placeholder.com/600x400.png?text=News+1',
    'https://via.placeholder.com/600x400.png?text=News+2',
    'https://via.placeholder.com/600x400.png?text=News+3',
    'https://via.placeholder.com/600x400.png?text=News+4',
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                  height: 150.0, // Set the height of the carousel
                  width: 70.0,
                  child: PageView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Container(
                          margin: EdgeInsets.symmetric(horizontal: 8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0), // Adjust radius here
                            child: Image.network(
                              imageURL,
                              fit: BoxFit.cover,
                              width: double.infinity, // Stretch image to fill width
                            ),
                          ),
                        );
                    }
                  ),
                ),
          ]
        ),
      ),
    );
  }
}
