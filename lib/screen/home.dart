import 'package:abctest/helper/api_help.dart';
import 'package:abctest/place_info.dart';
import 'package:abctest/red_moon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiHelp api = ApiHelp();

  @override
  void initState() {
    super.initState();
    // api.getPlace();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    return Scaffold(
      // backgroundColor: Color(0xFF2596be),
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          // IconButton(
          //   onPressed: () => {print('click action')},
          //   icon: Icon(
          //     Icons.close,
          //     color: Colors.white,
          //   ),
          // )
        ],
        // backgroundColor: Colors.red,
        elevation: 1,
        centerTitle: true,
      ),
      drawer: DrawerReadMoon(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        // EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        // EdgeInsets.only(bottom: 20, left: 20),
        //
        child: FutureBuilder(
          future: api.getPlace(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return Center(
                child: Text('กำลังโหลดข้อมูล....'),
              );
            }
            if (snapshot.hasData) {
              final itemAll = snapshot.data as List;

              return GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  // childAspectRatio: (itemWidth / itemHeight),
                ),
                itemCount: itemAll.length,
                //
                controller: new ScrollController(keepScrollOffset: false),

                itemBuilder: (context, index) {
                  final item = itemAll[index];

                  return InkWell(
                    onTap: () => {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PlaceInfo(
                            item: item,
                          ),
                        ),
                      ),
                    },
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      child: Stack(
                        clipBehavior: Clip.antiAlias,
                        children: [
                          // Text(
                          //   '${item['place_name']}',
                          //   style: TextStyle(fontSize: 13.0),
                          // ),
                          Image.network(
                            (item['thumbnail_url'] as String).isNotEmpty
                                ? item['thumbnail_url']
                                : 'https://thaigifts.or.th/wp-content/uploads/2017/03/no-image.jpg',
                            fit: BoxFit.fill,
                          ),

                          Positioned(
                            // top: 10,
                            bottom: 10,
                            child: Container(
                              width: 135.0,
                              // margin: EdgeInsets.symmetric(horizontal: 5),
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.amberAccent,
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20),
                                ),
                              ),
                              child: Text(
                                '${item['place_name']}',
                                style: TextStyle(fontSize: 12.0),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          // if() {} else {}
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
          },
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
