import 'package:my_blog_app/models/default_response_model.dart';
import 'package:my_blog_app/models/login_request_model.dart';
import 'package:my_blog_app/models/register_request_model.dart';
import 'package:my_blog_app/models/user_response_model.dart';
import 'package:my_blog_app/resource/user_resource.dart';
import 'package:my_blog_app/services/web_services.dart';

class UserBloc {
  //register
  Future<DefaultResponseModel> register(
      RegisterRequestModel registerRequestModel) async {
    return await Webservice.post(UserResource.register(registerRequestModel));
  }

  //login
  Future<UserResponseModel> login(LoginRequestModel loginRequestModel) async {
    return await Webservice.post(UserResource.login(loginRequestModel));
  }
}
