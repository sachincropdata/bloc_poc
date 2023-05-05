/// Created by Sachin kumar on 20-Jan-2023
/// For CropData Technology Pvt. Ltd.

abstract class BaseApiServices {
  Future<dynamic> getGetApiResponse(String url);
  Future<dynamic> getPostApiResponse(String url, dynamic data);
}
