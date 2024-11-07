import 'dart:convert';

import 'package:task/travel/model/travel_model.dart';

class TravelDetailsModel {
  int id;
  TravelModel travel;
  String? groupPhoto;
  String travelAgenda;

  TravelDetailsModel(
      {required this.id,
      required this.travel,
      required this.groupPhoto,
      required this.travelAgenda});

  factory TravelDetailsModel.fromJson(Map<String, dynamic> json) =>
      TravelDetailsModel(
          id: json["id"],
          travel: TravelModel.fromJson(json["travel"]),
          groupPhoto: json["group_photo"],
          travelAgenda: json["travel_agenda"]);
}

List<TravelDetailsModel> travelDetailsModelFromJson(String str) =>
    List<TravelDetailsModel>.from(
        json.decode(str).map((x) => TravelDetailsModel.fromJson(x)));
