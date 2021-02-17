import 'package:blog_flutter_fluro_template/app/domain/entities/result_post_entity.dart';
import 'package:blog_flutter_fluro_template/app/domain/usecases/get_post_with_name_from_path.dart';
import 'package:blog_flutter_fluro_template/app/infra/model/result_post_model.dart';
import 'package:blog_flutter_fluro_template/app/presenter/pages/post/post_store.dart';
import 'package:blog_flutter_fluro_template/app/presenter/pages/post/states/post_state.dart';
import 'package:blog_flutter_fluro_template/app/presenter/states/states.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class GetPostWithNameFromPathSpy extends Mock implements IGetPostWithNameFromPath {}

main() {
  var getPostWithNameFromPath = GetPostWithNameFromPathSpy();
  var sut = PostStore(getPostWithNameFromPath);

  test('Should return an ResultPostModel when search from Post', () async {
    when(getPostWithNameFromPath.getPostWithNameFromPath(any, any)).thenAnswer((_) async => Right(ResultPostModel()));
    await sut.getPostInformations();
    expect(sut.state.model, isA<ResultPostEntity>());
  });

  test('Should change state value and become a PostSuccessState at the end', () async {
    sut.setState(StartState());
    sut.setState(LoadingState());
    sut.setState(PostSuccessState(null));
    expect(sut.state, isA<PostSuccessState>());
  });
}