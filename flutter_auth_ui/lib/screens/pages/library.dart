import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_auth_ui/main.dart';

class Library extends StatefulWidget {
  // const Library({super.key});

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              color: Color(0xFFFBF0E6),
            ),
            Column(
              children: <Widget>[
                const SizedBox(
                  height: 75,
                ),
                Row(
                  children: const [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 30, bottom: 20),
                        child: Text(
                          'Your Deck',
                          style: TextStyle(
                              color: Color(0xFF946C0A),
                              fontFamily: 'ArbutusSlab',
                              fontSize: 25
                          ),
                        ),
                      ),
                    ),
                    Expanded(child: SizedBox(),)
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: 10 ,
                      itemBuilder: (context, index){
                        return Padding(
                          padding:  const EdgeInsets.all(5),
                          child:
                          Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              color: const Color(0xFFFFC61A),
                              elevation: 5,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 30,
                                  vertical: 10
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(15),
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      Text('Deck'),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text('52 min')
                                    ],
                                  ),
                                ],
                              )
                          ),
                        );
                      }),
                ),
              ],
            ),
          ],
        )
    );
  }
}