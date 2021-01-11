/*
 * @Author: cy
 * @Date: 2021-01-11 11:44:49
 * @LastEditTime: 2021-01-11 16:29:07
 * @FilePath: /flutter_module/lib/pages/detail/goods_top.dart
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/goodsDetailProvider.dart';

class GoodsTop extends StatefulWidget {
  @override
  _GoodsTopState createState() => _GoodsTopState();
}

class _GoodsTopState extends State<GoodsTop> {
  @override
  Widget build(BuildContext context) {
    return Consumer<GoodsDetailProvider>(
      builder: (ctx, detailM, child) {
        final model = detailM.detailModel;
        if (model == null) {
          return Container();
        }
        final goodInfo = model.data.goodInfo;
        return Column(
          children: [
            Image.network(goodInfo.image1),
            Container(
              padding: EdgeInsets.only(left: 15, top: 15, right: 15),
              alignment: Alignment.centerLeft,
              child: Text(
                goodInfo.goodsName,
                maxLines: 2,
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15, top: 8, right: 15),
              child: Row(
                children: [
                  Text(
                    '原价 ￥${goodInfo.oriPrice}',
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 15, decoration: TextDecoration.lineThrough),
                  ),
                  SizedBox(width:30),
                  Text(
                    '￥${goodInfo.presentPrice}',
                    maxLines: 1,
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.w600
                        ),
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
