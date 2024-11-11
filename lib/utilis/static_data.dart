import 'package:alxza/view/auth/signin/model.dart';
import 'package:alxza/view/auth/signup/model.dart';

//http://10.0.2.2:8000/api/

class StaticData {
  static String token = '';
  static SignupModel? signupModel;
  static UserModel? userModel;

  static const baseURL = 'https://srv478748.hstgr.cloud/api/';
  static const mainURL = 'http://10.0.2.2:8000/api/';
  static const imageUrl = "https://srv478748.hstgr.cloud/";
  static const login = 'auth/login';

  

  static const profile = 'auth/profile';
  static const register = 'auth/register';
  static const googlelogin = 'auth/google-login';

  // AI Translator
  static const aiwritergenerate = 'aiwriter/generate';
  static const aiwritergenerateoutput = 'aiwriter/generate-output';
}
