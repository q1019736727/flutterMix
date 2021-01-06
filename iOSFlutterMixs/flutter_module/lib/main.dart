import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'homePage.dart';
import 'pages/index_page.dart';
import 'common/global.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_module/common/global.dart';
import 'package:provider/provider.dart';
import 'providers/categoryProvider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TestPro(),),
        ChangeNotifierProvider(create: (_) => CategoryPro(),)
      ],
      child: MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //设置适配尺寸 (填入设计稿中设备的屏幕尺寸) 此处假如设计稿是按iPhone6的尺寸设计的(iPhone6 750*1334)
    return ScreenUtilInit(
      designSize: Size(375, 667),
      allowFontScaling: false,
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,   
        ],
        supportedLocales: [ Locale('zh', 'CN')],
        theme: ThemeData(
          primaryColor: MainColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          splashColor: Color.fromRGBO(0, 0, 0, 0), //点击效果设置为透明色
        ),
        // home: MyHomePage(title: 'Flutter Demo Home Page'),
        home: ShopMain(),
        // home: new Scaffold(
        //     appBar: new AppBar(
        //       title: new Text('欢迎来到Flutter'),
        //     ),
        //     body: new Center(
        //       // child: new RandomWords(),
        //       // child: new Custom(),
        //       child: new PageDetail(),
        //       // child: new flowView(),
        //     )),
      ),
    );
  }
}

class Custom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        width: 100,
        height: 100,
        margin: EdgeInsets.only(left: 10, top: 100),
        alignment: Alignment.center,
        child: new Text('hello world'),
        color: Color.fromRGBO(200, 200, 200, 1),
      ),
    );
  }
}

class CollectionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

/*列表*/
class RandomWords extends StatefulWidget {
  @override
  createState() {
    return new RandomWordsState();
  }
}

class RandomWordsState extends State<RandomWords> {
  final _biggerFont = const TextStyle(fontSize: 18);
  final _saved = new Set<WordPair>();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved)
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          final tiles = _saved.map(
            (pair) {
              return new ListTile(
                title: new Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

          return new Scaffold(
            appBar: new AppBar(
              title: new Text('Saved Suggestions'),
            ),
            body: new ListView(children: divided),
          );
        },
      ),
    );
  }

  Widget _buildSuggestions() {
    final _suggestions = <WordPair>[];
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return new Divider();
          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }
}

class MyApp1 extends StatelessWidget {
  final List<String> items;
  MyApp1({Key key, @required this.items}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView widget',
      home: Scaffold(
          body: new ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return new ListTile(
                  title: new Text('${items[index]}'),
                );
              })),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
