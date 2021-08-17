import 'package:trip/model/common_model.dart';
import 'package:trip/model/config_model.dart';
import 'package:trip/model/grid_nav_model.dart';
import 'package:trip/model/salea_box_model.dart';

class HomeModel{
  late final ConfigModel config;
  final List<CommonModel> bannerList;
  final List<CommonModel> localNavList;
  final List<CommonModel> subNavList;
  final GridNavModel gridNav;
  final SalesBoxModel salesBox;

  HomeModel({required this.subNavList, required this.salesBox, required this.localNavList, required this.gridNav, required this.config, required this.bannerList});
  factory HomeModel.fromJson(Map<String,dynamic> json){
    var localNavListJson=json['localNavList'] as List;
    List<CommonModel> localNavList =localNavListJson.map((e) => CommonModel.fromJson(e)).toList();

    var bannerListJson=json['bannerList'] as List;
    List<CommonModel> bannerList =bannerListJson.map((e) => CommonModel.fromJson(e)).toList();

    var subNavListJson=json['subNavList'] as List;
    List<CommonModel> subNavList =subNavListJson.map((e) => CommonModel.fromJson(e)).toList();

    return HomeModel(
      localNavList: localNavList,
      bannerList: bannerList,
      subNavList: subNavList,
      config: ConfigModel.fromJson(json['config']),
      gridNav: GridNavModel.fromJson(json['gridNav']),
      salesBox: SalesBoxModel.fromJson(json['salesBox']),
    );
  }
}