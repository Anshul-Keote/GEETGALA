import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import '../artist_page.dart';
import 'package:flutter_auth_ui/screens/pages/comment_screen.dart';
// import 'package:tiktok_yt/view/screens/profile_screen.dart';
// import 'package:tiktok_yt/view/widgets/AlbumRotator.dart';
// import 'package:tiktok_yt/view/widgets/ProfileButton.dart';
import 'package:flutter_auth_ui/widgets/TikTokVideoPlayer.dart';
import 'package:get/get.dart';
import '../../controller/video_controller.dart';
import 'package:flutter_auth_ui/screens/lyrics.dart';


class DisplayVideo_Screen extends StatelessWidget {
  DisplayVideo_Screen({Key? key}) : super(key: key);

  final VideoController videoController = Get.put(VideoController());


  Future<void> share(String vidId) async {
    await FlutterShare.share(
      title: 'Geetgala',
      text: 'Watch Intresting short videos On ',
    );
    videoController.shareVideo(vidId);
  }


  @override
  Widget build(BuildContext context) {



    return Scaffold(
      body: Obx(() {
        return PageView.builder(
            scrollDirection: Axis.vertical,
            controller: PageController(initialPage: 0, viewportFraction: 1),
            itemCount: videoController.videoList.length,
            itemBuilder: (context, index) {
              final data = videoController.videoList[index];
              return InkWell(
                onDoubleTap: (){
                  videoController.likedVideo(data.id);
                },
                child: Stack(
                  children: [
                    TikTokVideoPlayer(
                      videoUrl: data.videoUrl,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.only(bottom: 50, left: 15),
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: Color(0xFF211614)
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // Text(
                                  //   data.username,
                                  //   style: TextStyle(
                                  //       fontWeight: FontWeight.w500, fontSize: 20),
                                  // ),
                                  Text(
                                    data.caption,
                                    style: TextStyle(color: Color(0xFFFBF0E6)),
                                  ),
                                  Text(
                                    data.songName,
                                    style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFFBF0E6)),
                                  )
                                ],
                              ),
                            ),
                        ),
                      ],
                    ),
                    Positioned(
                      right : 0 ,
                      top : 200,
                      child: Container(
                        height: MediaQuery.of(context).size.height - 400,
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 3, right: 10),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [

                            // InkWell(
                            //   onTap: (){
                            //     // Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen(uid: data.uid,)));
                            //   },
                            //   // child: ProfileButton(
                            //   // profilePhotoUrl: data.profilePic,
                            //   // ),
                            // ),

                            Padding(
                              padding: const EdgeInsets.fromLTRB(16.0,0,0,0),
                              child: InkWell(
                                onTap: (){
                                  Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ArtistPage(2)));
                                },
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.album,
                                      size: 45,
                                      color: data.likes.contains(FirebaseAuth.instance.currentUser!.uid) ?  Colors.pinkAccent : Colors.white ,
                                    ),
                                  
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(height: 50,),
                            Padding(
                              padding: EdgeInsets.fromLTRB(16, 0,0,0),
                              child: InkWell(
                                onTap: (){
                                  share(data.id);
                                },
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.reply,
                                      size: 45,
                                      color: Colors.white,
                                    ),
                                    
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 50,),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16,0,0,0),
                              child: InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Lyrics()));
                                },
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.lyrics_outlined,
                                      size: 45,
                                      color: Colors.white,
                                    ),
                                    
                            
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            });
      }
      ),
    );
  }
}
