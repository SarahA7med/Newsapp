import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/cubit.dart';
import 'package:newsapp/cubit/states.dart';

Widget buildArticleItem(article,context)=>Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children: [
      Container(
        width: 120.0,
        height: 120.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: NetworkImage('${article['urlToImage']}'),
            fit: BoxFit.cover
          )
        ),
      ),
      SizedBox(
        width: 20.0,
      ),
      Expanded(
        child: Container(
          height: 120.0,
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  '${article['title']}',
                  style: Theme.of(context).textTheme.bodyText1,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),

              ),
              Text(
                '${article['publishedAt']}',
                style: TextStyle(
                    color: Colors.grey
                ),
              ),
            ],
          ),

        ),
      )
    ],
  ),
);
Widget myDivider()=>Container(
  width: double.infinity,
  height: 1.0,
  color: Colors.grey[300],
);
Widget articleBuilder(list,context)=>ConditionalBuilder(
    condition: list.length>0 ,
    builder:(context)=> ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder:(context,index)=> buildArticleItem(list[index],context),
      separatorBuilder: (context,index)=>myDivider(),
      itemCount: 10,),
    fallback: (context)=> Center(child: CircularProgressIndicator(),));
