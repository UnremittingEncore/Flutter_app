import 'dart:core';

class FlowersData{
  int id;
  String flowerName;
  String flowerImageUrl;

  FlowersData({this.id, this.flowerName, this.flowerImageUrl});

  factory FlowersData.fromJson(Map<String, dynamic> json){
    return FlowersData(
      id: json['id'],
      flowerName: json['flower_name'],
      flowerImageUrl: json['flower_image_url'],
    );
  }
}