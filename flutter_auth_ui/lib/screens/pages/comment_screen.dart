import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_ui/controller/comment_controller.dart';
import 'package:flutter_auth_ui/widgets/text_input.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as tago;
class CommentScreen extends StatelessWidget {
  final String id;
  CommentScreen({
    required this.id}
      );
  final TextEditingController _commentController  = TextEditingController();

  CommentController commentController = Get.put(CommentController());


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    commentController.updatePostID(id);
    return Scaffold(
        body : SingleChildScrollView(
            child : SizedBox(
              width: size.width,
              height: size.height,
              child: Column(
                children: [
                  Expanded(
                    child: Obx(() {
                      return ListView.builder(shrinkWrap: true,itemCount: commentController.comments.length,itemBuilder: (context , index){
                        final comment  = commentController.comments[index];
                        return ListTile(
                          leading : CircleAvatar(

                            backgroundImage: NetworkImage('https://www.google.com/url?sa=i&url=https%3A%2F%2Funsplash.com%2Fs%2Fphotos%2Fnetwork&psig=AOvVaw1MxhXlNTZU-oP_EfCOE1qr&ust=1680777615047000&source=images&cd=vfe&ved=0CA8QjRxqFwoTCIDM-9TGkv4CFQAAAAAdAAAAABAE'),
                          ),
                          title: Row(
                            children: [
                              Text(comment.username , style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.redAccent
                              ),),
                              SizedBox(
                                width: 5,
                              ),
                              Text(comment.comment,  style: TextStyle(
                                fontSize: 13,

                              ),)
                            ],
                          ),
                          subtitle: Row(
                            children: [
                              Text(tago.format(comment.datePub.toDate()) , style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold
                              ),
                              ),
                              SizedBox(width: 5,),
                              Text("${comment.likes.length} Likes" , style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold
                              ), )
                            ],
                          ),
                          trailing: InkWell(
                              onTap: (){
                                commentController.likeComment(comment.id);
                              },
                              child: Icon(Icons.favorite , color : comment.likes.contains(FirebaseAuth.instance.currentUser!.uid) ? Colors.red : Colors.white)),
                        );
                      });
                    }
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title : TextInputField(controller: _commentController, myIcon: Icons.comment, myLabelText: "Comment"),
                    trailing: TextButton(
                      onPressed: (){
                        commentController.postComment(_commentController.text);
                      },
                      child: Text("Send"),
                    ),
                  )
                ],
              ),
            )
        )
    );
  }
}
