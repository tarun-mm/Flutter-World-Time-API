import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  @override
  Widget build(BuildContext context) {
    
    List<WorldTime> locations = [
      WorldTime(url: 'Europe/London', location: 'London'),
      WorldTime(url: 'Europe/Athens', location: 'Athens'),
      WorldTime(url: 'Africa/Cairo', location: 'Cairo'),
      WorldTime(url: 'Africa/Nairobi', location: 'Nairobi'),
      WorldTime(url: 'America/Chicago', location: 'Chicago'),
      WorldTime(url: 'America/New_York', location: 'New York'),
      WorldTime(url: 'Asia/Seoul', location: 'Seoul'),
      WorldTime(url: 'Asia/Jakarta', location: 'Jakarta'),
    ];

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(
          'Choose a location',
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: GestureDetector(
              child: Card(
                color: Colors.amber,
                child: ListTile(
                  title: Text(
                    locations[index].location,
                  ),
                ),
              ),
              onTap: () async {
                WorldTime instance = WorldTime(location: locations[index].location, url: locations[index].url);
                await instance.getTime();

                Navigator.pushReplacementNamed(context, '/home', arguments: {
                  'location': instance.location,
                  'time': instance.time,
                  'isDayTime': instance.isDayTime,
                });
              },
            ),
          );
        },
      ),
    );
  }
}
