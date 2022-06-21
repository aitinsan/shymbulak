import 'package:yoko_test_task/data/network/http_query.dart';
import 'package:yoko_test_task/models/activities/activities.dart';

class ActivitiesRepository {
  final Http _http = Http();
  Future<List<Activity>?> getActivities() async {
    final List response = await _http.get(
        url: 'ticket-service/ticket-types/by-category-code/ACTIVITIES');
    return response.map((e) => Activity.fromJson(e)).toList();
  }
}
