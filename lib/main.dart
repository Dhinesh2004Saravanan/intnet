import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

import 'package:netflixclone/modal/TvShow.dart';

import 'HomePage.dart';

void main() {
  runApp(const SplashScreen());
}



class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashContent(),
    );
  }
}


class SplashContent extends StatefulWidget {
  const SplashContent({super.key});

  @override
  State<SplashContent> createState() => _SplashContentState();
}



class _SplashContentState extends State<SplashContent> {



 late  VideoPlayerController _videoController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();




    // initialise a videoPlayer
    _videoController=VideoPlayerController.asset("assets/netflix.webm");

    _videoController.initialize().then((val){
      setState(() {});

      _videoController.play();
    });



    _videoController.addListener((){
      if(_videoController.value.position>=_videoController.value.duration)
        {
          Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>(HomePage())));
        }
    });
  }


 @override
 void dispose() {
   _videoController.dispose(); // Dispose of the controller when done
   super.dispose();
 }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.black,


      body: SizedBox.expand(
        child: Center(
          child: VideoPlayer(_videoController)

        ),
      ),
    );
  }
}



