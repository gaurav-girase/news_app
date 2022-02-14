import 'package:be_updated/core/constant/card_widget.dart';
import 'package:be_updated/data/models/news_model.dart';
import 'package:be_updated/feature/controllers/news_provider.dart';
import 'package:be_updated/services/api_data_fetch.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';

import 'news_details.dart';

class NewsTabs extends StatefulWidget {
  String url;
  NewsTabs(this.url, {Key? key}) : super(key: key);

  @override
  State<NewsTabs> createState() => _NewsTabsState(url);
}

class _NewsTabsState extends State<NewsTabs> {
  late List<NewsModel> newsList = [];
  String url;
  _NewsTabsState(this.url);
  getNews() async {
    ApiDataFetch adf = ApiDataFetch(url);
    newsList = await adf.getNews() as List<NewsModel>;
    NewsProvider provider = Provider.of<NewsProvider>(context, listen: false);
    provider.setNewsListDetails(newsList, url);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    NewsProvider provider = Provider.of<NewsProvider>(context, listen: false);
    newsList = provider.getNewsList(url);
    if (newsList.isEmpty) getNews();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(15),
        width: MediaQuery.of(context).size.width,
        height: (newsList.isEmpty)
            ? MediaQuery.of(context).size.height / 1.32
            : MediaQuery.of(context).size.height,
        alignment: (newsList.isEmpty) ? Alignment.center : Alignment.topLeft,
        color: Colors.grey[300],
        child: (newsList.isEmpty)
            ? Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  LoaderOverlay(
                    child: Text('Updating  '),
                  ),
                ],
              )
            : Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    alignment: Alignment.topLeft,
                    width: MediaQuery.of(context).size.width - 20,
                    height: MediaQuery.of(context).size.height / 1.43,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      color: Colors.white,
                    ),
                    child: ListView.builder(
                        itemCount: newsList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return (ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          NewsPage(newsList[index])));
                            },
                            title: NewsDetails(
                                newsList[index],
                                MediaQuery.of(context).size.width - 20,
                                MediaQuery.of(context).size.height / 1.3),
                          ));
                        }),
                  )
                ],
              ),
      ),
    );
  }
}
