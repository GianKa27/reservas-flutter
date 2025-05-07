class CreateReservationForm {
  final int userId;
  final int spaceId;
  final DateTime startDate;
  final DateTime endDate;

  CreateReservationForm(
      {required this.userId,
      required this.spaceId,
      required this.startDate,
      required this.endDate});

  Map<String, dynamic> get toMap => {"": 1};
}
