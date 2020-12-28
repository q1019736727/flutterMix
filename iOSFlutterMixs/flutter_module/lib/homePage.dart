import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PageDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        new Image.asset(
          'images/lake.jpg',
          height: 240,
          width: 600,
          fit: BoxFit.cover,
        ),
        new TitleSrction(),
        new MenuSection(),
        new Container(
          margin: EdgeInsets.only(left: 15, top: 15, right: 15),
          child: new Text(
              '按数据库的哈数据都将爱神的箭回家还暗杀可接受的，爱神的箭安徽省，奥术大师大，奥术大师大奥术大师大所大所多多撒奥术大师大所多敖德萨发多撒所大所多，奥术大师大所多jhasdjba,卡仕达多巴适得卡机山东矿机爱斯达克就按收到货卡加斯打开就四大皆空卡机的撒会计师的号角'),
        )
      ],
    );
  }
}

//示例
class TempTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Row(
        children: [
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    'Oeschinen Lake Campground',
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                new Text(
                  'Kandersteg, Switzerland',
                  style: new TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          new Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          new Text('41'),
        ],
      ),
    );
  }
}

//title部分
class TitleSrction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
        padding: EdgeInsets.all(15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            new Expanded(
              //自动扩展最大
              child: Column(
                children: [
                  new Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: new Text("奥克兰多湖", style: TextStyle(fontSize: 18)),
                  ),
                  new Text("快来体验清新的大自然空气快来体验清新的大自然空气快来体验清新的大自然空气快来体验清新的大自然空气",
                      style: TextStyle(color: Colors.grey[500])),
                ],
              ),
            ),
            SizedBox(width: 15),
            _startNum()
          ],
        ));
  }

  Widget _startNum() {
    var star = new GestureDetector(
        onTap: () => {print('轻点击')},
        child: new Row(
          children: [
            new Text('点赞', style: TextStyle(color: Colors.grey[600])),
            new IconButton(
                icon: new Icon(
                  Icons.star,
                  color: Colors.red,
                ),
                onPressed: _doSomething),
          ],
        ));
    return star;
  }

  void _doSomething() {
    print("doSomething");
  }
}

//menu部分
class MenuSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        new Column(
          children: [
            Icon(Icons.phone, color: Colors.blue),
            SizedBox(height: 10),
            Text('Call', style: TextStyle(color: Colors.blue))
          ],
        ),
        new Column(
          children: [
            Icon(Icons.local_cafe, color: Colors.blue),
            SizedBox(height: 10),
            Text('Coffee', style: TextStyle(color: Colors.blue))
          ],
        ),
        new Column(
          children: [
            Icon(Icons.share, color: Colors.blue),
            SizedBox(height: 10),
            Text('Shre', style: TextStyle(color: Colors.blue))
          ],
        ),
      ]),
    );
  }
}
