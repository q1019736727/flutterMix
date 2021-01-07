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
  int currentPage = 1;

  BxMallSubDto curSubCategory = BxMallSubDto()
    ..comments = null
    ..mallCategoryId = ''
    ..mallSubId = ''
    ..mallSubName = '全部';

  int currentSubIndex = 0;

  setCurCategory(CategorySubModel cur) {
    currentSubIndex = 0;
    currentPage = 1;
    if (cur.bxMallSubDto.length > 0 &&
        cur.bxMallSubDto[0].mallSubName != '全部') {
      BxMallSubDto insertSub = BxMallSubDto()
        ..mallSubName = '全部'
        ..comments = null
        ..mallCategoryId = cur.mallCategoryId
        ..mallSubId = '';
      cur.bxMallSubDto.insert(0, insertSub);
    }

    curCategoey = cur;
    notifyListeners();
  }

  setCurrentSubIndex(int index) {
    currentSubIndex = index;
    currentPage = 1;
    notifyListeners();
  }

  setCurSubCategory(BxMallSubDto sub, {bool isReset}) {
    if (isReset) {
      curSubCategory = BxMallSubDto()
        ..comments = null
        ..mallCategoryId = sub.mallCategoryId
        ..mallSubId = ''
        ..mallSubName = '全部';
    } else {
      curSubCategory = sub;
    }
    notifyListeners();
  }

  setCurPageindex(int index) {
    currentPage = index;
    notifyListeners();
  }
}
