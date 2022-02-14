class NewsModel {
  String title, link, description, pubDate, image_url, source_id;
  NewsModel(
      {this.title = "",
      this.link = "",
      this.description = '',
      this.image_url = '',
      this.pubDate = '',
      this.source_id = ''});

  factory NewsModel.fromJson(dynamic json) {
    return NewsModel(
        title: json['title'],
        link: json['link'],
        description: json['description'],
        image_url: json['image_url'],
        pubDate: json['pubDate'],
        source_id: json['source_id']);
  }
}
