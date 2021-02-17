import 'package:blog_flutter_fluro_template/app/infra/model/result_post_model.dart';
import 'package:blog_flutter_fluro_template/app/presenter/states/states.dart';

class HomeSuccessState<T> implements States {
  final List<T> list;
  const HomeSuccessState(this.list);
}

class PostByPathSuccessState<T> implements States {
  final ResultPostModel model;
  const PostByPathSuccessState(this.model);
}