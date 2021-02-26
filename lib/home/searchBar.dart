import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  Widget buildTextField() {
    //theme设置局部主题
    return TextField(
        cursorColor: Color.fromRGBO(91, 93, 93, 1), //设置光标
        textAlign: TextAlign.left,
        decoration: InputDecoration(
            //输入框decoration属性
//            fillColor: Colors.white,
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(bottom: 14),
//            icon: Icon(Icons.search),
//            icon: ImageIcon(AssetImage("image/search_meeting_icon.png",),),
            icon: Icon(
              Icons.search,
              color: Color.fromRGBO(91, 93, 93, 1),
              size: 18,
            ),
            hintText: "搜索",
            hintStyle: new TextStyle(
                fontSize: 14, color: Color.fromRGBO(91, 93, 93, 1))),
        style:
            new TextStyle(fontSize: 14, color: Color.fromRGBO(91, 93, 93, 1)),
        textAlignVertical: TextAlignVertical.center);
  }

  @override
  Widget build(BuildContext context) {
    Widget editView() {
      return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Expanded(
            child: Container(
          //修饰黑色背景与圆角
          padding: EdgeInsets.only(left: 10.0, right: 10.0),

          ///Alignment 用来对齐 Widget
          decoration: new BoxDecoration(
            color: Color.fromRGBO(218, 220, 220, 1),
            borderRadius: new BorderRadius.all(new Radius.circular(6.0)),
          ),
          height: 30,
          child: buildTextField(),
        ))
      ]);
    }

    return Padding(
        padding: EdgeInsets.only(top: 10.0, bottom: 10.0), child: editView());
  }
}
