/*
 * @Author: cy
 * @Date: 2020-12-29 11:35:44
 * @LastEditTime: 2021-01-11 16:12:32
 * @FilePath: /flutter_module/lib/pages/cate_page.dart
 */
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module/common/global.dart';
import 'package:flutter_module/providers/categoryProvider.dart';
import '../providers/cateGoodslistProvider.dart';
import '../service/requestTool.dart';
import '../models/categoryModels.dart';
import '../models/cateGoodlistModel.dart';
import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import '../config/refreshConfig.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'detail/goods_detail.dart';
import '../routers/application.dart';
import '../routers/routes.dart';
import '../providers/goodsDetailProvider.dart';

class CateGoryPage extends StatefulWidget {
  @override
  _CateGoryPageState createState() => _CateGoryPageState();
}

class _CateGoryPageState extends State<CateGoryPage> {
  EasyRefreshController _refreshController = EasyRefreshController();
  FToast fToast;
  Widget _leftB = Container(
    width: 100,
  );
  @override
  void initState() {
    super.initState();
    _fetchData();
    fToast = FToast();
    fToast.init(context);
  }

  _fetchData() async {
    getCateGoryList().then((value) {
      final data = json.decode(value);
      final model = CategoryListModel.fromJson(data);
      _leftB = LeftNav(categorys: model.data);
      context.read<CategoryPro>().setCurCategory(model.data[0]);
      _fetchSubData(model.data[0]);
    });
  }

