import 'package:carousel/carousel.dart';
import 'package:flutter/material.dart';
import 'package:parallax_image/parallax_image.dart';

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => new _LandingState();
}

class _LandingState extends State<Landing> {

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return new Scaffold(
        body: new Column(
          children: <Widget>[
            new Container(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              constraints: const BoxConstraints(maxHeight: 200.0),
              child: new ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: _buildHorizontalChild,
              ),
            ),
          ],
        ),
    );
  }
//  @override
//  Widget build(BuildContext context) {
//    final _controller = new ScrollController();
//    return new MaterialApp(
//      title: 'Flutter Carousel',
//      home: new Scaffold(
//        appBar: new AppBar(
//          title: new Text('Carousel Demo'),
//        ),
//        body: new ListView(
//          controller: _controller,
//          children: <Widget>[
//            new Container(
//              padding: const EdgeInsets.symmetric(vertical: 10.0),
//              constraints: const BoxConstraints(maxHeight: 200.0),
//              child: new ListView.builder(
//                scrollDirection: Axis.horizontal,
//                itemBuilder: _buildHorizontalChild,
//              ),
//            ),
//          ],
//        ),
////        body: new Stack(children: <Widget>[
////          new PageView(
////            children: new PageView(),
////          ),
////          new ListView(
////            children: [
////              new Text('Text on top of the carousel'),
////            ],
////          ),
////        ]),
//      ),
//    );
////    return new Scaffold(
////      appBar: new AppBar(
////        title: new Text('Landing'),
////        backgroundColor: Colors.redAccent,
////        centerTitle: true,
////      ),
////    );
//  }

  Widget _buildHorizontalChild(BuildContext context, int index) {
    index++;
    if (index > 7) return null;
    return new Padding(
      padding: const EdgeInsets.only(right: 0.0),
      child: new ParallaxImage(
        extent: 100.0,
        image: new ExactAssetImage(
          'images/umbrella.png',
        ),
      ),
    );
  }

  Widget testBGCarousel = new Container(
    child: new Carousel(
      children: [
        new AssetImage('images/light_rain.png'),
        new AssetImage('images/umbrella.png'),
        new AssetImage('images/white_snow.png'),
      ]
          .map((bgImg) => new Image(
              image: bgImg, width: 1500.0, height: 1500.0, fit: BoxFit.cover))
          .toList(),
      displayDuration: const Duration(seconds: 1),
    ),
  );
}
