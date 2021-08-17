class CommonModel{
  final String icon;
  final String title;
  final String url;
  final String statusBarColor;
  final bool hideAppBar;
  CommonModel({required this.icon, required this.title, required this.url, required this.statusBarColor, required this.hideAppBar,});
  factory CommonModel.fromJson(Map<String,dynamic>json){
    return CommonModel(icon: json['icon'], url: json['url'], hideAppBar: json['hideAppBar'], statusBarColor: json['statusBarColor'], title: json['title']);
  }
}