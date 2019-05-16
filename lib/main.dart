import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Image Card Stack with drag'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> imageList;

  void _removeCard(index) {
    setState(() {
      imageList.removeAt(index);
    });
  }

  @override
  void initState() {
    super.initState();
    imageList = _getMatchCard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: imageList,
        ),
      ),
    );
  }

  List<Widget> _getMatchCard() {
    //hardcoded images
    List<AssetImage> images = new List();
    images.add( AssetImage('assets/images/image1.jpeg'));
    images.add( AssetImage('assets/images/image2.jpeg'));
    images.add( AssetImage('assets/images/image3.jpeg'));


    List<Widget> imageList = new List();

    //iterate over images
    for (int x = 0; x < 3; x++) {
      //add position element
      imageList.add(Positioned(
        child: Draggable(
          onDragEnd: (drag){
            _removeCard(x);
          },
          childWhenDragging: Container(),
          feedback: Card(
            elevation: 12,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
              width: 300,
              height: 300,
            ),
          ),
          child: Card(
            elevation: 12,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: images[x],
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
          ),
        ),
      ));
    }

    return imageList;
  }
}

