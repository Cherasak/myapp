//import 'package:flutter/cupertino.dart';

import 'package:abctest/main.dart';
import 'package:abctest/red_moon.dart';
import 'package:abctest/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      // backgroundColor: ,
      // backgroundColor: ,
      // appBar: AppBar(),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 25, 178, 238),
                Color.fromARGB(255, 21, 236, 229)
              ],
            ),
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Image.asset(
                "assets/image/Restaurant.png",
                fit: BoxFit.cover,
                width: 200,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.35,
                padding: EdgeInsets.all(8),
                // height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(
                    0xFFFFFFFF,
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      'Tourism Thailand',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: username,
                      decoration: InputDecoration(
                        // filled: true,
                        labelText: 'Username',
                        hintText: ' Ex[ ADMIN ]',

                        fillColor: Colors.blueAccent,
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.yellow, width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: password,
                      decoration: InputDecoration(
                        // filled: true,
                        labelText: 'Password',
                        hintText: '1234',
                        fillColor: Colors.blueAccent,
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.yellow, width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    ElevatedButton.icon(
                      icon: Icon(Icons.login),
                      label:
                          Text("เข้าสู่ระบบ", style: TextStyle(fontSize: 20)),
                      onPressed: () async {
                        if (!username.text.isNotEmpty &&
                            !password.text.isNotEmpty) {
                          // _scaffoldkey.currentState!.showSnackBar(mySnackBar);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: const Text('กรุณาใส่ข้อมูล ADMIN | 1234'),
                            duration: const Duration(seconds: 2),
                          ));
                        } else {
                          await EasyLoading.show(
                            status: 'กรุณารอสักครู่...',
                            maskType: EasyLoadingMaskType.black,
                          );

                          await Future.delayed(Duration(seconds: 2));

                          await EasyLoading.dismiss();

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return HomePage();
                              },
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
              // ElevatedButton.icon(
              //   icon: Icon(Icons.add),
              //   label: Text("สร้างบัญชีผู้ใช้", style: TextStyle(fontSize: 20)),
              //   onPressed: () {},
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
