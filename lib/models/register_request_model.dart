class RegisterRequestModel {
  String? name;
  String? email;
  String? password;
  String? passwordConfirmation;

  RegisterRequestModel(
      {this.name, this.email, this.password, this.passwordConfirmation});

  RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    passwordConfirmation = json['password_confirmation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['password_confirmation'] = this.passwordConfirmation;
    return data;
  }
}
