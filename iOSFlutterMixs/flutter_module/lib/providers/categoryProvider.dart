import 'package:flutter/material.dart';
import '../models/categoryModels.dart';

class TestPro with ChangeNotifier {
  int _count = 0;
  int get count => _count;
  void increment() {
    _count++;
    notifyListeners();
  }
}

class CategoryPro with ChangeNotifier {
  
  CategorySubModel curCategoey;

  setCurCategory(CategorySubModel cur) {
    if (cur.bxMallSubDto.length > 0 &&
        cur.bxMallSubDto[0].mallSubName != '全部') {
      BxMallSubDto insertSub = BxMallSubDto()
        ..mallSubName = '全部'
        ..comments = null
        ..mallCategoryId = ''
        ..mallSubId = '';
      cur.bxMallSubDto.insert(0, insertSub);
    }

    curCategoey = cur;
    notifyListeners();
  }
}
