class News {
  News({this.id, this.title, this.imgUrl, this.likes, this.comments});

  final int id;
  final String title;
  final String imgUrl;
  final int likes;
  final int comments;
}

class NewsArguments {
  final String title;
  final String url;
  final String heroTag;
  NewsArguments({this.title, this.url, this.heroTag});
}
