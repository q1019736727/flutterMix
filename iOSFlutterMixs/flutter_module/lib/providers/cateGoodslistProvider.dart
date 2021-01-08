/*
 * @Author: cy
 * @Date: 2021-01-07 10:59:21
 * @LastEditTime: 2021-01-08 13:41:00
 * @FilePath: /flutter_module/lib/providers/cateGoodslistProvider.dart
 */

import 'package:flutter/material.dart';
import '../models/cateGoodlistModel.dart';


class CateGoodslistProvider extends ChangeNotifier{
  List<CateGoods> goodsList = [];

  setGoodsList(List<CateGoods> list){
    goodsList = list;
    notifyListeners();
  }

  addGoodsList(List<CateGoods> list){
    goodsList.addAll(list);
    notifyListeners();
  }
}