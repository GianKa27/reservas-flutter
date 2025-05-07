import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:reservations_flutter/core/utils/formatters.dart';
import 'package:reservations_flutter/ui/pages/home/dialogs/dialog_create_reservation.dart';
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

  DateTime? _daySelected;

  @override
  void initState() {
    _days = List.generate(21, (index) {
      return _today.subtract(Duration(days: 10 - index));
    });

    super.initState();
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
                onPageChanged: (_) {},
                itemBuilder: (context, index) => Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: _days[index] == (_daySelected ?? _today)
                          ? ElevatedButton(
                              onPressed: () async {
                                _daySelected = _days[index];

                                setState(() {});

                                await _pageController.animateToPage(index,
                                    duration: const Duration(seconds: 1),
                                    curve: Curves.decelerate);
                              },
                              child:
                                  Text(Formatters.dateDmyhFormat(_days[index])))
                          : OutlinedButton(
                              onPressed: () async {
                                _daySelected = _days[index];

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
          Wrap(
            children: [
              Container(
                height: 180,
                width: 340,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("2012-12-12 10:00:00"),
                        const Text('to'),
                        Text("2012-12-13 10:00:00")
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Expanded(
                        child: Image.asset(
                            'assets/general/placeholder_image.png')),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          'Reserved by',
                          style: TextStyle(
                              fontStyle: FontStyle.italic, fontSize: 12),
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
                          child: Row(
                            children: [
                              Icon(FontAwesomeIcons.userAstronaut),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Yuli Papitas",
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                            child: TextButton.icon(
                                style: TextButton.styleFrom(
                                    foregroundColor: AppTheme.dangerColor),
                                onPressed: () {},
                                icon: Icon(
                                  Icons.cancel,
                                  color: AppTheme.dangerColor,
                                ),
                                label: Text('Cancel')))
                      ],
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
