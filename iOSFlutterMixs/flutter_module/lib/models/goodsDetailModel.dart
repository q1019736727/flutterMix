/*
 * @Author: cy
 * @Date: 2021-01-11 14:35:50
 * @LastEditTime: 2021-01-11 15:14:17
 * @FilePath: /flutter_module/lib/models/goodsDetailModel.dart
 */

class GoodsDetailModel {
    GoodsDetailModel({
        this.code,
        this.message,
        this.data,
    });

    String code;
    String message;
    Data data;

    factory GoodsDetailModel.fromJson(Map<String, dynamic> json) => GoodsDetailModel(
        code: json["code"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    Data({
        this.goodInfo,
        // this.goodComments,
        this.advertesPicture,
    });

    GoodInfo goodInfo;
    List<dynamic> goodComments;
    AdvertesPicture advertesPicture;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        goodInfo: GoodInfo.fromJson(json["goodInfo"]),
        // goodComments: List<dynamic>.from(json["goodComments"].map((x) => x)),
        advertesPicture: AdvertesPicture.fromJson(json["advertesPicture"]),
    );

    Map<String, dynamic> toJson() => {
        "goodInfo": goodInfo.toJson(),
        // "goodComments": List<dynamic>.from(goodComments.map((x) => x)),
        "advertesPicture": advertesPicture.toJson(),
    };
}

class AdvertesPicture {
    AdvertesPicture({
        this.pictureAddress,
        this.toPlace,
        this.urlType,
    });

    String pictureAddress;
    String toPlace;
    int urlType;

    factory AdvertesPicture.fromJson(Map<String, dynamic> json) => AdvertesPicture(
        pictureAddress: json["PICTURE_ADDRESS"],
        toPlace: json["TO_PLACE"],
        urlType: json["urlType"],
    );

    Map<String, dynamic> toJson() => {
        "PICTURE_ADDRESS": pictureAddress,
        "TO_PLACE": toPlace,
        "urlType": urlType,
    };
}

class GoodInfo {
    GoodInfo({
        this.amount,
        this.goodsId,
        this.image1,
        this.mallCategoryId,
        this.goodsSerialNumber,
        this.oriPrice,
        this.presentPrice,
        this.comPic,
        this.state,
        this.shopId,
        this.goodsName,
        this.goodsDetail,
    });

    int amount;
    String goodsId;
    String image1;
    String mallCategoryId;
    String goodsSerialNumber;
    double oriPrice;
    double presentPrice;
    String comPic;
    int state;
    String shopId;
    String goodsName;
    String goodsDetail;

    factory GoodInfo.fromJson(Map<String, dynamic> json) => GoodInfo(
        amount: json["amount"],
        goodsId: json["goodsId"],
        image1: json["image1"],
        mallCategoryId: json["MALL_CATEGORY_ID"],
        goodsSerialNumber: json["goodsSerialNumber"],
        oriPrice: json["oriPrice"],
        presentPrice: json["presentPrice"],
        comPic: json["comPic"],
        state: json["state"],
        shopId: json["shopId"],
        goodsName: json["goodsName"],
        goodsDetail: json["goodsDetail"],
    );

    Map<String, dynamic> toJson() => {
        "goodsId": goodsId,
        "image1": image1,
        "MALL_CATEGORY_ID": mallCategoryId,
        "goodsSerialNumber": goodsSerialNumber,
        "oriPrice": oriPrice,
        "presentPrice": presentPrice,
        "comPic": comPic,
        "state": state,
        "shopId": shopId,
        "goodsName": goodsName,
        "goodsDetail": goodsDetail,
    };
}
