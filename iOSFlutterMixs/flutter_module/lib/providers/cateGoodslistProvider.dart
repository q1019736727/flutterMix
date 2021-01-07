
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