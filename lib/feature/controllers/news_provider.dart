import 'package:be_updated/core/constant/app_url.dart';
import 'package:be_updated/data/models/news_model.dart';
import 'package:flutter/widgets.dart';

class NewsProvider with ChangeNotifier {
  late List<NewsModel> entertainmentNewsList = [];
  late List<NewsModel> businessNewsList = [];
  late List<NewsModel> scienceNewsList = [];
  late List<NewsModel> sportsNewsList = [];
  late List<NewsModel> trendingNewsList = [];
  late List<NewsModel> politicalNewsList = [];

  setNewsListDetails(List<NewsModel> newsList, String url) {
    if (url == AppUrl.entertainment) {
      entertainmentNewsList = newsList;
    } else if (url == AppUrl.business) {
      businessNewsList = newsList;
    } else if (url == AppUrl.science) {
      scienceNewsList = newsList;
    } else if (url == AppUrl.sports) {
      sportsNewsList = newsList;
    } else if (url == AppUrl.trending) {
      trendingNewsList = newsList;
    } else if (url == AppUrl.political) {
      politicalNewsList = newsList;
    }
  }

  getNewsList(String url) {
    if (url == AppUrl.entertainment) {
      return entertainmentNewsList;
    } else if (url == AppUrl.business) {
      return businessNewsList;
    } else if (url == AppUrl.science) {
      return scienceNewsList;
    } else if (url == AppUrl.sports) {
      return sportsNewsList;
    } else if (url == AppUrl.trending) {
      return trendingNewsList;
    } else {
      return politicalNewsList;
    }
  }
}
