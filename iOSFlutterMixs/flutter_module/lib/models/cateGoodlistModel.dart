
class CateGoodsListModel {
    CateGoodsListModel({
        this.code,
        this.message,
        this.data,
    });

    String code;
    String message;
    List<CateGoods> data;

    factory CateGoodsListModel.fromJson(Map<String, dynamic> json) => CateGoodsListModel(
        code: json["code"],
        message: json["message"],
        data: List<CateGoods>.from(json["data"].map((x) => CateGoods.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class CateGoods {
    CateGoods({
        this.image,
        this.oriPrice,
        this.presentPrice,
        this.goodsName,
        this.goodsId,
    });

    String image;
    double oriPrice;
    double presentPrice;
    String goodsName;
    String goodsId;

    factory CateGoods.fromJson(Map<String, dynamic> json) => CateGoods(
        image: json["image"],
        oriPrice: json["oriPrice"],
        presentPrice: json["presentPrice"],
        goodsName: json["goodsName"],
        goodsId: json["goodsId"],
    );

    Map<String, dynamic> toJson() => {
        "image": image,
        "oriPrice": oriPrice,
        "presentPrice": presentPrice,
        "goodsName": goodsName,
        "goodsId": goodsId,
    };
}