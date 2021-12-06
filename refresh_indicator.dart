import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RefereshData extends StatefulWidget {
  const RefereshData({Key? key}) : super(key: key);

  @override
  _RefereshIndicatorState createState() => _RefereshIndicatorState();
}

class _RefereshIndicatorState extends State<RefereshData> {
  //
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('user');
  var userList = [];

  //
  @override
  void initState() {
    super.initState();
    loadData();
  }

  //
  @override
  void dispose() {
    super.dispose();
  }

  //
  Future<void> loadData() async {
    //
    userList.clear();
    //
    QuerySnapshot querySnapshot = await collectionReference.get();

    userList = querySnapshot.docs;

    setState(() {
      //
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      appBar: AppBar(
        title: Text('Referesh Indicator'),
      ),
      //
      body: RefreshIndicator(
        onRefresh: loadData,
        child: userList.length == 0
            ? Center(
                child: Text('No Data'),
              )
            : ListView.builder(
                //
                itemCount: userList.length,

                //
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    //
                    title: Text('${userList[index]['Name']}'),

                    subtitle: Text('${userList[index]['Email']}'),
                  );
                },
              ),
      ),
    );
  }
}
