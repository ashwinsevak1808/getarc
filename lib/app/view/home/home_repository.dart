
import '../../data/api/api_manager.dart';

class HomeRepository {
  final ApiManager apiManager;
  HomeRepository(this.apiManager);

  Future<void> getData() async {
    apiManager.get('products');
  }
}
