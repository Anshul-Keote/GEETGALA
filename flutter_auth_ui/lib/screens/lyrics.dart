import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Lyrics extends StatefulWidget {
  const Lyrics({Key? key}) : super(key: key);

  @override
  State<Lyrics> createState() => _LyricsState();
}

class _LyricsState extends State<Lyrics> {
  @override
  void initState() {
    super.initState();
    fetchLyrics("God's Plan", "Drake"); // call the fetchLyrics function
  }

  var lyric;
  var songname="God's Plan";

  Future<void> fetchLyrics(String trackName,String artistName) async {
    final String apiKey = '662dc1bbb906c087284c639380ab2727';
    
    final url =
        'https://api.musixmatch.com/ws/1.1/matcher.lyrics.get?apikey=$apiKey&q_track=$trackName&q_artist=$artistName';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final decodedJson = jsonDecode(response.body);
      final lyrics = decodedJson['message']['body']['lyrics']['lyrics_body'];
      lyric = lyrics;
      setState(() {});
      print(lyrics);
    } else {
      print('Failed to fetch lyrics: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFBF0E6),
      appBar: AppBar(
        backgroundColor: Color(0xFF211614),
        title: Text(
          songname,
          style: GoogleFonts.arbutusSlab(
            color: Colors.white,
            textStyle: TextStyle(
              fontSize: 24,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 16.0),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  lyric,
                  style: GoogleFonts.poppins(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF211614)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
