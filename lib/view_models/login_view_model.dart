// ignore_for_file: use_build_context_synchronously
import 'package:admin_ui/models/login_model.dart';
import 'package:admin_ui/url_path.dart';
import 'package:http/http.dart' as http;


Future<Map<String, dynamic>> adminLogin(LoginModel production) async {
  var response = await http.post(
      Uri.parse("${APIpath.ngRok}/api2/admin/auth/login"),
      body: production.toMap());
  if (response.statusCode == 200) {
    return {"user": response.body, "status": true};
  }
  return {"status": false};
}
