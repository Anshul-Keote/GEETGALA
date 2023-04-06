// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_auth_ui/screens/login_screen.dart';
import 'home.dart';
import 'pages/library.dart';
import 'icons.dart';

class Discover extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF946C0A),
        body: Stack(children: <Widget>[
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/yellow&black.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Row(
            children: [
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF946C0A),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Container(),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Flexible(flex: 1, fit: FlexFit.tight, child: SizedBox()),
              Flexible(
                flex: 4,
                fit: FlexFit.tight,
                child: Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'GEETGALA',
                    style: TextStyle(
                        color: Color(0xFFFFF4EA),
                        fontFamily: 'ArbutusSlab',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Flexible(flex: 8, fit: FlexFit.tight, child: SizedBox()),
              Flexible(
                flex: 6,
                fit: FlexFit.tight,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 30),
                      child: Text('Discover Your Niche',
                          style: TextStyle(
                            color: Color(0xFFFFC61A),
                            fontFamily: 'PlayfairDisplay',
                            fontSize: 50,
                          )),
                    ),
                    Row(
                      children: [
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Container(),
                        ),
                        Flexible(
                          flex: 20,
                          fit: FlexFit.tight,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                transitionDuration: Duration(milliseconds: 200),
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                  return SlideTransition(
                                    position: Tween<Offset>(
                                      begin: Offset(1.0, 0.0),
                                      end: Offset.zero,
                                    ).animate(animation),
                                    child: child,
                                  );
                                },
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        LoginScreen(),
                              ),
                            );
                            },
                            child: Container(
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.only(left: 15),
                              child: Icon(
                                icon1.right,
                                color: Color(0xFFFFF4EA),
                                // size: 20,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Flexible(flex: 10, fit: FlexFit.tight, child: SizedBox()),
            ],
          )
        ]),
      );
  }
}
