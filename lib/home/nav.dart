import 'package:flutter/material.dart';

class Nav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: new Row(children: [
      Container(
        width: 220,
        decoration: BoxDecoration(
          color: Color.fromRGBO(231, 233, 233, 1), // 底色
          boxShadow: [
            BoxShadow(
              blurRadius: 3, //阴影范围
              spreadRadius: 1, //阴影浓度
              color: Colors.grey, //阴影颜色
            ),
          ],
        ),
        child: new Column(
          children: [
            TextFileWidget(),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.star,
                      color: Colors.black,
                      size: 15,
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    title: Text("首页"),
                  ),
                ],
              ),
            ),
          ],
        ),
        // Expanded(
        //     child: ListView(
        //   children: [
        //     ListTile(
        //       title: Text("视频背景登录"),
        //       trailing: Icon(
        //         Icons.keyboard_arrow_right,
        //         color: Colors.black,
        //       ),
        //     ),
        //   ],
        // )),
      )
    ])));
  }
}

class TextFileWidget extends StatelessWidget {
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
              size: 20,
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
          height: 28,
          child: buildTextField(),
        ))
      ]);
    }

    return Padding(padding: EdgeInsets.all(10), child: editView());
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: editView(),
          flex: 1,
        ),
      ],
    );
  }
}
