import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflixclone/modal/TvShow.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsPage extends StatefulWidget {

  late TvShow show;
   DetailsPage({required this.show, super.key});


  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(widget.show.show!.image!.original),
              SizedBox(height: 16),
              Text(
                widget.show.show!.name,
                style: GoogleFonts.aBeeZee(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.white),
              ),
              SizedBox(height: 8),
              Text("Type: ${widget.show.show!.type}",style: TextStyle(color: Colors.white),),
              Text("Language: ${widget.show.show!.language}",style: TextStyle(color: Colors.white),),
              Text("Status: ${widget.show.show!.status}",style: TextStyle(color: Colors.white),),
              Text("Runtime: ${widget.show.show!.runtime} mins",style: TextStyle(color: Colors.white),),
              SizedBox(height: 8),
              Text(
                "Rating: ${widget.show.show!.averageRating ?? 'N/A'}",
                style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold,color: Colors.white),
              ),
              SizedBox(height: 16),
              Wrap(
                spacing: 8.0,
                children: widget.show.show!.genres
                    .map((genre) => Chip(label: Text(genre)))
                    .toList(),
              ),
              SizedBox(height: 16),
              Text(
                "Summary",
                style: GoogleFonts.aBeeZee(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
              ),
              SizedBox(height: 8),
              Text(
                widget.show.show!.summary.replaceAll(RegExp(r'<[^>]*>'), ''),
                  style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 16),
              if (widget.show.show!.officialSite!.isNotEmpty)
                ElevatedButton(
                  onPressed: () async{

                   try
                       {
                         final Uri uri = Uri.parse(widget.show.show!.officialSite!);
                         if (await canLaunchUrl(uri)) {
                           await launchUrl(uri);
                         } else {
                           throw 'Could not launch $uri';
                         }
                       }
                       catch(e)
                    {
                      print(e);
                    }

                  },
                  child: Text("Visit Official Site"),
                ),
            ],
          ),
        ),
      ),




    );
  }
}