  _fetchSubData(CategorySubModel sub) async {
    getCategoryGoods(sub.mallCategoryId, sub.bxMallSubDto[0].mallSubId, 1)
        .then((value) {
      final data = json.decode(value);
      final model = CateGoodsListModel.fromJson(data);
      if (model.data != null) {
        Provider.of<CateGoodslistProvider>(context, listen: false)
            .setGoodsList(model.data);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (Provider.of<CategoryPro>(context).currentPage == 1) {
      try {} catch (e) {}
      ;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('分类'),
        elevation: 0,
      ),
      body: Row(
        children: [
          _leftB,
          _rightPages(),
        ],
      ),
    );
  }

  Widget _rightPages() {
    return Container(
      child: Column(
        children: [
          _rightNav(),
          _rightPageWrap(),
        ],
      ),
    );
  }

  Widget _rightNav() {
    return Container(
      height: 50,
      width: 375.w - 100,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.black12, width: 0.5),
        ),
      ),
      child: Consumer<CategoryPro>(
        builder: (ctx, curcate, child) {
          if (curcate.curCategoey == null) {
            return Container();
          }
          final items = curcate.curCategoey.bxMallSubDto;
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return _rightNavItem(items[index], index);
            },
            itemCount: items.length,
          );
        },
      ),
    );
  }

  Widget _rightNavItem(BxMallSubDto model, int index) {
    return Consumer<CategoryPro>(
      builder: (ctx, consu, child) {
        return Container(
          padding: EdgeInsets.only(left: 15),
          alignment: Alignment.center,
          child: InkWell(
            onTap: () {
              if (consu.currentSubIndex == index) return;
              _refreshController.resetLoadState();
              consu.setCurrentSubIndex(index);
              getCategoryGoods(model.mallCategoryId, model.mallSubId, 1)
                  .then((value) {
                final data = json.decode(value);
                CateGoodsListModel model;
                if (data['data'] != null) {
                  model = CateGoodsListModel.fromJson(data);
                }
                Provider.of<CateGoodslistProvider>(context, listen: false)
                    .setGoodsList((model == null) ? [] : model.data);
              });
            },
            child: Text(
              model.mallSubName,
              style: TextStyle(
                fontSize: 16,
                color: (consu.currentSubIndex == index)
                    ? MainColor
                    : Colors.black87,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _rightPageWrap() {
    print('wrap重构');
    var goodsList =
        Provider.of<CateGoodslistProvider>(context, listen: true).goodsList;
    final page = Provider.of<CategoryPro>(context, listen: true).currentPage;
    if (page == 1) {
      // _refreshController.callRefresh();
    }
    if (goodsList.length == 0) {
      return Expanded(
        child: Container(
          width: (375.w - 100),
          child: Center(
            child: Text('暂无数据'),
          ),
        ),
      );
    }
    return Expanded(
      child: Container(
        width: (375.w - 100),
        child: EasyRefresh.custom(
          controller: _refreshController,
          header: refreshHeader(),
          footer: refreshFooter(),
          slivers: [
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (ctx, index) {
                  return _cateGoodsItem(goodsList[index], index, context);
                },
                childCount: goodsList.length,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  childAspectRatio: 0.64),
            )
          ],
          onLoad: () {
            final cateprovider =
                Provider.of<CategoryPro>(context, listen: false);
            final pageNum = cateprovider.currentPage;
            final currentSubCate = cateprovider.curSubCategory;
            return getCategoryGoods(currentSubCate.mallCategoryId,
                    currentSubCate.mallSubId, pageNum + 1)
                .then((value) {
              final data = json.decode(value);
              CateGoodsListModel model;
              if (data['data'] != null) {
                model = CateGoodsListModel.fromJson(data);
              } else {
                _showToast(fToast);
              }
              _refreshController.finishLoad(noMore: (data['data'] == null));
              Provider.of<CateGoodslistProvider>(context, listen: false)
                  .addGoodsList((model == null) ? [] : model.data);
              cateprovider.setCurPageindex(pageNum + 1);
            });
          },
          onRefresh: () {
            final cateprovider =
                Provider.of<CategoryPro>(context, listen: false);
            final currentSubCate = cateprovider.curSubCategory;
            _refreshController.resetLoadState();
            return getCategoryGoods(
                    currentSubCate.mallCategoryId, currentSubCate.mallSubId, 1)
                .then((value) {
              final data = json.decode(value);
              CateGoodsListModel model;
              if (data['data'] != null) {
                model = CateGoodsListModel.fromJson(data);
              }
              Provider.of<CateGoodslistProvider>(context, listen: false)
                  .setGoodsList((model == null) ? [] : model.data);
              cateprovider.setCurPageindex(1);
            });
          },
        ),
      ),
    );
  }
}

class LeftNav extends StatefulWidget {
  List<CategorySubModel> categorys = [];
  LeftNav({Key key, this.categorys}) : super(key: key);
  @override
  _LeftNavState createState() => _LeftNavState(categorys: categorys);
}

class _LeftNavState extends State<LeftNav> {
  List<CategorySubModel> categorys = [];
  int _currentCategoryIndex = 0;
  _LeftNavState({this.categorys});

  @override
  Widget build(BuildContext context) {
    return _leftNav();
  }

  Widget _leftNav() {
    return Container(
      width: 100,
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(width: 0.5, color: Colors.black26),
        ),
      ),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return _categoryItem(categorys[index], index);
        },
        itemCount: categorys.length,
      ),
    );
  }

  Widget _categoryItem(CategorySubModel model, int index) {
    return InkWell(
      onTap: () {
        if (_currentCategoryIndex == index) return;
        setState(() {
          _currentCategoryIndex = index;
        });
        context.read<CategoryPro>()
          ..setCurCategory(model)
          ..setCurSubCategory(model.bxMallSubDto[0], isReset: true)
          ..setCurrentSubIndex(0);

        getCategoryGoods(model.mallCategoryId, '', 1).then((value) {
          final data = json.decode(value);
          final model = CateGoodsListModel.fromJson(data);
          Provider.of<CateGoodslistProvider>(context, listen: false)
              .setGoodsList(model.data);
        });
      },
      child: Container(
        height: 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: index == _currentCategoryIndex ? Colors.black12 : Colors.white,
          border: Border(
            bottom: BorderSide(width: 0.5, color: Colors.black12),
          ),
        ),
        child: Text(
          model.mallCategoryName,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

Widget _cateGoodsItem(CateGoods model, int index, BuildContext ctx) {
  _push() async {

        Provider.of<GoodsDetailProvider>(ctx, listen: false).clearDetailModel();

    // final result =
    //     await Navigator.push(ctx, new MaterialPageRoute(builder: (context) {
    //   return GoodsDetail(
    //     goods: model,
    //   );
    // }));
    // print(result);

    //路径不支持中文，要转换
    Application.router
        .navigateTo(ctx,
            '${goodsDetailPath}?goodsId=${model.goodsId}&goodsPrice=${model.oriPrice}&goodsName=${fluroCnParamsEncode(model.goodsName)}',
            transition: TransitionType.native)
        .then((value) {
          print('回传 ${value}');
      },
    );

    // Routes.navigateTo(ctx, goodsDetailPath,params: {
    //   'goodsModel':model
    // });
  }

  final wh = ((375.w - 100) / 2) - 20;
  return InkWell(
    onTap: () {
      _push();
    },
    child: Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
      child: Column(
        children: [
          Image.network(
            model.image,
            width: wh,
            height: wh,
          ),
          SizedBox(height: 13),
          Text(
            '${model.goodsName}',
            maxLines: 2,
            style: TextStyle(fontSize: 15),
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Text(
                '￥${model.presentPrice.toDouble().toString()}',
                style: TextStyle(fontSize: 15),
              ),
              Text(
                '￥${model.oriPrice.toDouble().toString()}',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black38,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}

_showToast(FToast toast) {
  Widget toastWid = Container(
    padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.black87,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "没有更多了",
          style: TextStyle(color: Colors.white),
        ),
      ],
    ),
  );

  toast.showToast(
    child: toastWid,
    gravity: ToastGravity.CENTER,
    toastDuration: Duration(seconds: 2),
  );
}
