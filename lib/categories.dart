import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/Wallpaper.dart';
import 'trenddingall.dart';
class categories extends StatefulWidget {
  @override
  _categoriesState createState() => _categoriesState();
}

class _categoriesState extends State<categories> {
  final List<String> _categoryName = [
    'Blackpink',
    'Fan Art',
    'Jennie',
    'Jisoo',
    'Lisa',

    'Recent',
    'Rose'
  ];
  final List<String> _categoryImg= [
    '1468_1 (79).jpg',
    '65951_1 (28).jpg',
    '18231_58812224_2116404605147768_4410545315403298912_n.jpg',
    '79110_Screenshot_17.png',
    '34944_1 (157).jpg',
    '80405_66661985_334284147522963_5233991014220748371_n.jpg',
    '92744_67232335_1328218150688650_8986836274686786380_n.jpg'
  ];

  final String nameContext= '2';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 2;
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Categories",
                    style: TextStyle(
                        fontFamily: "Sans",
                        fontSize: 32,
                        fontWeight: FontWeight.bold),
                  ),
                )),
            GridView.builder(
                itemCount: _categoryName.length,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                              elevation: 10,
                              shape: BeveledRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              child: Container(
                                width: width,
                                height: width - 50,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context) =>
                                              All(_categoryName[index],_categoryName[index])));
                                    },
                                    child: FadeInImage(
                                      image: NetworkImage(
                                          'http://henhongay.com/blackpink-wallpapers-hd-2019/upload/'+_categoryImg[index]
                                              ),
                                      fit: BoxFit.cover,
                                      placeholder:
                                          AssetImage('assets/images/loading.gif'),
                                    ),
                                  ),
                                ),
                              )),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) =>
                                    All(_categoryName[index],_categoryName[index])));
                          },
                          child: Text(
                            _categoryName[index],
                            style: TextStyle(
                                fontFamily: "Sans",
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
