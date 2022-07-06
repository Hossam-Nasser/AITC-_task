import 'package:dio/dio.dart';

import 'package:get/get.dart';

import '../models/house_model.dart';
import '../utils/apis.dart';

class RemoteServices {
  final client = Dio();

  Future<HouseResponseModel?> fetchHouses() async {
    var response = await client.get(Apis().HOME_API);
    try{

      if (response.statusCode == 200) {
        var jsonString = response.data;
        return HouseResponseModel.fromJson(jsonString);
      } else {

        return null;
      }
    }catch(e){
      Get.showSnackbar(GetSnackBar(title: e.toString(),));
    }
  }
}