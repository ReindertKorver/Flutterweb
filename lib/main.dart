import 'package:flutter_web/material.dart';
import 'package:flutterweb/DAL/ImageConnection.dart';
import 'dart:math' as math;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    getData();
    super.initState();
  }
  void getData()async {
    var res= await ImageConnection.GetImagesAsync();
    print(res);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
         
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: FutureBuilder(
                      future: ImageConnection.GetImagesAsync(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                           return Image.network(
                                            snapshot.data['results'][0+ math.Random().nextInt(10 - 0)]['urls']["full"],
                                            width: MediaQuery.of(context).size.width,

                                            fit: BoxFit.cover,
                                          );
                        } else {
                          return Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircularProgressIndicator(
                                    valueColor: new AlwaysStoppedAnimation<Color>(
                                        Color(0xFF203d75)),
                                  ),
                                ),
                              ),
                              Divider(),
                              Text("Loading..."),
                            ],
                          );
                        }
                      }),
                ),
               
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Website",style: Theme.of(context).textTheme.display4,),
              Text("Website",style: Theme.of(context).textTheme.display2,),

          ],),
        ],
      ),
    );
  }
}
