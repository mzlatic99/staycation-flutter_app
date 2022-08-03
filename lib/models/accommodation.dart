import 'package:freezed_annotation/freezed_annotation.dart';

part 'accommodation.freezed.dart';
part 'accommodation.g.dart';

@Freezed()
class Accommodation with _$Accommodation {
  @JsonSerializable(explicitToJson: true)
  const factory Accommodation(
      {required String id,
      required String imageUrl,
      required String title,
      String? shortDescription,
      String? longDescription,
      required String location,
      String? postalCode,
      required int price,
      required int categorization,
      int? capacity,
      String? accommodationType,
      bool? freeCancelation}) = _Accommodation;

  factory Accommodation.fromJson(Map<String, dynamic> json) =>
      _$AccommodationFromJson(json);
}
