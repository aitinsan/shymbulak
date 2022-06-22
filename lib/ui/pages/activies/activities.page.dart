import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yoko_test_task/models/activities/activities.dart';
import 'package:yoko_test_task/style/app_colors.dart';
import 'package:yoko_test_task/ui/pages/activies/activities.controller.dart';
import 'package:yoko_test_task/ui/pages/activies/activity_details.page.dart';

class ActivitiesPage extends StatefulWidget {
  const ActivitiesPage({Key? key}) : super(key: key);

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
            color: AppColors.primary,
          ),
        ),
      ),
      body: activities != null
          ? ListView.builder(
              padding: const EdgeInsets.only(bottom: 16),
              itemCount: activities?.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ActivityDetailPage(
                          activity: activities![index],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 200,
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    width: double.infinity,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16)),
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColors.black,
                            AppColors.white,
                            AppColors.primary,
                          ],
                        ),
                        image: DecorationImage(
                          opacity: 0.7,
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            activities![index].imageUrl!,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              activities![index].nameRu ?? "Без названия",
                              style: const TextStyle(
                                color: AppColors.white,
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              activities![index].description ??
                                  "Оплачивайте частые услуги просто!",
                              style: const TextStyle(
                                color: AppColors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              })
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
