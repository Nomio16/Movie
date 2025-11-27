import 'package:flutter/material.dart';
import 'package:movie/model/index.dart';
import 'package:movie/screens/movie_detail.dart';

class MovieSpecialCard extends StatelessWidget {
  final MovieModel data;
  const MovieSpecialCard({required this.data, super.key});

  void _onCardTap(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => MovieDetailPage( data),));
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.5;    
    return InkWell(
      onTap:()=> _onCardTap(context),
      child:Container(
      width: width,
      height: width*1.5,
      margin: EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(image:NetworkImage(data.imgUrl))
      ),
      child: Icon(
        Icons.play_circle,
        color: Colors.grey.withOpacity(0.8),
        size: 60,
      ),
    ));  
  }
}