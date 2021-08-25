import 'package:abctest/models/test.dart';
import 'package:flutter/material.dart';

import 'helper/helper.dart';

class PlaceInfo extends StatefulWidget {
  final dynamic item;
  PlaceInfo({Key? key, this.item}) : super(key: key);

  @override
  _PlaceInfoState createState() => _PlaceInfoState();
}

class _PlaceInfoState extends State<PlaceInfo> {
  // Home home = Home();

  @override
  Widget build(BuildContext context) {
    // home.address;
    // home.name;
    // home.phone;

    // Map<String,dynamic>

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.item['place_name'],
          style: TextStyle(
            fontSize: 15,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.red,
              child: Image.network(
                (widget.item['thumbnail_url'] as String).isNotEmpty
                    ? widget.item['thumbnail_url']
                    : 'https://thaigifts.or.th/wp-content/uploads/2017/03/no-image.jpg',
                fit: BoxFit.cover,
                // scale: 0.0008,
                // width: 100,
              ),
            ),
          ),
          Expanded(
            flex: 9,
            child: Container(
              width: MediaQuery.of(context).size.width,
              // color: Colors.green,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisSize: MainAxisSize.max,
                children: [
                  // Text('Image'),
                  ListTile(
                    title: Text(widget.item['category_code']),
                    subtitle: Text(widget.item['category_description']),
                    trailing: Text(Helper.dateFormat('dd/MM/yyyy HH:mm')
                        .format(DateTime.parse(widget.item['update_date']))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    height: 100,
                    //
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      // shape: BoxShape.circle,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                        '${widget.item['location']['address']} ${widget.item['location']['sub_district']} ${widget.item['location']['district']} ${widget.item['location']['province']} ${widget.item['location']['postcode']}'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                      onPressed: () => {},
                      icon: Icon(Icons.map),
                      label: Text('แผนที่')),
                ],
              ),
            ),
          )
          // Container(
          //   child: Text('sss'),
          // ),
        ],
      ),
    );
  }
}
