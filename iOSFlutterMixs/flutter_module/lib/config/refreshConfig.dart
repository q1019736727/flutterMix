import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';


ClassicalHeader refreshHeader() {
  return ClassicalHeader(
    // infoText: '下拉刷新',
    refreshText: '下拉刷新',
    refreshedText: '刷新完成',
    refreshingText: '刷新中....',
    refreshReadyText: '准备刷新',
    noMoreText: '',
    textColor: Colors.red[500],
    bgColor: Colors.white,
  );
}

ClassicalFooter refreshFooter() {
  return ClassicalFooter(
    infoText: '上拉加载',
    loadText: '上啦加载',
    loadingText: '加载中....',
    loadedText: '加载完毕',
    noMoreText: '暂无更多数据',
    textColor: Colors.red[500],
    bgColor: Colors.white,
  );
}
