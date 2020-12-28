import 'package:flutter/material.dart';

class flowView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var container = new Container(
      decoration: new BoxDecoration(
        color: Colors.black26,
      ),
      child: new Column(
        children: [
          new Row(
            children: [
              new GestureDetector(
                onTap: () {
                  print('点击手势');
                },
                child: new Expanded(
                  child: new Container(
                    decoration: new BoxDecoration(
                      border:
                          new Border.all(width: 10.0, color: Colors.black38),
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(8.0)),
                    ),
                    margin: const EdgeInsets.all(4.0),
                    child: new Image.asset('images/lake.jpg'),
                  ),
                ),
              ),
              new Expanded(
                child: new Container(
                  decoration: new BoxDecoration(
                    border: new Border.all(width: 10.0, color: Colors.black38),
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(8.0)),
                  ),
                  margin: const EdgeInsets.all(4.0),
                  child: new Image.asset('images/lake.jpg'),
                ),
              ),
            ],
          ),
        ],
      ),
    );

    return new GridView.extent(
      maxCrossAxisExtent: 150,
      mainAxisSpacing: 4,
      padding: EdgeInsets.all(4),
      children: _buildGridTitleList(30),
    );

    // return container;
  }

  List<Container> _buildGridTitleList(int count) {
    return new List<Container>.generate(count,
        (index) => new Container(child: new Image.asset('images/lake.jpg')));
  }
}
