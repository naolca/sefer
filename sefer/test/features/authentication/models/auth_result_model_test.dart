import 'package:flutter_test/flutter_test.dart';
import 'package:sefer/features/authentication/data/models/auth_result_model.dart';

void main() {
  final tAuthResultModel = AuthResultModel(isSuccess: true);

  test("auth result model should be type of auth result", () async {
    expect(tAuthResultModel, isA<AuthResultModel>());
  });

  group("from json", () {
    test("from json return a auth model", () async {
      //arrange
      final Map<String, dynamic> jsonMap = {"isSuccess": true};
      //act
      final result = AuthResultModel.fromJson(jsonMap);
      //assert
      expect(result, tAuthResultModel);
    });
  });

  group("to json", () {
    test("given a authresult model, returns a json", () async {
      //act
      final result = tAuthResultModel.toJson();
      //assert
      final expectedMap = {"isSuccess": true};
      expect(result, expectedMap);
    });
  });
}
