import 'package:abctest/event_detail_page.dart';
import 'package:abctest/helper/api_help.dart';
import 'package:abctest/helper/helper.dart';
import 'package:flutter/material.dart';

class EventInfo extends StatefulWidget {
  // final String title;
  EventInfo({Key? key}) : super(key: key);

  @override
  _EventInfoState createState() => _EventInfoState();
}

class _EventInfoState extends State<EventInfo> {
  // Text(widget.item['place_name'],)
  //  Text(item['place_name'],)

  ApiHelp api = ApiHelp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          'Event Tourism',
          style: TextStyle(
            fontSize: 15,
          ),
        )),
        body: FutureBuilder(
            future: api.getEventTravel(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return Center(
                  child: Text('กำลังโหลดข้อมูล....'),
                );
              }

              if (snapshot.hasData) {
                // [0,1,1,213123,123,132,123,]
                final itemAll =
                    snapshot.data as List; //  [0,1,1,213123,123,132,123,]

                return ListView.builder(
                  itemCount: itemAll.length, // 6
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final item = itemAll[index];
                    String fmDate = Helper.dateFormat('dd/MM/yyyy')
                        .format(DateTime.parse(item['event_start_date']));
                    String toDate = Helper.dateFormat('dd/MM/yyyy')
                        .format(DateTime.parse(item['event_end_date']));
                    return Card(
                      child: Container(
                        height: 150,
                        child: Row(
                          children: [
                            Container(
                              height: 150,
                              width: 120,
                              // child: Text('data'),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(item['thumbnail_url']),
                                  fit: BoxFit.cover,
                                ),
                                //color: Colors.blue,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                //color: Colors.red,
                                height: 150,
                                child: Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: ListView(
                                    // crossAxisAlignment:
                                    //     CrossAxisAlignment.start,
                                    // mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ListTile(
                                          // title: Text(widget.item['place_name'],),
                                          contentPadding:
                                              EdgeInsets.only(bottom: 0),
                                          title: Text('${item['event_name']}'),
                                          subtitle: Text(
                                            'ช่วงวันที่ $fmDate ถึง $toDate',
                                            style: TextStyle(
                                              fontSize: 11,
                                              letterSpacing: 0,
                                            ),
                                          )),
                                      Text(
                                        'รายละเอียด',
                                        style: TextStyle(
                                          fontSize: 10,
                                          letterSpacing: 0,
                                        ),
                                      ),
                                      Text(
                                        '${item['event_introduction']}',
                                        style: TextStyle(
                                          fontSize: 11,
                                          letterSpacing: 0,
                                        ),
                                      ),
                                      Row(
                                        // crossAxisAlignment:
                                        //     CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              color: Colors.red[400],
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Text(
                                              '${item['location']}',
                                              style: TextStyle(
                                                fontSize: 11,
                                                letterSpacing: 0,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                builder: (context) {
                                                  return EventDetailPage(
                                                    itemEvent: item,
                                                  );
                                                },
                                              ));
                                            },
                                            child: Text(
                                              'เพิ่มเติม...',
                                              style: TextStyle(
                                                fontSize: 11,
                                                letterSpacing: 0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),

                                      //Text('data'),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              }

              return Center(
                child: Text('ไม่พบข้อมูล....'),
              );
            })

        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Expanded(
        //       flex: 4,
        //       child: Container(
        //         width: MediaQuery.of(context).size.width,
        //         color: Colors.blue,
        //         child: Image.network(
        //           (widget.item['thumbnail_url'] as String).isNotEmpty
        //               ? widget.item['thumbnail_url']
        //               : 'https://tatapi.tourismthailand.org/tatfs/IMAGE/Event/Thumbnail/E0002536.jpg',
        //           fit: BoxFit.cover,
        //           // scale: 0.0008,
        //           // width: 100,
        //         ),
        //       ),
        //     ),
        //     Expanded(
        //         flex: 9,
        //         child: Container(
        //             width: MediaQuery.of(context).size.width,
        //             // color: Colors.green,
        //             child: Column(crossAxisAlignment: CrossAxisAlignment.center,
        //                 // mainAxisSize: MainAxisSize.max,
        //                 children: [
        //                   // Text('Image'),
        //                   ListTile(
        //                     title: Text(widget.item['event_name']),
        //                     subtitle:
        //                         Text(widget.item['display_event_period_date']),
        //                     trailing: Text(Helper.dateFormat('dd/MM/yyyy HH:mm')
        //                         .format(DateTime.parse(widget.item[
        //                             'event_start_date' + 'event_end_date']))),
        //                   ),
        //                   SizedBox(
        //                     height: 10,
        //                   ),
        //                   Container(
        //                     padding: EdgeInsets.all(10),
        //                     margin: EdgeInsets.symmetric(horizontal: 15),
        //                     height: 100,
        //                     //
        //                     decoration: BoxDecoration(
        //                       color: Colors.blueGrey,
        //                       // shape: BoxShape.circle,
        //                       borderRadius: BorderRadius.circular(15),
        //                     ),
        //                     child: Text(
        //                         '${widget.item['event_introduction']['location']} '),
        //                   ),
        //                   SizedBox(
        //                     height: 10,
        //                   ),
        //                   ElevatedButton.icon(
        //                       onPressed: () => {},
        //                       icon: Icon(Icons.map),
        //                       label: Text('แผนที่')),
        //                 ])))
        //   ],
        // ),
        );
  }
}
