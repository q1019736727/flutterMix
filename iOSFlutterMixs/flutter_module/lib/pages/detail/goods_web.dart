/*
 * @Author: cy
 * @Date: 2021-01-11 16:52:15
 * @LastEditTime: 2021-01-11 17:56:18
 * @FilePath: /flutter_module/lib/pages/detail/goods_web.dart
 */

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import '../../providers/goodsDetailProvider.dart';

class GoodsWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<GoodsDetailProvider>(context).detailModel;
    if (model == null) {
      return Container();
    }
    return Container(
        child: _content(context,model),
    );
  }

  Widget _content(BuildContext ctx, model) {
    final htmlString = model.data.goodInfo.goodsDetail;
    final recommandString = model.data.advertesPicture.pictureAddress;
    final currentIndex =
        Provider.of<GoodsDetailProvider>(ctx, listen: true).currentSegmentIndex;
    if (currentIndex == 0) {
      return Html(
        data: htmlString,
      );
    } else {
      return Column(
        children: [
          Text('暂无评论'),
          Html(
            data: '<img src=${recommandString}>',
          )
        ],
      );
    }
  }
}
