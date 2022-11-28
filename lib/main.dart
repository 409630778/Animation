import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Animation Examples';
  static const IconData airplanemode_active = IconData(0xe06e, fontFamily: 'MaterialIcons');
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  double padValue = 500;
  double padValue2 = 500.0;
  void _updatePadding(double value) {
    setState(() {
      padValue = value;
      padValue2 = value;
    });
  }




  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 0,
          color: Colors.green,
          child: AnimatedPadding(
            padding: EdgeInsets.only(left:150,top: padValue2),
            duration: const Duration(seconds: 2),
            curve: Curves.linear,
            child: Icon(
              Icons.airplanemode_active,
              color: Colors.blue,
              size: 50,
            ),
              onEnd: (){
                setState(() {
                  padValue2 = 500;
                });
              }

        )


        ),

        Padding(
          padding: EdgeInsets.only(left:150,top:550),
          child: ElevatedButton.icon(
            icon:Icon(
              Icons.airplanemode_active,
              color: Colors.white,
              size: 20,
            ),
            label:Text("起飛"),
            onPressed: () {
              setState(() {
                padValue2=0;
              });;
            }
            ),
        ),
      ],

    );

  }
}

