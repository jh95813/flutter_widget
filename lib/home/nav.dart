import 'package:flutter/material.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter_widget/bus/NavEvent.dart';
import 'package:flutter_widget/home/scrollContent.dart';
import 'package:flutter_widget/home/searchBar.dart';
import 'package:flutter_widget/model/category_model_entity.dart';
import 'package:flutter_widget/routers/StackNavBar.dart';

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
                    SearchBar(),
                    NotificationListener(
                        onNotification: (ScrollNotification notification) {
                          ScrollMetrics metrics = notification.metrics;
                          return true;
                        },
                        child: Expanded(
                          child: CategoryListWidget(),
                        ))
                  ],
                ),
              ))),
      ContentWidget()
    ])));
  }
  // Widget _navList()
}

class CategoryListWidget extends StatefulWidget {
  @override
  _CategoryList createState() => _CategoryList();
}

class _CategoryList extends State<CategoryListWidget> {
  List<CategoryModelEntity> _nav = <CategoryModelEntity>[
    CategoryModelEntity("首页推荐", "home", "test"),
    CategoryModelEntity("下载排行", "download", "test"),
  ];

  int _index = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _nav.length,
        itemBuilder: (BuildContext context, int i) {
          return Container(
            decoration: new BoxDecoration(
                color: _index == i ? Color.fromRGBO(206, 207, 207, 1) : null,
                borderRadius: new BorderRadius.all(new Radius.circular(6.0))),
            child: GestureDetector(
                onTap: () {
                  setState(() => _index = i);
                  final _navInfo =
                      NavEvent(_nav[i].label, _nav[i].value, _nav[i].icon);
                  eventBus.fire(_navInfo);
                },
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
                          _nav[i].label,
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(color: Color.fromRGBO(56, 56, 56, 1)),
                        ),
                      ],
                    ))),
          );
        });
  }
}

EventBus eventBus = new EventBus();

class ContentWidget extends StatefulWidget {
  @override
  _Content createState() => _Content();
}

class _Content extends State<ContentWidget> {
  String _test = '首页推荐';
  @override
  void initState() {
    eventBus.on<NavEvent>().listen((NavEvent data) => changeNavigator(data));
    super.initState();
  }

  changeNavigator(NavEvent value) {
    setState(() {
      _test = value.label.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(child: ScrollContent());
  }
}
