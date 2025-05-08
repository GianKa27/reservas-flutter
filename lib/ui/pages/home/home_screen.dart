import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:reservations_flutter/core/utils/formatters.dart';
import 'package:reservations_flutter/core/utils/utils.dart';
import 'package:reservations_flutter/ui/pages/home/dialogs/dialog_create_reservation.dart';
import 'package:reservations_flutter/ui/pages/home/home_controller.dart';
import 'package:reservations_flutter/ui/theme/app_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DateTime _today = DateTime.now();
  late List<DateTime> _days;

  final PageController _pageController =
      PageController(viewportFraction: 0.09, initialPage: 10);

  final HomeController _homeController = Get.find();

  @override
  void initState() {
    _days = List.generate(21, (index) {
      return _today.subtract(Duration(days: 10 - index));
    });
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        await _homeController.getSpaces();
        await _homeController.getUsers();
      } catch (e) {
        Utils.showSnackbar(status: CustomSnackbarStatus.warning, message: "$e");
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reservations'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.dialog(DialogCreateReservation());
        },
        icon: Icon(FontAwesomeIcons.circlePlus),
        label: Text('Add reservation'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 20),
        children: [
          SizedBox(
            height: 30,
            child: PageView.builder(
                controller: _pageController,
                itemCount: _days.length,
                onPageChanged: (index) async {
                  try {
                    final startDate = DateTime(_days[index].year,
                        _days[index].month, _days[index].day, 0, 0, 0, 0);
                    final endDate = DateTime(_days[index].year,
                        _days[index].month, _days[index].day, 23, 59, 59, 0);

                    _homeController.startDateFilter = startDate;
                    _homeController.endDateFilter = endDate;
                    await _homeController.getReservations();
                  } catch (e) {
                    Utils.showSnackbar(
                        status: CustomSnackbarStatus.warning, message: "$e");
                  }
                },
                itemBuilder: (context, index) => Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: _days[index] ==
                              (_homeController.daySelected ?? _today)
                          ? ElevatedButton(
                              onPressed: () async {
                                _homeController.daySelected = _days[index];

                                setState(() {});

                                await _pageController.animateToPage(index,
                                    duration: const Duration(seconds: 1),
                                    curve: Curves.decelerate);
                              },
                              child:
                                  Text(Formatters.dateDmyhFormat(_days[index])))
                          : OutlinedButton(
                              onPressed: () async {
                                _homeController.daySelected = _days[index];

                                setState(() {});

                                await _pageController.animateToPage(index,
                                    duration: const Duration(seconds: 1),
                                    curve: Curves.decelerate);
                              },
                              child: Text(
                                  Formatters.dateDmyhFormat(_days[index]))),
                    )),
          ),
          const SizedBox(
            height: 20,
          ),
          GetBuilder<HomeController>(
            id: 'bodyReservations',
            init: _homeController,
            initState: (_) async {
              try {
                await _homeController.getReservations();
              } catch (e) {
                Utils.showSnackbar(
                    status: CustomSnackbarStatus.warning, message: "$e");
              }
            },
            builder: (_) => Wrap(
                children: _homeController.reservations
                    .map((el) => Container(
                          height: 210,
                          width: 340,
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white10,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(Formatters.dateDmyhFormat(el.startDate)),
                                  SizedBox(
                                      width: 30,
                                      child: const Text(
                                        'to',
                                        textAlign: TextAlign.center,
                                      )),
                                  Text(Formatters.dateDmyhFormat(el.endDate))
                                ],
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              Expanded(
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child:
                                          Image.network(el.space.imageUrl!))),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Reserved by',
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              FontAwesomeIcons.userAstronaut,
                                              size: 30,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  el.user.nombre,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall,
                                                ),
                                                Text(el.user.correo,
                                                    style: TextStyle(
                                                        fontSize: 10)),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                      child: TextButton.icon(
                                          style: TextButton.styleFrom(
                                              foregroundColor:
                                                  AppTheme.dangerColor),
                                          onPressed: () async {
                                            try {
                                              await Get.showOverlay(
                                                  asyncFunction: () async {
                                                    await _homeController
                                                        .cancelReservation(
                                                            el.id);
                                                  },
                                                  loadingWidget: Center(
                                                      child:
                                                          CircularProgressIndicator()));
                                            } catch (e) {
                                              Utils.showSnackbar(
                                                  status: CustomSnackbarStatus
                                                      .warning,
                                                  message: "$e");
                                            }
                                          },
                                          icon: Icon(
                                            Icons.cancel,
                                            color: AppTheme.dangerColor,
                                          ),
                                          label: Text('Cancel')))
                                ],
                              )
                            ],
                          ),
                        ))
                    .toList()),
          )
        ],
      ),
    );
  }
}
