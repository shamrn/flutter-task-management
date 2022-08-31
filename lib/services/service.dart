import 'package:get/get.dart';
import 'package:task_management/utils/app_constants.dart';

class DataService extends GetConnect implements GetxService {
  Future<Response> listData() async {
    Response response = await get(ROOT_URL);
    return response;
  }

  Future<Response> retrieveData({required int id}) async {
    Response response = await get(ROOT_URL + '${id}/');
    return response;
  }

  Future<Response> postData(
      {required String name, required String description}) async {
    var body = <String, String>{"name": name, "description": description};
    Response response = await post(ROOT_URL, body);
    return response;
  }

  Future<Response> patchData(
      {required int id,
      required String name,
      required String description}) async {
    var body = <String, String>{"name": name, "description": description};
    Response response = await patch(ROOT_URL + '${id}/', body);
    return response;
  }

  Future<Response> deleteData({required int id}) async {
    Response response = await delete(
      ROOT_URL + '${id}/',
    );
    return response;
  }

}
