

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflixclone/DetailsPage.dart';
import 'package:netflixclone/searchPage.dart';

import 'modal/TvShow.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  List<TvShow> showDatas=[];
  int selectedIndex=0;




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllData();
  }
  @override
  Widget build(BuildContext context) {

    double _width=MediaQuery.of(context).size.width;
    double _height=MediaQuery.of(context).size.height;
    return (showDatas.length==0)?Container():

      Scaffold(
      backgroundColor: Colors.black,


      body:

      (selectedIndex==0) ? CustomScrollView(
        slivers: [
          // * specify the appbar

          SliverAppBar(
            backgroundColor: Colors.black,
            leading: Padding(
                padding:EdgeInsets.only(left: 20),
                child: Image.asset("assets/netflix.png")),

            actions: [
              IconButton(onPressed: (){

                setState(() {
                  selectedIndex=1;
                });
              }, icon: Icon(FontAwesomeIcons.search,color: Colors.white,)),
              SizedBox(width: 2,),
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Image.asset("assets/usericon.png"),
              )
            ],

          ),


          // Make a list of items


          SliverToBoxAdapter(

            child: Padding(
              padding: EdgeInsets.only(left:10,bottom: 20,top: 10 ),
              child: Text("Today Trending Movie ,",style: GoogleFonts.lexend(
                  color: Colors.white,
                  fontSize: 20
              ),),
            ),
          ),

          SliverToBoxAdapter(
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsPage(show: showDatas[0])));
              },
              child: Padding(
                  padding: EdgeInsets.symmetric(

                  ),
                  child:

                  (showDatas.isEmpty)?(Container()):
                  Image.network(showDatas[0].show!.image!.original,height: _height/2,fit: BoxFit.fill,)
              ),
            ),

          ),



          SliverToBoxAdapter(

            child: Padding(
              padding: EdgeInsets.only(left:10,bottom: 20,top: 10 ),
              child: Text("Drama Movies ,",style: GoogleFonts.lexend(
                  color: Colors.white,
                  fontSize: 20
              ),),
            ),
          ),


          // Drama movies
          SliverToBoxAdapter(
            child: SizedBox(
              height: _height/4, // Set the height for horizontal scrolling content
              child: ListView.builder(
                scrollDirection: Axis.horizontal, // Enable horizontal scrolling
                itemCount: showDatas.length,

                itemBuilder: (context, index) {
                  return (showDatas[index].show!.genres.contains("Drama")) ?Padding(

                    padding: const EdgeInsets.only(left: 8,right: 8),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsPage(show: showDatas[index])));
                      },
                      child: Image.network(
                        showDatas[index].show!.image!.original,
                        width: _width/3,

                        fit: BoxFit.fill,


                      ),
                    ),
                  ) :SizedBox();
                },
              ),
            ),
          ),

          // * Sports



          SliverToBoxAdapter(

            child: Padding(
              padding: EdgeInsets.only(left:10,bottom: 20,top: 10 ),
              child: Text("Sports Movies ,",style: GoogleFonts.lexend(
                  color: Colors.white,
                  fontSize: 20
              ),),
            ),
          ),


          // Sports movies
          SliverToBoxAdapter(
            child: SizedBox(
              height:_height/4, // Set the height for horizontal scrolling content
              child: ListView.builder(
                scrollDirection: Axis.horizontal, // Enable horizontal scrolling
                itemCount: showDatas.length,

                itemBuilder: (context, index) {
                  return (showDatas[index].show!.genres.contains("Sports")) ?Padding(

                    padding: const EdgeInsets.only(left: 8,right: 8),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsPage(show: showDatas[index])));


                      },
                      child: Image.network(
                        showDatas[index].show!.image!.original,
                        width: _width/3,

                        fit: BoxFit.fill,


                      ),
                    ),
                  ) :SizedBox();
                },
              ),
            ),
          ),


          // ! Documentary


          SliverToBoxAdapter(

            child: Padding(
              padding: EdgeInsets.only(left:10,bottom: 20,top: 10 ),
              child: Text("Movies For Kids ,",style: GoogleFonts.lexend(
                  color: Colors.white,
                  fontSize: 20
              ),),
            ),
          ),


          // Sports movies
          SliverToBoxAdapter(
            child: SizedBox(
              height: _height/4, // Set the height for horizontal scrolling content
              child: ListView.builder(
                scrollDirection: Axis.horizontal, // Enable horizontal scrolling
                itemCount: showDatas.length,

                itemBuilder: (context, index) {
                  return (showDatas[index].show!.genres.contains("Children")) ?Padding(

                    padding: const EdgeInsets.only(left: 8,right: 8),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsPage(show: showDatas[index])));

                      },
                      child: Image.network(
                        showDatas[index].show!.image!.original,
                        width: _width/3,

                        fit: BoxFit.fill,


                      ),
                    ),
                  ) :SizedBox();
                },
              ),
            ),
          ),


          // ! English


          SliverToBoxAdapter(

            child: Padding(
              padding: EdgeInsets.only(left:10,bottom: 20,top: 10 ),
              child: Text("Top English Movies ,",style: GoogleFonts.lexend(
                  color: Colors.white,
                  fontSize: 20
              ),),
            ),
          ),


          SliverToBoxAdapter(
            child: SizedBox(
              height: _height/4, // Set the height for horizontal scrolling content
              child: ListView.builder(
                scrollDirection: Axis.horizontal, // Enable horizontal scrolling
                itemCount: showDatas.length,
                itemBuilder: (context, index) {

                  var show = showDatas[index].show;

                  if (show != null && show.language != null && show.language!.contains("English") && show.image != null) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsPage(show: showDatas[index])));
                          // Handle tap event
                        },
                        child: Image.network(
                          show.image!.original, // Use null-aware access
                          width: _width/3,
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
                  } else {
                    // Return an empty SizedBox if conditions are not met
                    return SizedBox();
                  }
                },
              ),
            ),
          ),





        ],
      ) :

      SearchPage()
      ,



      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          currentIndex: selectedIndex,
          type: BottomNavigationBarType.fixed,




          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,

          onTap: (index){
            setState(() {
              selectedIndex=index;
            });
            print(selectedIndex);


          },
          items: [


            BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search,),label: "Search"),


          ]),








    );
  }



  Future<void> getAllData() async{

    final Dio dio=Dio(
        BaseOptions(
            headers: {
              'Content-Type':'application/json'
            }
        )
    );

    Response res=await dio.get("https://api.tvmaze.com/search/shows?q=all");



    List listData=res.data;


    showDatas=listData.map((e)=>TvShow.fromJson(e)).toList();
    print(showDatas);

    setState(() {
      showDatas;
    });


  }
}
