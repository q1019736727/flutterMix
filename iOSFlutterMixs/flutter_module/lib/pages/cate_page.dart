import 'package:flutter/material.dart';
import 'package:flutter_module/providers/categoryProvider.dart';
import '../service/requestTool.dart';
import '../models/categoryModels.dart';
import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CateGoryPage extends StatefulWidget {
  @override
  _CateGoryPageState createState() => _CateGoryPageState();
}

class _CateGoryPageState extends State<CateGoryPage> {
  List<CategorySubModel> _categorys = [];
  Widget _leftB = Container(
    width: 115,
  );
  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  _fetchData() async {
    getCateGoryList().then((value) {
      final data = json.decode(value);
      final model = CategoryListModel.fromJson(data);
      setState(() {
        _categorys = model.data;
      });
      _leftB = LeftNav(categorys: _categorys);
      context.read<CategoryPro>().setCurCategory(_categorys[0]);
    });
  }

  @override
  Widget build(BuildContext context) {
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
        ],
      ),
    );
  }

  Widget _rightNav() {
    return Container(
      height: 50,
      width: 375.w - 115,
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
    return Container(
      padding: EdgeInsets.only(left: 15),
      alignment: Alignment.center,
      child: InkWell(
        onTap: () {},
        child: Text(
          model.mallSubName,
          style: TextStyle(fontSize: 16),
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
      width: 115,
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
        setState(() {
          _currentCategoryIndex = index;
        });
        context.read<CategoryPro>().setCurCategory(model);
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
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
