import 'package:freezed_annotation/freezed_annotation.dart';

part 'reservation.freezed.dart';
part 'reservation.g.dart';

@Freezed()
class Reservation with _$Reservation {
  @JsonSerializable(explicitToJson: true)
  const factory Reservation({
    required String id,
    @JsonKey(name: "homes-allId") required String homesAllId,
    required String fullName,
    required String email,
    required int numberOfGuests,
    required DateTime checkIn,
    required DateTime checkOut,
  }) = _Reservation;

  factory Reservation.fromJson(Map<String, dynamic> json) =>
      _$ReservationFromJson(json);
}
