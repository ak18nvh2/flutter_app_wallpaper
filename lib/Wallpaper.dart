import 'dart:convert';

import 'package:flutter/services.dart';

class MyWallpaper {
  List<MaterialWallpaper> materialWallpaper;

  MyWallpaper({this.materialWallpaper});

  MyWallpaper.fromJson(Map<String, dynamic> json) {
    if (json['MaterialWallpaper'] != null) {
      materialWallpaper = new List<MaterialWallpaper>();
      json['MaterialWallpaper'].forEach((v) {
        materialWallpaper.add(new MaterialWallpaper.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.materialWallpaper != null) {
      data['MaterialWallpaper'] =
          this.materialWallpaper.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MaterialWallpaper {
  String images;
  String catName;
  String cid;
  String categoryImage;

  MaterialWallpaper({this.images, this.catName, this.cid, this.categoryImage});

  MaterialWallpaper.fromJson(Map<String, dynamic> json) {
    images = json['images'];
    catName = json['cat_name'];
    cid = json['cid'];
    categoryImage = json['category_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['images'] = this.images;
    data['cat_name'] = this.catName;
    data['cid'] = this.cid;
    data['category_image'] = this.categoryImage;
    return data;
  }
}

Future<MyWallpaper> loadAsset(String name) async {
  String jsonString = await rootBundle.loadString('assets/fixture/$name.json');
  dynamic jsonParser = jsonDecode(jsonString);
  MyWallpaper wallpapers = MyWallpaper.fromJson(jsonParser);
  return wallpapers;
}
