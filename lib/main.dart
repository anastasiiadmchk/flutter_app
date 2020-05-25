import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.greenAccent[400],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Traveler'),
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
  bool _isFavorited = false;
  int _favoriteCount = 0;


  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }


  Widget _buildSuggestions() {

    return ListView(
        children: <Widget>[
          Container(
            child: Image.asset('assets/images/280440.jpg'),
          ),
          Container(
            padding: EdgeInsets.only(left: 0, top: 20, right: 0, bottom: 0),
            child: Center( child: Text(
              'Lorem Ipsum', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, color: Colors.black,),
            ),),),
          Container(
            padding: EdgeInsets.only(left: 18, top: 10, right: 15, bottom: 10),
            child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ',
              style: TextStyle(fontSize: 23, color: Colors.black),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 18, top: 3, bottom: 20),
            child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left:5, right: 18),
                    child:Text('20.05.2020', style: TextStyle(fontSize: 15, color: Colors.black45,),),),
                  Expanded(
                    //padding: EdgeInsets.only(left:10, right: 120),
                    child:Text('Albek Beber', style: TextStyle(fontSize: 16, color: Colors.black54,),),),
                  SizedBox(
                    width: 5,
                    child: Expanded(
                      child: Text('$_favoriteCount', style: TextStyle(fontSize: 18, color: _isFavorited ? Colors.red : Colors.black38, fontWeight: FontWeight.bold),),
                    ),
                  ),
                  Container(
                    child: IconButton(
                      icon: (_isFavorited ? Icon(Icons.favorite) : Icon(Icons.favorite_border, color: Colors.black38,)),
                      color: _isFavorited ? Colors.red : null,
                      onPressed: _toggleFavorite,
                    ),
                  ),
                  Container(
                    child: IconButton(
                      icon: (Icon(Icons.mode_comment)),
                      onPressed: null,
                    )
                  )

            ])
          ),
          ButtonBar(
            alignment:MainAxisAlignment.center,
            buttonMinWidth: 230,
              children: <Widget>[
                RaisedButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  color: Colors.greenAccent[400],
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SecondRoute()),
                    );
                  },
                  child: Text("Done", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
                ),
              ],

              )

        ],
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title, style: TextStyle(fontSize: 24, color: Colors.white),),),
      ),

      body: Center(
        child: _buildSuggestions(),

      ),
      //floatingActionButton: FloatingActionButton(
        //onPressed: _incrementCounter,
        //tooltip: 'Increment',
        //child: Icon(Icons.add),
      //), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
class SecondRoute extends StatefulWidget {
  @override
  createState() => SecondRouteState();
}
class SecondRouteState extends State<SecondRoute> {
  double opacityLevel = 1.0;

  void _changeOpacity() {
    setState(() => opacityLevel = opacityLevel == 0.2 ? 1.0 : 0.2);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
        title: Text("Completed", style: TextStyle(fontSize: 24, color: Colors.white),),
          centerTitle: true,
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedOpacity(
                opacity: opacityLevel,
                duration: Duration(seconds: 1),
                child: MaterialButton(
                  onPressed: () {
                    _changeOpacity();
                  },
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  color: Colors.greenAccent[400],
                  textTheme: ButtonTextTheme.normal,
                  minWidth: 300,
                  height: 50,
                  elevation: 5,
                  child: Text('Anastasiia is the best!', style: TextStyle(fontSize: 24, color: Colors.white),),
        ),)
        ]
      )
      )
    );
  }
}
