import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yoko_test_task/models/activities/activities.dart';
import 'package:yoko_test_task/style/app_colors.dart';
import 'package:yoko_test_task/ui/pages/activies/activities.controller.dart';

class ActivitiesPage extends StatefulWidget {
  ActivitiesPage({Key? key}) : super(key: key);

  @override
  State<ActivitiesPage> createState() => _ActivitiesPageState();
}

class _ActivitiesPageState extends State<ActivitiesPage> {
  List<Activity>? activities;
  @override
  void initState() {
    super.initState();
    Future.microtask(() async => activities =
        await Provider.of<ActivitiesController>(context, listen: false)
            .getActivities()).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        title: const Text(
          'Активности',
          style: TextStyle(color: AppColors.black),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.black,
          ),
        ),
      ),
      body: activities != null
          ? Padding(
              padding: const EdgeInsets.all(16),
              child: ListView.builder(
                  itemCount: activities?.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
                      child: Container(
                        width: double.infinity,
                        child: Stack(
                          children: [
                            Image.network(activities![index].imageUrl!)
                          ],
                        ),
                      ),
                    );
                  }),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
