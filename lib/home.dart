import 'dart:math';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_app/trenddingall.dart';
import 'Wallpaper.dart';
import 'img.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<MaterialWallpaper> _trendingImages = [];

  List<MaterialWallpaper> _popularImages = [];
  final rng = new Random();
  final String nameContext= '1';
  @override
  void initState() {
    // TODO: implement initState
    loadAsset('Lisa').then((value) {
      setState(() {
        final index = rng.nextInt(value.materialWallpaper.length - 10);
        _popularImages = value.materialWallpaper.sublist(index, index + 5);
      });
    });
    loadAsset('Blackpink').then((value) {
      setState(() {
        final index = rng.nextInt(value.materialWallpaper.length - 10);
        _trendingImages = value.materialWallpaper.sublist(index, index + 10);
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(

        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Trending",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
                            fontFamily: "Sans"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: GestureDetector(
                        child: Text("See all"),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      All('Lisa','Trending')));
                        },
                      ),
                    ),
                  ],
                ),
                CarouselSlider(
                  items: _popularImages.map((item) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          height: 200,
                          width: width * 2 / 2.8,
                          child: Card(
                              elevation: 10,
                              shape: BeveledRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context) =>
                                              Img(item.catName,item.images,nameContext)));
                                    },
                                    child: FadeInImage(
                                      image: NetworkImage(
                                          'http://henhongay.com/blackpink-wallpapers-hd-2019/upload/' +
                                              item.images),
                                      fit: BoxFit.cover,
                                      placeholder:
                                          AssetImage('assets/images/loading.gif'),
                                    ),
                                  ))),
                        );
                      },
                    );
                  }).toList(),
                  options: CarouselOptions(
                    autoPlay: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "Popular",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 32,
                              fontFamily: "Sans"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: GestureDetector(child: Text("See all"),onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      All('Blackpink','Popular')));
                        },),
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                    itemCount: _trendingImages.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            bottom: 8.0, left: 8, right: 8),
                        child: Container(
                          width: double.infinity,
                          height: 200,
                          child: Card(
                              elevation: 10,
                              shape: BeveledRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context) =>
                                            Img(_trendingImages[index].catName,_trendingImages[index].images,nameContext)));
                                  },
                                  child: FadeInImage(
                                    image: NetworkImage(
                                        'http://henhongay.com/blackpink-wallpapers-hd-2019//upload/' +
                                            _trendingImages[index].images),
                                    fit: BoxFit.cover,
                                    placeholder:
                                        AssetImage('assets/images/loading.gif'),
                                  ),
                                ),
                              )),
                        ),
                      );
                    })
              ],
            ),
          ),
        ));
  }
}
