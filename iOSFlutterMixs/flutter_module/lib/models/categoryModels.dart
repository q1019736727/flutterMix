/*
 * @Author: your name
 * @Date: 2021-01-06 09:36:41
 * @LastEditTime: 2021-01-08 13:27:45
 * @LastEditors: your name
 * @Description: In User Settings Edit
 * @FilePath: /flutter_module/lib/models/categoryModels.dart
 */


class CategoryListModel {
  CategoryListModel({
    this.code,
    this.message,
    this.data,
  });

  String code;
  String message;
  List<CategorySubModel> data;

  factory CategoryListModel.fromJson(Map<String, dynamic> json) =>
      CategoryListModel(
        code: json["code"],
        message: json["message"],
        data: List<CategorySubModel>.from(json["data"].map((x) => CategorySubModel.fromJson(x))),
      );
      
  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CategorySubModel {
  CategorySubModel({
    this.mallCategoryId,
    this.mallCategoryName,
    this.bxMallSubDto,
    this.comments,
    this.image,
  });

  String mallCategoryId;
  String mallCategoryName;
  List<BxMallSubDto> bxMallSubDto;
  dynamic comments;
  String image;

  factory CategorySubModel.fromJson(Map<String, dynamic> json) => CategorySubModel(
        mallCategoryId: json["mallCategoryId"],
        mallCategoryName: json["mallCategoryName"],
        bxMallSubDto: List<BxMallSubDto>.from(
            json["bxMallSubDto"].map((x) => BxMallSubDto.fromJson(x))),
        comments: json["comments"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "mallCategoryId": mallCategoryId,
        "mallCategoryName": mallCategoryName,
        "bxMallSubDto": List<dynamic>.from(bxMallSubDto.map((x) => x.toJson())),
        "comments": comments,
        "image": image,
      };
}

class BxMallSubDto {
  BxMallSubDto({
    this.mallSubId,
    this.mallCategoryId,
    this.mallSubName,
    this.comments,
  });

  String mallSubId;
  String mallCategoryId;
  String mallSubName;
  String comments;

  factory BxMallSubDto.fromJson(Map<String, dynamic> json) => BxMallSubDto(
        mallSubId: json["mallSubId"],
        mallCategoryId: json["mallCategoryId"],
        mallSubName: json["mallSubName"],
        comments: json["comments"] == null ? null : json["comments"],
      );

  Map<String, dynamic> toJson() => {
        "mallSubId": mallSubId,
        "mallCategoryId": mallCategoryId,
        "mallSubName": mallSubName,
        "comments": comments == null ? null : comments,
      };
}

