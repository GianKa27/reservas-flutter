import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservations_flutter/ui/theme/app_theme.dart';

class DialogCreateReservation extends StatefulWidget {
  const DialogCreateReservation({super.key});

  @override
  State<DialogCreateReservation> createState() =>
      _DialogCreateReservationState();
}

class _DialogCreateReservationState extends State<DialogCreateReservation> {
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
                        itemCount: 10,
                        itemBuilder: (context, index) => Container(
                              clipBehavior: Clip.antiAlias,
                              margin: EdgeInsets.all(5),
                              height: 100,
                              width: 200,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppTheme.primaryColor, width: 3),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    child: FadeInImage.assetNetwork(
                                        placeholder:
                                            "assets/general/placeholder_image.png",
                                        image: "https://picsum.photos/300/300"),
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
                                    child: const SizedBox.expand(),
                                  ),
                                  Positioned(
                                      left: 10,
                                      bottom: 5,
                                      child: Text("Playshots mera rumba",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium))
                                ],
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
                          onPressed: () {},
                          label: Text("Select a start date"),
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
                          onPressed: () {},
                          label: Text("Select an End date"),
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
                    children: [
                      ListTile(
                        leading: Icon(Icons.radio_button_off),
                        title: Text('Yuli Papitas'),
                        subtitle: Text('papitas_de_tomate@gmail.com'),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.radio_button_on,
                          color: AppTheme.primaryColor,
                        ),
                        title: Text('Yuli Papitas'),
                        subtitle: Text('papitas_de_tomate@gmail.com'),
                      )
                    ],
                  )
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
                    onPressed: () {}, child: Text("Make a reservation"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
