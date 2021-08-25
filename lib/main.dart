import 'package:abctest/helper/api_help.dart';
import 'package:abctest/place_info.dart';
import 'package:flutter/material.dart';

import 'container_wiget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyAPP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'My app test'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  ApiHelp api = ApiHelp();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
    api.getPlace();
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
        title: Text(widget.title),
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
