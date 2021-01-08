/*
 * @Author: cy
 * @Date: 2021-01-08 10:09:40
 * @LastEditTime: 2021-01-08 13:39:26
 * @FilePath: /flutter_module/lib/pages/detail/goods_detail.dart
 */
import 'package:flutter/material.dart';
import '../../models/cateGoodlistModel.dart';

class GoodsDetail extends StatelessWidget {
  CateGoods goods;
  GoodsDetail({this.goods});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(goods.goodsName),
        ),
        body: Center(
          child: Column(children: [
            Text('商品ID ${goods.goodsName}'),
            RaisedButton(color: Colors.black26,onPressed: (){
              Navigator.pop(context,'我是返回的参数');
            }),
          ],)
        ),
      ),
    );
  }
}