import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflixclone/DetailsPage.dart';
import 'package:netflixclone/modal/TvShow.dart';
import 'package:netflixclone/modal/showResponse.dart';


class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  List<TvShow> result=[];

  @override
  Widget build(BuildContext context) {

    double _width=MediaQuery.of(context).size.width;
    double _height=MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Padding(
            padding:EdgeInsets.only(left: 20),
            child: Image.asset("assets/netflix.png")),

        actions: [
          IconButton(onPressed: (){


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

      body: CustomScrollView(

        slivers: [

         SliverToBoxAdapter(
           child:  Container(

             margin: EdgeInsets.symmetric(horizontal: 20,vertical: 30),

             child: TextField(


               onChanged: (str){
                 searchData(searchTerm: str);
               },
               decoration: InputDecoration(

                 prefixIcon: Icon(Icons.search),
               filled: true,
                   border: OutlineInputBorder()
               ),
             ),
           ),
         ),


          SliverToBoxAdapter(
            child: SizedBox(
              height: _height,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  if (result.isEmpty || result.length == 0) {
                    return SizedBox();
                  }

                  return InkWell(
                    onTap: (){
                      print("clicked");
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsPage(show: result[index],)));
                    },

                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical:10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // Left content
                          Expanded(
                            flex: 2,  // Adjust the flex to control the space for content
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0,left: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    result[index].show!.name ?? 'No Name',  // Show name on the left
                                    style: GoogleFonts.aBeeZee(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.white
                                    ),
                                  ),
                                  Text(
                                    result[index].show!.language ?? 'No Language', // Show language on the left
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  // Add any other content you need on the left side
                                ],
                              ),
                            ),
                          ),

                          // Right image
                          Expanded(
                            flex: 1,  // Adjust the flex to control the space for the image
                            child: Image.network(
                              result[index].show!.image!.original,
                              width: _width / 3, // Set the width based on screen size
                              height: _height / 6, // Set the height based on screen size
                              fit: BoxFit.cover,  // Adjust the image fit if necessary
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: result.length,
              ),
            ),
          ),

        ],
      ),


    );
  }


  Future<void> searchData({required String searchTerm}) async
  {
    final Dio dio=Dio(
        BaseOptions(
            headers: {
              'Content-Type':'application/json'
            }
        )
    );

    Response res=await dio.get("https://api.tvmaze.com/search/shows?q=$searchTerm");

    List data=res.data;
    result=data.map((val)=>TvShow.fromJson(val)).toList();

    print(data);
    print(result);
    setState(() {
      result;
    });
  }
}
