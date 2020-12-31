
class menuItemModel{
  int id;
  String name;
  String category;
  String icon;
  String link;
  menuItemModel({this.id,this.name,this.category,this.icon,this.link});
  menuItemModel.fromJson(Map<String,dynamic> json){
    this.id = json['id'];
    this.name = json['name'];
    this.category = json['category'];
    this.icon = json['icon'];
    this.link = json['link'];
  }
}