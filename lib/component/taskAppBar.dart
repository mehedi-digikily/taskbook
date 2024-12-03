import 'package:flutter/material.dart';
import 'package:note/styel/style.dart';

AppBar taskAppBar(){
  return AppBar(
    backgroundColor: colorGreen,
    flexibleSpace: Container(
      alignment: Alignment.topCenter,
      margin: const EdgeInsets.fromLTRB(10, 40, 10, 0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 24,
            child: ClipOval(
              // child: Image.memory(ShowBase64Image('')),
            ),
          ),
          const SizedBox(height: 10,),
           Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Mehedi Hasan',style: Head7Text(colorWhite),),
              Text('info.itsmehedi@gmail.com',style: Head9Text(colorWhite),),
            ],
          ),
        ],
      ),
    ),
    actions: [
      IconButton(onPressed: (){}, icon: Icon(Icons.add_circle)),
      IconButton(onPressed: (){}, icon: Icon(Icons.login_outlined)),
    ],
  );
}