import 'package:flutter/material.dart';
import 'package:flutter_auth_ui/screens/artist_page.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> img = [
    './././assets/images/kendrick.jpg',
    './././assets/images/ariana.jpg',
    './././assets/images/drake.jpg',
    './././assets/images/seedhe_maut.jpg',
    './././assets/images/weeknd.jpg',
  ];
  List<String> artistName = [
    'Kendrick Lamar',
    'Ariana Grande',
    'Drake',
    'Seedhe Maut',
    'The Weeknd',
  ];
  final TextEditingController _searchController = TextEditingController();
  List artistpngs = [
    "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.popsugar.com%2FTaylor-Swift&psig=AOvVaw21cI3qrjaSlVAlxpmXMLjI&ust=1680726108332000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCJCm-KCHkf4CFQAAAAAdAAAAABAE",
    "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.the-sun.com%2Fentertainment%2F5333760%2Fkendrick-lamar-album-wife-kids%2F&psig=AOvVaw2tUgonWErrJSW3ldigsT4J&ust=1680726180132000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCLDCjcSHkf4CFQAAAAAdAAAAABAD",
    "https://www.google.com/url?sa=i&url=https%3A%2F%2Feconomictimes.indiatimes.com%2Fnews%2Finternational%2Fuk%2Fwhat-is-the-controversy-surrounding-kanye-west-here-are-details%2Farticleshow%2F95358718.cms&psig=AOvVaw2SRnZMlFTNmPa_u3P0V6zL&ust=1680726272628000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCNjQ7--Hkf4CFQAAAAAdAAAAABAD",
  ];

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {
        // update the position of your welcome container here
      });
    });

    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Color(0xFFFBF0E6),
          ),
          Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF211614),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      height: 60,
                      child: Center(
                        child: Text(
                          "GeetGala",
                          style: GoogleFonts.arbutusSlab(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () => {
                        showSearch(
                          context: context,
                          delegate: MySearchDelegate(),
                        )
                      },
                      icon: const Icon(Icons.search),
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 60,
                child: ListView.builder(
                  controller:
                      _scrollController, // associate the controller with the ListView
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                        padding: const EdgeInsets.only(
                            top: 20, bottom: 10, left: 40, right: 40),
                        height: 200,
                        width: 400,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          elevation: 10,
                          color: Color(0xFF946C0A),
                          child: Row(children: [
                            Container(
                              height: 200,
                              width: 160,
                              margin: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  image: DecorationImage(
                                      image: AssetImage(img[index]),
                                      fit: BoxFit.cover)),
                            ),
                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    artistName[index],
                                    style: TextStyle(
                                        color: Color(0xFF211614),
                                        fontFamily: 'ArbutusSlab',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(
                                            0xFF211614), // background (button) color
                                        foregroundColor: Color(
                                            0xFFFBF0E6), // foreground (text) color
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ArtistPage(index)));
                                      },
                                      child: Text('View Artist'))
                                ],
                              ),
                            )
                          ]),
                        ));
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class MySearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    "Kendrick Lamar",
    "Ariana Grande",
    "Drake",
    "Seedhe Maut",
    "Lata Mangeshkar",
    "Camila Cabello",
    "Doja Cat",
    "Charlie xcx"
  ];
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => close(context, null), icon: Icon(Icons.arrow_back));
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            }
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}
