class menuItemModel {
  int id;
  String name;
  String category;
  String icon;
  String link;
  menuItemModel({this.id, this.name, this.category, this.icon, this.link});
  menuItemModel.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.name = json['name'];
    this.category = json['category'];
    this.icon = json['icon'];
    this.link = json['link'];
  }
}

class hotRecommadModel {
  String cover;
  String title;
  String content;
  String cityName;
  hotRecommadModel({this.cover, this.title, this.content, this.cityName});
  hotRecommadModel.fromJson(Map<String, dynamic> json) {
    this.cover = json['cover'];
    this.title = json['title'];
    this.content = json['content'];
    this.cityName = json['cityName'];
  }
}

class flooerModel {
  String picture;
  String name;
  String link;
  int linkType;
  flooerModel({this.picture, this.name, this.link, this.linkType});
  flooerModel.fromJson(Map<String, dynamic> json) {
    this.picture = json['picture'];
    this.name = json['name'];
    this.link = json['link'];
    this.linkType = json['linkType'];
  }
}

class homeListModel{
  int id;
  String cityName;
  String name;
  String picture;
  String link;
  String level;
  double score;
  double distance;
  String rank;
  homeListModel({this.id,this.cityName,this.name,this.picture,this.link,this.level,this.score,this.distance,this.rank});
  homeListModel.fromJson(Map<String,dynamic> json){
    this.id = json['id'];
    this.cityName = json['cityName'];
    this.name = json['name'];
    this.link = json['link'];
    this.level = json['level'];
    this.score = json['score'];
    this.distance = json['distance'];
    this.picture = json['picture'];
    this.rank = json['rank'];
  }
}
