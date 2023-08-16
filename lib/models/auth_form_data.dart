import 'dart:io';

enum Auth_form_type { login, register }

class Auth_form_data {
  String name = '';
  String email = '';
  String password = '';
  File? image;
  Auth_form_type form_type = Auth_form_type.login;

  bool get islogin{
    return form_type == Auth_form_type.login;
  }
  bool get isregister{
    return form_type == Auth_form_type.register;
  }

  void toggle_form(){
    form_type = islogin ? Auth_form_type.register : Auth_form_type.login;
  }
}
