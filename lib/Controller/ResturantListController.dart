import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/Resturant.dart';
//Sara Assaad
class ResturantListController extends GetxController {
  Future<List<Resturant>> getResturant(String place) async {
    var response = await http.get(
        headers: {
          'X-RapidAPI-Key':
              '65897a5813msh0c5bb21ec1eefb6p16e132jsndc9b8e5ba4b0',
          //  'X-RapidAPI-Key': '88017a34bamsh1ade1513c76676fp1bde3fjsn0a8b11525110',
          'X-RapidAPI-Host': 'the-fork-the-spoon.p.rapidapi.com'
        },
        Uri.parse(
            'https://the-fork-the-spoon.p.rapidapi.com/restaurants/v2/list?queryPlaceValueCityId=$place'));
    print((json.decode(response.body))['data']);
    List<Resturant> resturant = (json.decode(response.body))['data']
        .map<Resturant>((ap) => Resturant.fromJson(ap))
        .toList();
    print(resturant);
    return resturant;
  }
}
