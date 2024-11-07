import 'dart:convert';

class TravelModel {
  int id;
  String name;
  String description;

  TravelModel(
      {required this.id, required this.name, required this.description});

  factory TravelModel.fromJson(Map<String, dynamic> json) => TravelModel(
      id: json["id"], name: json["name"], description: json["description"]);
}

List<TravelModel> travelModelFromJson(String str) => List<TravelModel>.from(
    json.decode(str).map((x) => TravelModel.fromJson(x)));
