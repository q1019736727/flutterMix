import 'package:flutter/material.dart';
import 'package:flutter_module/providers/categoryProvider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  String countl = '66';
  @override
  Widget build(BuildContext context) {
    print('重载MainWidget');
    return Scaffold(
      appBar: AppBar(
        title: Text('购物车'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Text(countl),
              MaterialButton(
                onPressed: () {
                  setState(() {
                    countl = '88';
                  });
                },
                color: Colors.black12,
                child: Text('State重载'),
              ),
              Consumer<TestPro>(
                builder: (ctx, counter, child) {
                  return Text(counter.count.toDouble().toString());
                },
              ),
              MaterialButton(
                onPressed: () {
                  context.read<TestPro>().increment();
                },
                color: Colors.black12,
                child: Text('Provider重载'),
              ),
              OteherWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class OteherWidget extends StatefulWidget {
  @override
  _OteherWidgetState createState() => _OteherWidgetState();
}

class _OteherWidgetState extends State<OteherWidget> {
  @override
  Widget build(BuildContext context) {
    print('重载OteherWidget');
    return Container(
      child: Consumer<TestPro>(
        builder: (ctx,counter,child){
          return Text('OteherWidget ${counter.count.toDouble().toString()}');
        },
      ),
    );
  }
}
