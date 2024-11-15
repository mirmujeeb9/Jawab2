class SignupModel {
  String? name;
  String? surname;
  String? email;
  String? password;
  String? passwordConfirmation;
  String? affiliateCode;

  SignupModel(
      {this.name,
      this.surname,
      this.email,
      this.password,
      this.passwordConfirmation,
      this.affiliateCode});

  SignupModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    surname = json['surname'];
    email = json['email'];
    password = json['password'];
    passwordConfirmation = json['password_confirmation'];
    affiliateCode = json['affiliate_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['surname'] = this.surname;
    data['email'] = this.email;
    data['password'] = this.password;
    data['password_confirmation'] = this.passwordConfirmation;
    data['affiliate_code'] = this.affiliateCode;
    return data;
  }
}
