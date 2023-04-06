import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:flutter_auth_ui/controller/auth_controller.dart';

class ArtistPage extends StatefulWidget {
  @override
  _ArtistPageState createState() => _ArtistPageState();
  // const Account({super.key});
  final index;
  ArtistPage(this.index);
}

class _ArtistPageState extends State<ArtistPage> {
  List<String> img = [
    '././assets/images/kendrick.jpg',
    '././assets/images/ariana.jpg',
    '././assets/images/drake.jpg',
    '././assets/images/seedhe_maut.jpg',
    '././assets/images/weeknd.jpg',
  ];

  List<String> artistName = [
    'KENDRICK LAMAR',
    'ARIANA GRANDE',
    'DRAKE',
    'SEEDHE MAUT',
    'THE WEEKND',
  ];

  List<List<String>> albumName = [
    ['././assets/images/mrmorale.jpg', '././assets/images/damn.jpg', '././assets/images/tpab.jpg'],
    ['././assets/images/positions.jpg', '././assets/images/thankyou.jpg', '././assets/images/sweetner.jpg'],
    ['././assets/images/honestly.png', '././assets/images/certified.png', '././assets/images/darklane.png'],
    ['././assets/images/nayaab.jpg', '././assets/images/n.jpg', '././assets/images/bayaan.jpg'],
    ['././assets/images/dawn.png', '././assets/images/afterhours.jpg', '././assets/images/starboy.png']
  ];

  AudioPlayer? _audioPlayer;
  final Source _filePath = AssetSource('././assets/audio.mp3');
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
  }

  Future<void> _playAudio() async {
    if (!_isPlaying) {
      await _audioPlayer?.play(_filePath);
      setState(() {
        _isPlaying = true;
      });
    } else {
      await _audioPlayer?.pause();
      setState(() {
        _isPlaying = false;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFBF0E6),
        body: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 600,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(img[widget.index]),
                        fit: BoxFit.cover),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: Text(artistName[widget.index], style: TextStyle(color: Color(0xFF211614), fontSize: 20, fontFamily: 'ArbutusSlab'),),
                ),
                Container(
                  height: 150, // Set the height of the row widget
                  child: ListView(
                    scrollDirection:
                        Axis.horizontal, // Set the direction of the scroll
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(albumName[widget.index][0]), fit: BoxFit.cover),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        // color: Colors.red,
                        ),
                        margin: EdgeInsets.all(10),
                        width: 150,
                      ),
                      
                          Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(albumName[widget.index][1]),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            // color: Colors.blue,
                          ),
                          margin: EdgeInsets.all(10),
                          width: 150,
                        ),
                      
                      
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(albumName[widget.index][2]),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          // color: Colors.green,
                        ),
                        margin: EdgeInsets.all(10),
                        width: 150,
                      ),
                      
                    ],
                  ),
                )
              ],
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 40, left: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color(0xFF211614)
                  ),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    color: Color(0xFFFBF0E6),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                SizedBox(
                  height: 400,
                ),
                Container(
                  margin: EdgeInsets.only(top: 40, left: 40),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color(0xFF211614)
                  ),
                  child: IconButton(
                    icon: Icon(
                      _isPlaying ? Icons.pause : Icons.play_arrow,
                    ),
                    color: Color(0xFFFBF0E6),
                    onPressed: _playAudio,
                  ),
                ),
              ],
            ),
          ],
        ));
  }
  @override
  void dispose() {
    _audioPlayer?.release();
    super.dispose();
  }

}
