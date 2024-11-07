import 'package:http/http.dart';
import 'package:task/travel/model/travel_details_model.dart';
import 'package:task/travel/model/travel_model.dart';

class TravelController {
  static Future<List<TravelModel>?> travel() async {
    try {
      final url = Uri.parse("https://assessment.mydvls.com/travel/travel");

      Response response = await get(url);

      if (response.statusCode == 200) {
        List<TravelModel> model = travelModelFromJson(response.body);
        return model;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  static Future<List<TravelDetailsModel>?> travelDetails() async {
    try {
      final url =
          Uri.parse("https://assessment.mydvls.com/travel/travel-details");

      Response response = await get(url);

      if (response.statusCode == 200) {
        List<TravelDetailsModel> model =
            travelDetailsModelFromJson(response.body);
        print(model);
        return model;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
