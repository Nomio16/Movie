import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie/model/index.dart';
import 'package:movie/widgets/movie_special_card.dart';
import 'package:movie/widgets/movie_card.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  Future<List<MovieModel>> _getDate() async{
    String res = await DefaultAssetBundle.of(context).loadString("assets/movie.json");
    return MovieModel.fromList(jsonDecode(res));

  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder( 
      future: _getDate(),
      builder:((context, snapshot) {
      if(snapshot.hasData){
        final _specialData = snapshot.data!.length > 3 ? snapshot.data!.sublist(0, 3):snapshot.data;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child:SingleChildScrollView(
          child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text("Шилдэг", style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white)
            ),
            SizedBox(height: 20,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    _specialData!.length,
                    (index)=> MovieSpecialCard(data: _specialData[index]),
                  ))
                ),
             SizedBox(height: 20,),
            Text("Бүх кинонууд", style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white)),
             SizedBox(height: 20,),
            Wrap(
              spacing: 20,
              children: 
                List.generate(
                  snapshot.data!.length,
                  (index)=> MovieCard(data: snapshot.data![index]),  
                )
              ,
            )
          ],
        )));
        }
        else{
          return Center(
            child: SizedBox( 
              height: 20,
              width: 20,
              child: CircularProgressIndicator(),)
              );
      }
      }),
      );
  }
}