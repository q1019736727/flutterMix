/*
 * @Author: cy
 * @Date: 2021-01-08 10:09:40
 * @LastEditTime: 2021-01-11 17:13:06
 * @FilePath: /flutter_module/lib/pages/detail/goods_detail.dart
 */
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/goodsDetailProvider.dart';
import 'goods_top.dart';
import 'goods_segment.dart';
import 'goods_web.dart';
import 'goods_bottom.dart';
class GoodsDetail extends StatefulWidget {
  String goodsId;
  GoodsDetail({this.goodsId});
  @override
  _GoodsDetailState createState() => _GoodsDetailState(goodsId: goodsId);
}

class _GoodsDetailState extends State<GoodsDetail> {
  String goodsId;
  _GoodsDetailState({this.goodsId});
  @override
  void initState() {
    super.initState();
    _getGoodsDateil(context);
  }

  @override
  Widget build(BuildContext context) {
    final pro =
        Provider.of<GoodsDetailProvider>(context, listen: true).detailModel;
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(pro != null ? (pro.data.goodInfo.goodsName) : ''),
        ),
        body: Stack(
          children: [
            ListView(
              padding: EdgeInsets.only(bottom:60),
              children: [
                GoodsTop(),
                GoodsSegment(),
                GoodsWeb(),
              ],
            ),
            Positioned(
              height: 60,
              bottom: 0,
              left: 0,
              child: GoodsBottom(),
            ),
          ],
        ),
      ),
    );
  }

  _getGoodsDateil(BuildContext ctx) async {
    Provider.of<GoodsDetailProvider>(ctx, listen: false).getDetailData(goodsId);
  }
}
