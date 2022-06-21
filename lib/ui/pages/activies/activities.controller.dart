import 'package:flutter/cupertino.dart';
import 'package:yoko_test_task/data/storage/secured_storage.dart';
import 'package:yoko_test_task/models/activities/activities.dart';
import 'package:yoko_test_task/repositories/activities.repository.dart';

class ActivitiesController extends ChangeNotifier {
  Future<List<Activity>?> getActivities() async {
    return await ActivitiesRepository().getActivities();
  }
}
