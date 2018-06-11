import 'dart:math';

import 'package:flutter/material.dart';

class DotsIndicator extends AnimatedWidget {
  DotsIndicator({
    this.controller,
    this.itemCount,
    this.onPageSelected,
    this.color: Colors.white,
  }) : super(listenable: controller);

  /// The PageController that this DotsIndicator is representing.
  final PageController controller;

  /// The number of items managed by the PageController
  final int itemCount;

  /// Called when a dot is tapped
  final ValueChanged<int> onPageSelected;

  /// The color of the dots.
  ///
  /// Defaults to `Colors.white`.
  final Color color;

  // The base size of the dots
  static const double _kDotSize = 8.0;

  // The increase in the size of the selected dot
  static const double _kMaxZoom = 2.0;

  // The distance between the center of each dot
  static const double _kDotSpacing = 25.0;

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((controller.page ?? controller.initialPage) - index).abs(),
      ),
    );
    double zoom = 1.0 + (_kMaxZoom - 1.0) * selectedness;
    return new Container(
      width: _kDotSpacing,
      child: new Center(
        child: new Material(
          color: color,
          type: MaterialType.circle,
          child: new Container(
            width: _kDotSize * zoom,
            height: _kDotSize * zoom,
            child: new InkWell(
              onTap: () => onPageSelected(index),
            ),
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: new List<Widget>.generate(itemCount, _buildDot),
    );
  }
}

class Test extends StatefulWidget {
  @override
  State createState() => new TestPageState();
}

class TestPageState extends State<Test> {
  final _controller = new PageController();

  static const _kDuration = const Duration(milliseconds: 300);

  static const _kCurve = Curves.ease;

  final _kArrowColor = Colors.black.withOpacity(0.8);

  final List<Widget> _pages = <Widget>[
    new ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: new Column(
        children: <Widget>[
          new Stack(
            children: <Widget>[
              new Image.asset(
                'images/background_pattern_dark.png',
              ),
              new Column(
                children: <Widget>[
                  new Padding(padding: const EdgeInsets.all(30.0)),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Text(
                        "JULO",
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                            color: Colors.lightBlue,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold),
                      ),
                      new Text(
                        " Mini",
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                            color: Colors.lightBlue, fontSize: 24.0),
                      ),
                    ],
                  ),
                  new Padding(padding: const EdgeInsets.all(30.0)),
                  new Stack(
                    children: <Widget>[
                      new Image.asset(
                        'images/product_slide_mini_bg.png',
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.center,
                      ),
                      new Align(
                          alignment: Alignment.topRight,
                          child: new Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  0.0, 0.0, 20.0, 0.0),
                              child: new Image.asset(
                                'images/product_slide_sun.png',
                                width: 80.0,
                                height: 200.0,
                                alignment: Alignment.center,
                              ))),
                      new Center(
                        child: new Image.asset(
                          'images/product_slide_mini_front.png',
                          alignment: Alignment.center,
                        ),
                      ),
                    ],
                  ),
                  new Padding(
                    padding: const EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 20.0),
                    child: new Text(
                      "Pinjaman cepat Rp 1.000.000 dengan masa pengembalian "
                          "1 Bulan. Solusi kebutuhdan dana tidak terduga.",
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    ),
    new ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child:
          new FlutterLogo(style: FlutterLogoStyle.stacked, colors: Colors.red),
    ),
    new ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: new FlutterLogo(
          style: FlutterLogoStyle.horizontal, colors: Colors.green),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Container(
      decoration: new BoxDecoration(
          gradient: new LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.1, 0.3, 0.4, 0.5, 0.9],
        colors: [
          // Colors are easy thanks to Flutter's
          // Colors class.
          Colors.white,
          Colors.white70,
          Colors.white70,
          Colors.white70,
          const Color(0xFF1593B6),
        ],
      )),
      child: new IconTheme(
          data: new IconThemeData(color: _kArrowColor),
          child: new Container(
            child: new Column(
              children: <Widget>[
                new Padding(padding: const EdgeInsets.all(30.0)),
                new Image.asset(
                  'images/logo_julo_blue.png',
                  height: 80.0,
                  alignment: Alignment.center,
                ),
                new Expanded(
                  child: new Stack(
                    children: <Widget>[
                      new PageView.builder(
                        physics: new AlwaysScrollableScrollPhysics(),
                        controller: _controller,
                        itemBuilder: (BuildContext context, int index) {
                          return _pages[index % _pages.length];
                        },
                      ),
//                      new Positioned(
//                        bottom: 0.0,
//                        left: 0.0,
//                        right: 0.0,
//                        child: new Container(
//                          color: Colors.grey[800].withOpacity(0.5),
//                          padding: const EdgeInsets.all(20.0),
//                          child: new Center(
//                            child: new DotsIndicator(
//                              controller: _controller,
//                              itemCount: _pages.length,
//                              onPageSelected: (int page) {
//                                _controller.animateToPage(
//                                  page,
//                                  duration: _kDuration,
//                                  curve: _kCurve,
//                                );
//                              },
//                            ),
//                          ),
//                        ),
//                      ),
                    ],
                  ),
                )
              ],
            ),

//                child: new Stack(
//                  children: <Widget>[
//                    new PageView.builder(
//                      physics: new AlwaysScrollableScrollPhysics(),
//                      controller: _controller,
//                      itemBuilder: (BuildContext context, int index) {
//                        return _pages[index % _pages.length];
//                      },
//                    ),
//                    new Positioned(
//                      bottom: 0.0,
//                      left: 0.0,
//                      right: 0.0,
//                      child: new Container(
//                        color: Colors.grey[800].withOpacity(0.5),
//                        padding: const EdgeInsets.all(20.0),
//                        child: new Center(
//                          child: new DotsIndicator(
//                            controller: _controller,
//                            itemCount: _pages.length,
//                            onPageSelected: (int page) {
//                              _controller.animateToPage(
//                                page,
//                                duration: _kDuration,
//                                curve: _kCurve,
//                              );
//                            },
//                          ),
//                        ),
//                      ),
//                    ),
//                  ],
//                ),
          )),
    ));
  }
}
