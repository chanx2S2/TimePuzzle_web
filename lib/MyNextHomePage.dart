import 'package:flutter/material.dart';


class MyNextHomePage extends StatefulWidget {
  @override
  _MyNextHomePageState createState() => _MyNextHomePageState();
}

class _MyNextHomePageState extends State<MyNextHomePage> {
  List<String> itemList = [];

  void addItemToList(BuildContext context) {
    setState(() {
      itemList.add('새로운 시간표');
    });
  }

  void navigateToDetailPage(BuildContext context, String item) {
    Navigator.pushNamed(context, '/time', arguments: item);
  }

  void editItemName(BuildContext context, int index) {
    String updatedName = itemList[index];

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('수정할 이름을 입력하세요.'),
          content: TextField(
            onChanged: (value) {
              updatedName = value;
            },
            decoration: InputDecoration(
              hintText: '3-1 시간표',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('취소'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  itemList[index] = updatedName;
                });
                Navigator.pop(context);
              },
              child: Text('저장'),
            ),
          ],
        );
      },
    );
  }

  void deleteItem(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text('삭제하시겠습니까?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('취소'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  itemList.removeAt(index);
                });
                Navigator.pop(context);
              },
              child: Text('삭제'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TimePuzzle'),
        centerTitle: true,
        elevation: 0.0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
              ),
              accountName: Text('김찬영'),
              accountEmail: Text('3260897@naver.com'),
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('시간표 추가하기'),
              onTap: () {
                addItemToList(context);
                Navigator.pop(context);
              },
            ),
            Divider(),
            ListView.builder(
              shrinkWrap: true,
              itemCount: itemList.length,
              itemBuilder: (context, index) {
                final item = itemList[index];
                return InkWell(
                  onTap: () {
                    navigateToDetailPage(context, item);
                  },
                  child: ListTile(
                    title: Row(
                      children: [
                        Expanded(
                          child: Text(item),
                        ),
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            editItemName(context, index);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            deleteItem(context, index);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}