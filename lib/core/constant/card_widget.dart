import 'package:be_updated/data/models/news_model.dart';
import 'package:flutter/material.dart';

class NewsDetails extends StatelessWidget {
  NewsModel model;
  double wid, hei;
  NewsDetails(this.model, this.wid, this.hei, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var height = mediaQueryData.size.height;
    var width = mediaQueryData.size.width;
    return Container(
      padding: const EdgeInsets.all(10),
      width: wid,
      height: hei * 0.6,
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        image: DecorationImage(
            image: NetworkImage(model.image_url), fit: BoxFit.fill),
      ),
      child: Column(
        children: [
          Text(
            model.pubDate,
            textAlign: TextAlign.end,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 240,
          ),
          Expanded(
            flex: 10,
            child: Text(
              model.title,
              style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
