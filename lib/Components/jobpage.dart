import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class MyJobPage extends StatefulWidget {
  @override 
  _MyJobPageState createState() => _MyJobPageState();
}

class _MyJobPageState extends State<MyJobPage> {
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Job Listings')),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
   // return _buildStuff(context, List<Map> snapshot); // Snapshot data goes in 
   return StreamBuilder<QuerySnapshot>(
     stream: Firestore.instance.collection('JobInfo').snapshots(),
     builder: (context, snapshot) {
       if(!snapshot.hasData) return LinearProgressIndicator(); // If there is no data in the snapshot

       return _buildStuff(context, snapshot.data.documents);
     }
   );
  }

  Widget _buildStuff(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) => _buildItem(context, data)).toList(),
    );
  }

  Widget _buildItem(BuildContext context, DocumentSnapshot data) {
    final record = Record.fromSnapshot(data);

    return Padding(
      key: ValueKey(record.area),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.red), // Sample Color needs to be changed
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
          title: Text(record.area),
          trailing: Text(record.jobTitle),
          onTap: () => print(record), // Just to check if code works
        )
      ),
    );
  }
}


class Record {
  final String area;
  final String jobTitle;
  final int rate;
  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
    : assert(map['area'] != null),
      assert(map['jobTitle'] != null),
      assert(map['rate'] != null),
      area = map['area'],
      jobTitle = map['jobTitle'],
      rate = map['rate'];
  
  Record.fromSnapshot(DocumentSnapshot snapshot)
    : this.fromMap(snapshot.data, reference: snapshot.reference);

  
}