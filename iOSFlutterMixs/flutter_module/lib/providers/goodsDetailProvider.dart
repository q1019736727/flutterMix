/*
 * @Author: cy
 * @Date: 2021-01-11 14:45:33
 * @LastEditTime: 2021-01-11 17:35:28
 * @FilePath: /flutter_module/lib/providers/goodsDetailProvider.dart
 */
import 'package:flutter/material.dart';
import '../service/requestTool.dart';
import 'dart:convert';
import '../models/goodsDetailModel.dart';

class GoodsDetailProvider extends ChangeNotifier{
  GoodsDetailModel detailModel;
  int currentSegmentIndex = 0;

  clearDetailModel(){
    detailModel = null;
    currentSegmentIndex = 0;
    notifyListeners();
  }

  getDetailData(String goodId) async{
    return getGoodsDetail(goodId).then((value){
      final jsonData = json.decode(value);
      if(jsonData['data'] != null){
        detailModel = GoodsDetailModel.fromJson(jsonData);
      }
      notifyListeners();
    });
  }

  setCurrentSegmentIndex(int index){
    currentSegmentIndex = index;
    notifyListeners();
  }
}