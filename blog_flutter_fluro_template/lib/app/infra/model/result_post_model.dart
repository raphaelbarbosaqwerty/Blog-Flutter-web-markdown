import 'package:blog_flutter_fluro_template/app/domain/entities/result_post_entity.dart';

class ResultPostModel extends ResultPostEntity {
  final String headerImageLocal;
  final String bodyContentPost;
  final String subtitle;
  final List<String> keywords;
  final String title;
  final String date;

  ResultPostModel(
      {this.headerImageLocal,
      this.bodyContentPost,
      this.subtitle,
      this.keywords,
      this.title,
      this.date});
}
