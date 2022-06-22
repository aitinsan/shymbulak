import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yoko_test_task/models/activities/activities.dart';
import 'package:yoko_test_task/style/app_colors.dart';
import 'package:yoko_test_task/style/app_spaces.dart';

class ActivityDetailPage extends StatelessWidget {
  const ActivityDetailPage({Key? key, required this.activity})
      : super(key: key);
  final Activity activity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [
              Container(
                height: 250,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  image: DecorationImage(
                    opacity: 0.6,
                    fit: BoxFit.fitWidth,
                    image: NetworkImage(
                      activity.imageUrl!,
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: AppColors.white,
                          ),
                        ),
                        Image.asset('assets/images/shymbulak_logo.png'),
                        const SizedBox.shrink(),
                      ],
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Text(
                      activity.nameRu ?? 'Без названия',
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 225,
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Дата посещения',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        const Text(
                          'Подзаголовок в одну строку',
                          style: TextStyle(
                            color: AppColors.gray,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Divider(
                          color: AppColors.gray,
                          height: 1,
                          thickness: 1,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.gray,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              )),
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/images/calendar.png'),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Text(
                                    'Выберите дату',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                              IconButton(
                                padding: const EdgeInsets.all(0),
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.arrow_forward_ios,
                                  // size: 16,

                                  color: AppColors.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: AppColors.primaryLight.withAlpha(20),
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              )),
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    activity.tariffs?.first.nameRu ?? 'Билет',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    activity.tariffs?.first.priceInfo?.price !=
                                            null
                                        ? activity
                                            .tariffs!.first.priceInfo!.price
                                            .toString()
                                        : 'Стоимость не указана',
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              IconButton(
                                padding: const EdgeInsets.all(0),
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.add_circle_outline,
                                  color: AppColors.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        verticalSpace(16),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                                color: AppColors.primary,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            padding: const EdgeInsets.all(20),
                            child: const Center(
                              child: Text(
                                'Перейти к оплате',
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        _buildBottomButton('Правила поведения в сноупарке'),
                        _buildBottomButton(
                          'Позвонить',
                          color: AppColors.primary,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomButton(String text, {Color color = AppColors.black}) {
    return Column(
      children: [
        verticalSpace(16),
        Divider(
          color: AppColors.gray,
          height: 1,
          thickness: 1,
        ),
        verticalSpace(16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(fontSize: 16, color: color),
            ),
            IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
