import 'package:abctest/helper/api_help.dart';
import 'package:abctest/helper/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class EventDetailPage extends StatefulWidget {
  final dynamic itemEvent;
  EventDetailPage({Key? key, this.itemEvent}) : super(key: key);

  @override
  _EventDetailPageState createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> {
  ApiHelp api = ApiHelp();

  Map<String, dynamic>? itemDetail;
  Future getEventDetail() async {
    await api.getEventTravelById(widget.itemEvent['event_id']).then((value) {
      print('success');
      setState(() {
        itemDetail = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getEventDetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.itemEvent['event_name'],
          style: TextStyle(
            fontSize: 15,
          ),
        ),
      ),
      body: itemDetail == null
          ? Center(
              child: Text('โปรดรอสักครู่'),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 180,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.itemEvent['thumbnail_url']),
                      fit: BoxFit.cover,
                    ),
                    // borderRadius: BorderRadius.circular(20)
                    //color: Colors.blue,
                  ),
                  // width: ,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Color(0xFF1582d1),
                          borderRadius:
                              BorderRadius.only(topRight: Radius.circular(50))
                          //color: Colors.blue,
                          ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(itemDetail?["event_id"]),
                            Text(itemDetail?["display_event_period_date"]),
                            Text(
                              itemDetail?["event_information"]
                                  ['event_introduction'],
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              child: Html(
                                  data: itemDetail?["event_information"]
                                      ['event_html_detail']),
                            )
                          ],
                        ),
                      ),
                      // width: ,
                    ),
                  ),
                )

                // Expanded(
                //   flex: 4,
                //   child: Container(
                //     width: MediaQuery.of(context).size.width,
                //     color: Colors.red,
                //     child: Image.network(
                //       (widget.itemEvent['thumbnail_url'] as String).isNotEmpty
                //           ? widget.itemEvent['thumbnail_url']
                //           : 'https://thaigifts.or.th/wp-content/uploads/2017/03/no-image.jpg',
                //       fit: BoxFit.cover,
                //       // scale: 0.0008,
                //       // width: 100,
                //     ),
                //   ),
                // ),
                // Expanded(
                //   flex: 9,
                //   child: Container(
                //     width: MediaQuery.of(context).size.width,
                //     // color: Colors.green,
                //     child: Column(
                //       crossAxisAlignment: CrossAxisAlignment.center,
                //       // mainAxisSize: MainAxisSize.max,
                //       children: [
                //         // Text('Image'),
                //         ListTile(
                //           title: Text(widget.itemEvent['category_code']),
                //           subtitle: Text(widget.itemEvent['category_description']),
                //           trailing: Text(Helper.dateFormat('dd/MM/yyyy HH:mm')
                //               .format(DateTime.parse(widget.itemEvent['update_date']))),
                //         ),
                //         SizedBox(
                //           height: 10,
                //         ),
                //         Container(
                //           padding: EdgeInsets.all(10),
                //           margin: EdgeInsets.symmetric(horizontal: 15),
                //           height: 100,
                //           //
                //           decoration: BoxDecoration(
                //             color: Colors.blueGrey,
                //             // shape: BoxShape.circle,
                //             borderRadius: BorderRadius.circular(15),
                //           ),
                //           child: Text(
                //               '${widget.itemEvent['location']['address']} ${widget.itemEvent['location']['sub_district']} ${widget.itemEvent['location']['district']} ${widget.itemEvent['location']['province']} ${widget.itemEvent['location']['postcode']}'),
                //         ),
                //         SizedBox(
                //           height: 10,
                //         ),
                //         ElevatedButton.icon(
                //             onPressed: () => {},
                //             icon: Icon(Icons.map),
                //             label: Text('แผนที่')),
                //       ],
                //     ),
                //   ),
                // )
                // Container(
                //   child: Text('sss'),
                // ),
              ],
            ),
    );
  }
}
