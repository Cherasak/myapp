import 'package:flutter/material.dart';

class Travel extends StatefulWidget {
  final dynamic item;
  Travel({Key? key, this.item}) : super(key: key);
  _TravelState createState() => _TravelState();
}

// ignore: non_constant_identifier_names

class _TravelState extends State<Travel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          widget.item['route_name'],
          style: TextStyle(
            fontSize: 15,
          ),
        )),
        body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.network(
              (widget.item['thumbnail_url'] as String).isNotEmpty
                  ? widget.item['thumbnail_url']
                  : 'https://tatapi.tourismthailand.org/tatfs/Image/CustomPOI/PictureMob/P03002579_1.jpeg',
              fit: BoxFit.cover,
              // scale: 0.0008,
              // width: 100,
            )
            // Positioned(
            // bottom: 10,
            //child: Container(
            // width: 135.0,
            // margin: EdgeInsets.symmetric(horizontal: 5),
            //  padding: EdgeInsets.all(5),
            // decoration: BoxDecoration(
            //  color: Colors.amberAccent,
            //   borderRadius: BorderRadius.only(
            //    bottomRight: Radius.circular(20),
            //  ),
            // ),
            // child: Text(
            //   '${item['route_introduction']}',
            //   style: TextStyle(fontSize: 12.0),
            //   textAlign: TextAlign.center,
            // ),
            //),
            // ),
            ));
  }
}
