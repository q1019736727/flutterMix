/*
 * @Author: cy
 * @Date: 2021-01-11 17:03:20
 * @LastEditTime: 2021-01-11 17:31:04
 * @FilePath: /flutter_module/lib/pages/detail/goods_bottom.dart
 */

import 'package:flutter/material.dart';
import 'package:flutter_module/common/global.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoodsBottom extends StatefulWidget {
  @override
  _GoodsBottomState createState() => _GoodsBottomState();
}

class _GoodsBottomState extends State<GoodsBottom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          _shopCart(),
          _addCart(),
          _addBuy(),
        ],
      ),
    );
  }

  Widget _shopCart() {
    return Container(
      width: 100,
      child: IconButton(
        icon: Icon(
          Icons.shopping_cart,
          color: MainColor,
        ),
        onPressed: () {},
      ),
    );
  }

  Widget _addCart() {
    return Container(
      width: (375.w - 100)/2,
      color: MainColor,
      alignment: Alignment.center,
      child: InkWell(
        onTap: () {
          print(1111);
        },
        child: Text('加入购物车',style: TextStyle(color: Colors.white),),
      ),
    );
  }

  Widget _addBuy() {
   return Container(
      width: (375.w - 100)/2,
      alignment: Alignment.center,
      color: Colors.red,
      child: InkWell(
        onTap: () {
          print(1111);
        },
        child: Text('立即购买',style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
