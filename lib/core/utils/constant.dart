import 'package:lsc/core/model/user_model/user.dart';

User? user;
Map<String, String> headers = {
  "content-type": "application/json",
};
void disposeConstant() {
  headers = {
    "content-type": "application/json",
  };
  user = null;
}
