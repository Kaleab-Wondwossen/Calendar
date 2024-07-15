// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

class MyCarouselSlider extends StatefulWidget {
  const MyCarouselSlider({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyCarouselSliderState createState() => _MyCarouselSliderState();
}

class _MyCarouselSliderState extends State<MyCarouselSlider> {
  final _controller = PageController();
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Start auto sliding images every 3 seconds
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < 2) {
        _controller.animateToPage(_currentPage + 1,
            duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
      } else {
        _controller.animateToPage(0,
            duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer when widget is disposed
    _controller.dispose();
    super.dispose();
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 250,
          width: 450,
          child: PageView(
            controller: _controller,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: [
              _buildImageWithButton(
                imagePath: "images/img1.jpg",
                url: "https://example1.com",
              ),
              _buildImageWithButton(
                imagePath: "images/img2.png",
                url: "https://example2.com",
              ),
              _buildImageWithButton(
                imagePath: "images/img3.jpg",
                url: "https://example3.com",
              ),
            ],
          ),
        ),
        SmoothPageIndicator(
          controller: _controller,
          count: 3,
          effect: const ExpandingDotsEffect(
            activeDotColor: Color.fromARGB(255, 233, 176, 64),
            dotColor: Color.fromARGB(255, 245, 222, 174),
            dotWidth: 15,
            dotHeight: 15,
            spacing: 15,
          ),
        ),
      ],
    );
  }

  Widget _buildImageWithButton({required String imagePath, required String url}) {
  return GestureDetector(
    onTap: () => _launchURL(url),
    child: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40.0),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover, // Add this line to ensure the image fits perfectly
              width: double.infinity,
              height: double.infinity,
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: ElevatedButton(
            onPressed: () => _launchURL(url),
            child: const Text('Learn More'),
          ),
        ),
      ],
    ),
  );
}
}