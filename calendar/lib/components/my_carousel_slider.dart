import 'dart:async';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MyCarouselSlider extends StatefulWidget {
  MyCarouselSlider({Key? key}) : super(key: key);

  @override
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
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40.0),
                  child: Image.asset("images/img1.jpg", fit: BoxFit.cover),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset("images/img2.png", fit: BoxFit.cover),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset("images/img3.jpg", fit: BoxFit.cover),
                ),
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
}
