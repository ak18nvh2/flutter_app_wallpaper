import 'package:flutter/material.dart';

import 'categories.dart';
import 'home.dart';

class Img extends StatefulWidget {
  final String nameImg;
  final String linkImg;
  final String whereStart;
  const Img(this.nameImg, this.linkImg, this.whereStart);
  @override
  _ImgState createState() => _ImgState();
}

class _ImgState extends State<Img> {
  @override
  Widget build(BuildContext context) {
    double height= MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage('http://henhongay.com/blackpink-wallpapers-hd-2019/upload/'+widget.linkImg),
        fit: BoxFit.cover,
            height: double.infinity,
            placeholder: AssetImage('assets/images/loading.gif'),
          ),
          Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GestureDetector(
                      onTap: (){
                        if(widget.whereStart=='1')
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) =>
                                  Home()));
                        else if(widget.whereStart=='2')
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) =>
                                  categories()));


                      },
                      child: Icon(
                        Icons.cancel,
                        size: 64,
                      ),
                    ),
                  ),
                ],
              ),
              Stack(
                children: <Widget>[
                  Container(
                    height: height/6,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: Colors.black.withOpacity(0.4)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding:  EdgeInsets.only(left: 32.0, top: 16),
                              child: Text(widget.nameImg, style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  fontFamily: "Sans"),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Icon(
                                Icons.image,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Icon(
                                Icons.open_in_new,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Icon(
                                Icons.file_download,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),

                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 16.0,
                    top: 0.0,
                    child: FloatingActionButton(
                      tooltip: 'Set as Wallpaper',
                      backgroundColor: Colors.black,
                      child: Icon(
                        Icons.format_paint,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  )
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
