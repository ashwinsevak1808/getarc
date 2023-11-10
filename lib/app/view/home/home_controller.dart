import 'package:get/get.dart';
import 'package:getarc/app/modal/home_modal.dart';
import 'package:getarc/app/view/home/home_repository.dart';

class HomeController extends GetxController {
  final HomeRepository repository;

  HomeController(this.repository);

  getData() async {
    var data = repository.getData();

    return HomeModal.fromJson(data as Map<String, dynamic>);
  }
}
