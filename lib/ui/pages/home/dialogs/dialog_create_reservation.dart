import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservations_flutter/core/utils/formatters.dart';
import 'package:reservations_flutter/core/utils/utils.dart';
import 'package:reservations_flutter/domain/forms/home/create_reservation_form.dart';
import 'package:reservations_flutter/ui/pages/home/home_controller.dart';
import 'package:reservations_flutter/ui/theme/app_theme.dart';

class DialogCreateReservation extends StatefulWidget {
  const DialogCreateReservation({super.key});

  @override
  State<DialogCreateReservation> createState() =>
      _DialogCreateReservationState();
}

class _DialogCreateReservationState extends State<DialogCreateReservation> {
  final HomeController _homeController = Get.find();

  CreateReservationForm _createReservationForm = CreateReservationForm();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Row(
                    children: [
                      Text(
                        'Select an space',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                        padding: EdgeInsets.only(left: 10),
                        scrollDirection: Axis.horizontal,
                        itemCount: _homeController.spaces.length,
                        itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                setState(() {
                                  _createReservationForm.spaceId =
                                      _homeController.spaces[index].id;
                                });
                              },
                              child: Container(
                                clipBehavior: Clip.antiAlias,
                                margin: EdgeInsets.all(5),
                                height: 100,
                                width: 200,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Stack(
                                  clipBehavior: Clip.antiAlias,
                                  children: [
                                    Positioned.fill(
                                      child: FadeInImage.assetNetwork(
                                          fit: BoxFit.cover,
                                          placeholder:
                                              "assets/general/placeholder_image.png",
                                          image: _homeController
                                                  .spaces[index].imageUrl ??
                                              'https://picsum.photos/300/300'),
                                    ),
                                    DecoratedBox(
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              begin: Alignment.bottomCenter,
                                              end: Alignment.topCenter,
                                              stops: [
                                            0.2,
                                            0.8
                                          ],
                                              colors: [
                                            AppTheme.primaryColor,
                                            Colors.transparent
                                          ])),
                                      child: SizedBox.expand(
                                        child: _createReservationForm.spaceId !=
                                                    null &&
                                                _homeController
                                                        .spaces[index].id ==
                                                    _createReservationForm
                                                        .spaceId
                                            ? Icon(Icons.check_circle)
                                            : SizedBox.shrink(),
                                      ),
                                    ),
                                    Positioned(
                                        left: 10,
                                        bottom: 5,
                                        child: Text(
                                            _homeController
                                                .spaces[index].nombre,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium))
                                  ],
                                ),
                              ),
                            )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        'Select a range of time',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () async {
                            final DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2025),
                                lastDate: DateTime(2027),
                                confirmText: "Set",
                                cancelText: "Cancel");

                            if (pickedDate != null) {
                              _createReservationForm.startDate = pickedDate;
                              setState(() {});
                            }
                          },
                          label: Text(_createReservationForm.startDate != null
                              ? Formatters.dateDmyhFormat(
                                  _createReservationForm.startDate)
                              : "Select a start date"),
                          icon: Icon(Icons.date_range),
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                        child: Text(
                          'to',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () async {
                            final DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2025),
                                lastDate: DateTime(2027),
                                confirmText: "Set",
                                cancelText: "Cancel");

                            if (pickedDate != null) {
                              _createReservationForm.endDate = pickedDate;
                              setState(() {});
                            }
                          },
                          label: Text(_createReservationForm.endDate != null
                              ? Formatters.dateDmyhFormat(
                                  _createReservationForm.endDate)
                              : "Select an end date"),
                          icon: Icon(Icons.date_range),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        'Select a user',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Wrap(
                      children: _homeController.users
                          .map((el) => ListTile(
                                onTap: () {
                                  _createReservationForm.userId = el.id;
                                  setState(() {});
                                },
                                leading: _createReservationForm.userId !=
                                            null &&
                                        _createReservationForm.userId == el.id
                                    ? Icon(
                                        Icons.radio_button_on,
                                        color: AppTheme.primaryColor,
                                      )
                                    : Icon(Icons.radio_button_off),
                                title: Text(el.nombre),
                                subtitle: Text(el.correo),
                              ))
                          .toList())
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text("Cancel")),
                const SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                    onPressed: () async {
                      try {
                        await Get.showOverlay(
                            asyncFunction: () async {
                              await _homeController
                                  .createReservation(_createReservationForm);
                            },
                            loadingWidget: Center(
                              child: CircularProgressIndicator(),
                            ));

                        Get.back();

                        Utils.showSnackbar(
                            status: CustomSnackbarStatus.success,
                            message: "Reservation created successfully");
                      } catch (e) {
                        Utils.showSnackbar(
                            status: CustomSnackbarStatus.warning,
                            message: "$e");
                      }
                    },
                    child: Text("Make a reservation"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
