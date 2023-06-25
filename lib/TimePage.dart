import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'color.dart';
import 'package:flutter/cupertino.dart';

class TimePage extends StatefulWidget {
  final String title; // title 매개변수 추가

  TimePage({required this.title}); // 생성자 추가

  @override
  State<TimePage> createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0),
          child: AppBar(
            automaticallyImplyLeading: false,
            flexibleSpace: Container(),
            title: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(height: 10),
                  Text(
                    widget.title, // widget.title로 변경
                    style: TextStyle(color: Palette.everyPink, fontSize: 13),
                  ),
                  Text(
                    widget.title, // widget.title로 변경
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 23),
                  ),
                ],
              ),
            ),
            backgroundColor: Colors.white,
            elevation: 0.0,
            centerTitle: false,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TimePage(title: '새로운 시간표'))); // 새로운 시간표 추가
                },
                icon: Icon(
                  CupertinoIcons.plus_square,
                ),
                color: Colors.black,
              ),
            ],
          ),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 400,
                          margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              myTable("월", Color(0xffe28b7b),
                                  startnum: 27, endnum: 50, subject: "운영체제"),
                              myTable("화", Color(0xff90cec1),
                                  startnum: 42, endnum: 59, subject: "알고리즘"),
                              myTable("수", Color(0xff90cec1),
                                  startnum: 13, endnum: 20, subject: "알고리즘"),
                              myTable(
                                "목",
                                Colors.grey.shade300,
                              ),
                              myTable("금", Color(0xffffc476),
                                  startnum: 1, endnum: 29, subject: "자료구조"),
                            ],
                          ),
                        ),
                      ]),
                ))));
  }
}

Widget myTable(String week, Color col,
    {int startnum = 0, int endnum = 0, String subject = ""}) {
  return Expanded(
    child: Table(
      border: TableBorder(
          right: BorderSide(
              color: week == "금" ? Colors.transparent : Colors.grey.shade300)),
      children: [
        TableRow(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            children: [
              Container(
                  height: 30.0,
                  child: Center(
                      child: Text(
                    week,
                  ))),
            ]),
        for (int i = 0; i < 60; i++)
          TableRow(children: [
            Container(
              decoration: BoxDecoration(
                color: i >= startnum && i < endnum ? col : Colors.transparent,
                border: Border(
                  top: BorderSide(
                      width: 0.50,
                      color: i % 6 == 0 && !(i >= startnum && i < endnum)
                          ? Colors.grey.shade300
                          : Colors.transparent),
                  bottom: BorderSide(width: 0, color: Colors.transparent),
                ),
              ),
              height: 10.0,
            ),
          ]),
      ],
    ),
  );
}
