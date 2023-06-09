import 'package:flutter/material.dart';
import 'package:pdpui3/pages/home_page.dart';
import 'package:pdpui3/utils/Strings.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);
  static const String id = 'intro_page';

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            controller: _pageController,
            children: [
              makePage(
                image: "assets/images/image_1.png",
                title: Strings.stepOneTitle,
                content: Strings.stepOneContent,
              ),
              makePage(
                reverse: true,
                image: "assets/images/image_2.png",
                title: Strings.stepTwoTitle,
                content: Strings.stepTwoContent,
              ),
              makePage(
                image: "assets/images/image_3.png",
                title: Strings.stepThreeTitle,
                content: Strings.stepThreeContent,
              ),
            ],
          ),
          Container(
            height: double.infinity,
            margin: EdgeInsets.only(bottom: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: _buildIndicators(),
            ),
          ),
          Container(
            alignment: Alignment.bottomRight,
            margin: EdgeInsets.only(bottom: 60, right: 20),
            child: _buildSkip(),
          ),
        ],
      ),
    );
  }

  Widget makePage({
    required String image,
    required String title,
    required String content,
    bool reverse = false,
  }) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              color: Colors.red,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            content,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Image.asset(image),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 6,
      width: isActive ? 30 : 6,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  List<Widget> _buildIndicators() {
    List<Widget> indicators = [];
    for (int i = 0; i < 3; i++) {
      if (_currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }

  Widget _buildSkip() {
    if (_currentIndex == 2) {
      return GestureDetector(
        onTap: () {
          Navigator.pushReplacementNamed(context, HomePage.id);
        },
        child: Text(
          "Skip",
          style: TextStyle(
              color: Colors.red, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      );
    } else {
      return Container();
    }
  }
}
