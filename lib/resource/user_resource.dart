import 'dart:convert';
import 'package:my_blog_app/models/default_response_model.dart';
import 'package:my_blog_app/models/login_request_model.dart';
import 'package:my_blog_app/models/register_request_model.dart';
import 'package:my_blog_app/services/resource.dart';

class UserResource {
  //register
  static Resource register(RegisterRequestModel registerRequestModel) {
    return Resource(
      url: 'register',
      data: registerRequestModel.toJson(),
      parse: (response) {
        return DefaultResponseModel(
          json.decode(response.body),
        );
      },
    );
  }

  //login
  static Resource login(LoginRequestModel loginRequestModel) {
    return Resource(
      url: 'login',
      data: loginRequestModel.toJson(),
      parse: (response) {
        return DefaultResponseModel(
          json.decode(response.body),
        );
      },
    );
  }
}
