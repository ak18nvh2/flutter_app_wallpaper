import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  List<String> name = ["Theme", "About"];
  List<IconData> nameIcon = [Icons.brightness_4, Icons.info_outline];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        child: ListView.builder(
            itemCount: name.length,
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Icon(
                      nameIcon[index],
                      color: Colors.pink,
                      size: 24.0,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Text(
                      name[index],
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          fontFamily: "Sans"),
                    ),
                  ),

                ],
              );
            }),
      ),
    );
  }
}
