import 'package:blog_flutter_fluro_template/app/infra/model/result_post_model.dart';
import 'package:blog_flutter_fluro_template/app/presenter/states/states.dart';

class PostSuccessState<T> implements States {
  final ResultPostModel model;
  const PostSuccessState(this.model);
}