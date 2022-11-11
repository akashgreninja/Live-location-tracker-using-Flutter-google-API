import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:googlemaps/mymap.dart';
import 'package:location/location.dart' as loc;
import 'package:permission_handler/permission_handler.dart';

// https://www.youtube.com/watch?v=29NTfCFP7HE
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final loc.Location location = loc.Location();

  StreamSubscription<loc.LocationData>? _locationsubscription;
  @override
  void initState() {
    super.initState();
    _requestPermission();
    location.changeSettings(interval: 300, accuracy: loc.LocationAccuracy.high);
    location.enableBackgroundMode(enable: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tracker"),
      ),
      body: Column(
        children: [
          // TextButton(
          //     onPressed: () {
          //       _getlocation();
          //     },
          //     child: Text("add my location")),
          TextButton(
              onPressed: () {
                _listenlocation();
              },
              child: Text("enable live location")),
          TextButton(
              onPressed: () {
                _stoplocation();
              },
              child: Text("stop live location")),
          Expanded(
              child: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('location').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: ((context, index) {
                    return ListTile(
                      title:
                          Text(snapshot.data!.docs[index]['name'].toString()),
                      subtitle: Row(
                        children: [
                          Text(snapshot.data!.docs[index]['latitide']
                              .toString()),
                          SizedBox(
                            width: 20,
                          ),
                          Text(snapshot.data!.docs[index]['longitude']
                              .toString()),
                        ],
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.directions),
                        onPressed: (() {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  MyMap(snapshot.data!.docs[index].id)));
                        }),
                      ),
                    );
                  }));
            },
          )),
        ],
      ),
    );
  }

  _getlocation() async {
    try {
      final loc.LocationData _locationResult = await location.getLocation();
      await FirebaseFirestore.instance.collection('location').doc('user1').set({
        'latitide': _locationResult.latitude,
        'longitude': _locationResult.longitude,
        'name': 'akash'
      }, SetOptions(merge: true));
    } catch (e) {
      print("some error");
    }
  }

  Future<void> _listenlocation() async {
    _locationsubscription = location.onLocationChanged.handleError((onError) {
      print(onError);
      _locationsubscription?.cancel();
      setState(() {
        _locationsubscription = null;
      });
    }).listen((loc.LocationData currentlocation) async {
      await FirebaseFirestore.instance.collection('location').doc('user1').set({
        'latitide': currentlocation.latitude,
        'longitude': currentlocation.longitude,
        'name': 'akash'
      }, SetOptions(merge: true));
    });
  }

  _stoplocation() {
    _locationsubscription?.cancel();
    setState(() {
      _locationsubscription = null;
    });
  }

  _requestPermission() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      print('done');
    } else if (status.isDenied) {
      _requestPermission();
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }
}
