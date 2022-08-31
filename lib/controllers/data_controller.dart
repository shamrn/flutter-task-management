import 'package:get/get.dart';
import 'package:task_management/services/service.dart';

class DataController extends GetxController {
  DataService service = DataService();
  bool _isLoading = false;
  List<dynamic> _myData = [];
  Map<String, dynamic> _singleData = {};

  bool get isLoading => _isLoading;

  List<dynamic> get myData => _myData;

  Map<String, dynamic> get singleData => _singleData;

  Future<void> listData() async {
    _isLoading = true;
    Response response = await service.listData();
    if (response.statusCode == 200) {
      _myData = response.body;
      update();
    } else {
      print(response.statusCode);
    }
  }

  Future<void> retrieveData({required int id}) async {
    _isLoading = true;
    Response response = await service.retrieveData(id: id);
    if (response.statusCode == 200) {
      _singleData = response.body;
    } else {
      print(response.statusCode);
    }
  }

  Future<void> postData(
      {required String name, required String description}) async {
    _isLoading = true;
    Response response =
        await service.postData(name: name, description: description);
    if (response.statusCode == 201) {
      update();
    } else {
      print(response.statusCode);
    }
  }

  Future<void> patchData(
      {required int id,
      required String name,
      required String description}) async {
    _isLoading = true;
    Response response =
        await service.patchData(id: id, name: name, description: description);
    if (response.statusCode == 201) {
      update();
    } else {
      print(response.statusCode);
    }
  }

  Future<void> deleteData({required int id}) async {
    _isLoading = true;
    update();
    Response response = await service.deleteData(id: id);
    if (response.statusCode == 204) {
    } else {
      print(response.statusCode);
    }
  }
}
