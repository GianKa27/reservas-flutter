import 'package:flutter/material.dart';

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
                        margin: EdgeInsets.all(5),
                        height: 100,
                        width: 200,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: FadeInImage(
                            placeholder:
                                "https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png",
                            image:
                                "https://qhubobucaramanga.com/wp-content/uploads/2022/06/331_508623391.jpg"),
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
          ],
        ),
      ),
    );
  }
}
