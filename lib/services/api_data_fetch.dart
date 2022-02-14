import 'dart:convert';
import 'package:be_updated/data/models/news_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class ApiDataFetch {
  List<NewsModel> newsList = [];
  String baseUrl;
  ApiDataFetch(this.baseUrl);
  Future<List> getNews() async {
    Uri uri = Uri.parse(baseUrl);
    final response = await http.get(uri);
    try {
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body)['results'];
        for (int i = 0; i < data.length; ++i) {
          if (data[i]['image_url'] != null) {
            newsList.add(NewsModel.fromJson(data[i]));
          }
        }
      } else {
        Fluttertoast.showToast(msg: 'check your internet connection');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'check your internet connection');
    }
    return newsList;
  }
}
