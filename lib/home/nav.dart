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
          child: NotificationListener(
              onNotification: (ScrollNotification notification) {
                ScrollMetrics metrics = notification.metrics;
                return true;
              },
              child: Padding(
                padding: EdgeInsets.all(10),
                child: new Column(
                  children: [
                    TextFileWidget(),
                    NotificationListener(
                        onNotification: (ScrollNotification notification) {
                          ScrollMetrics metrics = notification.metrics;
                          return true;
                        },
                        child: Expanded(
                          child: CategoryListWidget(),
                        ))

                    // ListView.builder(
                    //     itemCount: listJSON.length,
                    //     itemBuilder: (BuildContext context, int i) {
                    //       return Container(
                    //           decoration: new BoxDecoration(
                    //               color: index == i ? Colors.red : null),
                    //           child: ListTile(
                    //             contentPadding:
                    //                 EdgeInsets.symmetric(horizontal: 20),
                    //             title: Align(
                    //               child: Text(listJSON[i]['label']),
                    //               alignment: Alignment(-1.6, 0),
                    //             ),
                    //             leading: Icon(Icons.star_border,
                    //                 size: 17,
                    //                 color: Color.fromRGBO(30, 144, 244, 1)),
                    //           ));
                    //     })
                    // child: ListView(
                    //   children: [
                    //     ListTile(
                    //       contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    //       title: Align(
                    //         child: Text("首页"),
                    //         alignment: Alignment(-1.6, 0),
                    //       ),
                    //       leading: Icon(Icons.star_border,
                    //           size: 17, color: Color.fromRGBO(30, 144, 244, 1)),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ))

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
  // Widget _navList()
}

class CategoryListWidget extends StatefulWidget {
  @override
  _CategoryList createState() => _CategoryList();
}

class _CategoryList extends State<CategoryListWidget> {
  var categoryListData = ['首页推荐', '下载排行'];
  double index = 0;
  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: categoryListData.length,
        itemBuilder: (BuildContext context, int i) {
          return Container(
              decoration: new BoxDecoration(
                  color: index == i ? Color.fromRGBO(206, 207, 207, 1) : null,
                  borderRadius: new BorderRadius.all(new Radius.circular(6.0))),
              child: Padding(
                  padding: EdgeInsets.only(
                      left: 5.0, right: 10.0, top: 8, bottom: 8),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          right: 3.0,
                        ),
                        child: Icon(
                          Icons.star_border,
                          size: 17,
                          color: Color.fromRGBO(30, 144, 244, 1),
                        ),
                      ),
                      Text(
                        categoryListData[i],
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Color.fromRGBO(56, 56, 56, 1)),
                      ),
                    ],
                  )));

          // ListTile(
          //   contentPadding:
          //       EdgeInsets.symmetric(horizontal: 20),
          //   title: Align(
          //     child: Text(listJSON[i]['label']),
          //     alignment: Alignment(-1.6, 0),
          //   ),
          //   leading: Icon(Icons.star_border,
          //       size: 17,
          //       color: Color.fromRGBO(30, 144, 244, 1)),
          // ));
        });
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
