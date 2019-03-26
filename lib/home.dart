import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class _MainPageState extends State<MainPageStateRoute> {
  int _counter = 0;

  String icons = "";

  //*这是Dart语言的构造函数，跟C++的构造函数非常相似，而且也有this指针的操作
  _MainPageState() {
    icons += "\uE914";
    icons += " \uE000";
    icons += " \uE90D";
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage("assets/images/avatar.png"),
              width: 80,
            ),
            //* 上面的Image控件是从设置好的assets中加载图片，当然还有很多方法来加载
            //* 图片，如下所示：
            //* 1从网络加载图片
            //! Image.network(
            //!   "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
            //!   width: 100.0,),
            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              alignment: WrapAlignment.center,
              children: <Widget>[
                Chip(
                  avatar: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text(
                      "JA",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  label: Text("James"),
                ),
                Chip(
                  avatar: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text(
                      "SU",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  label: Text("Sue"),
                ),
                Chip(
                  avatar: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text(
                      "ME",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  label: Text("Messi"),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(Icons.games),
                Icon(Icons.delete),
                Icon(Icons.radio),
              ],
            ),
            Text(
              icons,
              style: TextStyle(
                  fontFamily: "MaterialIcons",
                  fontSize: 24,
                  color: Colors.green),
            ),
            Text(
              '你已经按了那个按钮如下次数',
            ),
            Text.rich(
                //*上面的例子中,Text的所有文本只能用同一种样式,如果我们需要对一个Text的呢用的不同部分
                //*按照不同的样式定义显示,这个时候可以使用TextSpan,它代表文本的一个"片段"
                TextSpan(children: [
              TextSpan(text: "Rich Text test: "),
              TextSpan(
                text: "https://tech.viewv.top",
                style: TextStyle(color: Colors.blue),
              )
            ])),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            RaisedButton(
              color: Colors.blue[400],
              highlightColor: Colors.blue[500],
              colorBrightness: Brightness.dark,
              splashColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              // icon: Icon(Icons.new_releases),
              child: Text("Clear Number"),
              textColor: Colors.white,
              onPressed: _decrementCounter,
            ),
            RaisedButton(
                color: Colors.blue[400],
                highlightColor: Colors.blue[500],
                colorBrightness: Brightness.dark,
                splashColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                // icon: Icon(Icons.new_releases),
                child: Text("Test Chat Page"),
                textColor: Colors.white,
                onPressed: () {
                  Navigator.pushNamed(context, "chat_page");
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.menu),
      ),
    );
  }
}

class MainPageStateRoute extends StatefulWidget {
  @override
  _MainPageState createState() => new _MainPageState();
}
