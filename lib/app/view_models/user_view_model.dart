import 'package:url_launcher/url_launcher.dart';

import 'package:flutter_discard_web_app/app/models/user.dart';
import 'package:flutter_discard_web_app/app/service/http_client.dart';
import 'package:flutter_discard_web_app/app/view_models/base_view_model.dart';

class UserViewModel extends BaseViewModel {
  User? user;
  final HttpClient httpClient;

  UserViewModel({
    required this.httpClient,
  }) {
    status = RequestStatus.initial;
  }

  Future<User?> getUserById(String id) async {
    try {
      status = RequestStatus.loading;

      await Future.delayed(const Duration(milliseconds: 3000));

      var response = await httpClient.get(id: id);

      if (response.statusCode == 200) {
        user = User.fromJson(response.body);

        if (user?.id == null) {
          status = RequestStatus.error;
          return null;
        }

        status = RequestStatus.success;

        if (user?.id == '359698226074353665') {
          user?.banner?.link = 'https://birobirobiro.dev/static/images/setup.jpg';
        }

        return user;
      }
    } catch (e) {
      status = RequestStatus.error;
    }
    return user;
  }

  Future<void> openUrl() async {
    try {
      await launchUrl(Uri.parse('https://birobirobiro.dev/'));
    } catch (e) {
      throw Exception('Não foi possível abrir a Url');
    }
  }
}
