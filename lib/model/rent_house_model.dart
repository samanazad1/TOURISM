import 'package:tourism/model/facilities_model.dart';

class RentHouseModel {
  final String name;
  final String image;
  final String hint;

  final String rating;
  final String price;
  final List<FacilitiesModel> facilites;
  const RentHouseModel({
    required this.name,
    required this.image,
    required this.hint,
    required this.rating,
    required this.price,
    required this.facilites,
  });
}
