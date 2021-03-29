import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Background color transition',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    )..repeat();
  }

  Animatable<Color> background = TweenSequence<Color>([
    TweenSequenceItem(
      weight: 3.0,
      tween: ColorTween(
        begin: Colors.black,
        end: Colors.black,
      ),
    ),
    TweenSequenceItem(
      weight: 1.2,
      tween: ColorTween(
        begin: Colors.black,
        end: Colors.white,
      ),
    ),
  ]);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child)
    {
      return Scaffold(
        body: Container(
            color: background.evaluate(AlwaysStoppedAnimation(_controller.value)),
            child: Center(
                child: FractionallySizedBox(
                    child:Image(image: AssetImage('graphics/logo.png')),
                      widthFactor: 0.3,
                      heightFactor: 0.1,
            )
      )
        ),
      );
    });
  }
}