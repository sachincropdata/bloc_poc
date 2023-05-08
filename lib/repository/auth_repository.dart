import 'package:bloc_mvvm_poc_app/common/constants.dart';
import '../models/user_models.dart';
import '../services/network_api_service.dart';

class AuthRepository {
  final baseApiService = NetworkApiServices();

  Future<UsersModels> userDataApi(int currentPage) async {
    try {
      dynamic response =
          await baseApiService.getGetApiResponse("$BASE_URL?page=$currentPage");

      UsersModels model = UsersModels.fromJson(response);
      return model;
    } catch (e) {
      rethrow;
    }
  }
}
