import 'package:flutter/material.dart';
import 'package:mobiletesting/home_screen/home_view_model.dart';
import 'package:mobiletesting/home_screen/image_carousel_view.dart';
import 'package:mobiletesting/profile_screen/profile_screen.dart';
import 'package:mobiletesting/home_screen/user_profile_view.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<HomeViewModel>(context, listen: false).onDidLoad();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Key("home_screen"),
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        children: [
          // Header
          Consumer<HomeViewModel>(builder: (context, viewModel, child) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //User profile

                  UserProfileView(
                    userDetails: viewModel.userDetails,
                  ),
                  const SizedBox(height: 50),
                  const SizedBox(height: 150),
                  //News Section Header
                  newsheader(),
                  ImageCarousel(),
                ]);
          }),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              // Handle Home button press
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Handle Search button press
            },
          ),
          Consumer<HomeViewModel>(builder: (context, viewModel, child) {
            return IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ProfileScreen(userDetails: viewModel.userDetails)),
                );
              },
            );
          }),
        ]),
      ),
    );
  }

// News section header
  Widget newsheader() {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Text(
        'Latest News',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
