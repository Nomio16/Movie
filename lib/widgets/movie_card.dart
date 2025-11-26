import 'package:flutter/material.dart';
import 'package:movie/model/index.dart';

class MovieCard extends StatelessWidget {
  final MovieModel data ;
  const MovieCard({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width/3-20;
    return Column(
      children: [Container(
        height: width*1.5,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(image:NetworkImage(data.imgUrl))
        ),
      ),
      SizedBox(
        width: width,
        child: Text(data.title, style: TextStyle(
          color: Colors.white.withOpacity(0.7),
        ),
        textAlign: TextAlign.center,)),
        SizedBox(height: 10,),
      ]
    );
  }
}