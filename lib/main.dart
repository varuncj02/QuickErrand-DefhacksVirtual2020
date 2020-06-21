import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /*title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
        
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    */
      debugShowCheckedModeBanner: false,
      title: 'DB Info',
      home: MyJobPage(),
    );
  }
}

class MyJobPage extends StatefulWidget {
  @override 
  _MyJobPageState createState() => _MyJobPageState();
}

class _MyJobPageState extends State<MyJobPage> {
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle:true, title: Text('Job Page')),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context){
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('JobPage').snapshots(),
      builder: (context, snapshot) {
        return _buildList(context, snapshot.data.documents);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children : snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data){
    final dbinfo = DBInfo.fromSnapshot(data);

    return Padding(
      key: ValueKey(dbinfo.JobID),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
          title: Text(dbinfo.JobID),
          trailing: Text(dbinfo.JobTitle),
          onTap: () => print(dbinfo),
        )
      ),
    );
  }
}


class DBInfo {
  final String JobID;
  final String JobTitle;
  final int Price;
  final String Region;
  final String Skills;
  final int Time;
  final DocumentReference reference;

  DBInfo.fromMap(Map<String, dynamic> map, {this.reference})
    : assert(map['JobID'] != null),
      assert(map['JobTitle'] != null),
      assert(map['Price'] != null),
      assert(map['Region'] != null),
      assert(map['Skills'] != null),
      assert(map['Time'] != null),
      JobID = map['JobID'],
      JobTitle = map['JobTitle'],
      Price = map['Price'],
      Region = map['Region'],
      Skills = map['Skills'],
      Time = map['Time'];

  DBInfo.fromSnapshot(DocumentSnapshot snapshot)
    : this.fromMap(snapshot.data, reference: snapshot.reference);

}




// Default Code
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
