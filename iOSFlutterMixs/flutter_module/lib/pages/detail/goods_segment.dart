/*
 * @Author: cy
 * @Date: 2021-01-11 16:29:55
 * @LastEditTime: 2021-01-11 17:46:46
 * @FilePath: /flutter_module/lib/pages/detail/goods_segment.dart
 */

import 'package:flutter/material.dart';
import 'package:flutter_module/common/global.dart';
import 'package:provider/provider.dart';
import '../../providers/goodsDetailProvider.dart';

class GoodsSegment extends StatefulWidget {
  @override
  _GoodsSegmentState createState() => _GoodsSegmentState();
}

class _GoodsSegmentState extends State<GoodsSegment> {
  @override
  Widget build(BuildContext context) {
    final currentIndex =
        Provider.of<GoodsDetailProvider>(context,listen: true).currentSegmentIndex;
    return Container(
      height: 80,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: 2,
                          color:
                              currentIndex == 0 ? MainColor : Colors.white))),
              child: InkWell(
                onTap: () {
                  Provider.of<GoodsDetailProvider>(context,listen: false)
                      .setCurrentSegmentIndex(0);
                },
                child: Text(
                  '详情',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: 2,
                          color:
                              currentIndex == 1 ? MainColor : Colors.white))),
              child: InkWell(
                onTap: () {
                  Provider.of<GoodsDetailProvider>(context,listen: false)
                      .setCurrentSegmentIndex(1);
                },
                child: Text(
                  '评论',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
