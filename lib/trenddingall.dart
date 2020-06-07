import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_app/Wallpaper.dart';
import 'img.dart';
class All extends StatefulWidget {
  final String ten;
  final String nameAppBar;
 const  All( this.ten, this.nameAppBar);
  @override
  _AllState createState() => _AllState();
}

class _AllState extends State<All> {

  List<MaterialWallpaper> all = [];
  @override
  void initState() {
    // TODO: implement initState

    loadAsset(widget.ten).then((value) {
      setState(() {
        all = value.materialWallpaper;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final String nameContext= 'All';
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 5,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/images/logo.png',
                width: 50,
              ),
            ),
            Text(
              widget.nameAppBar,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  fontFamily: "Sans"),
            )
          ],
        ),
      ),
      body: StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        itemCount: all.length,
        itemBuilder: (BuildContext context, int index) => new Container(
          child: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) =>
                      Img(all[index].catName,all[index].images,nameContext)));
            },
            child: FadeInImage(
              placeholder: AssetImage('assets/images/loading.gif'),
              image: NetworkImage(
                  'http://henhongay.com/blackpink-wallpapers-hd-2019/upload/' +
                      all[index].images),
              fit: BoxFit.cover,
            ),
          ),
        ),
        staggeredTileBuilder: (int index) =>
            new StaggeredTile.count(2, index.isEven ? 2 : 1),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ),
    );
  }
}
