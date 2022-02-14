import 'package:be_updated/core/constant/app_url.dart';
import 'package:flutter/material.dart';

import 'news_tabs.dart';

TextEditingController controller = TextEditingController();

class SearchScreen extends StatelessWidget {
  String url;
  SearchScreen(this.url, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey[300],
        elevation: 0,
        title: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.white),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  Icons.search,
                  color: Colors.grey[500],
                ),
                flex: 1,
              ),
              Expanded(
                child: TextField(
                  controller: controller,
                  onSubmitted: (searchedText) {
                    controller.clear();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                SearchScreen(AppUrl.baseUrl + searchedText)));
                  },
                  decoration: const InputDecoration(
                      hintText: 'search', border: InputBorder.none),
                ),
                flex: 9,
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              height: 40,
              color: Colors.grey[300],
            ),
            NewsTabs(url),
          ],
        ),
      ),
    );
  }
}
