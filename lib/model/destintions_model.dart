import 'package:tourism/model/rent_house_model.dart';
import 'package:tourism/model/resorts_model.dart';
import 'package:tourism/model/todos_model.dart';

class DestintionsModel {
  final String name;
  final String image;
  final List<RentHouseModel> rentHouses;
  final List<TodosModel> todos;
  final List<ResortsModel> resorts;

  const DestintionsModel({
    required this.name,
    required this.image,
    required this.rentHouses,
    required this.todos,
    required this.resorts,
  });
  DestintionsModel defaulMap() {
    return DestintionsModel(
        image: "", name: "", rentHouses: [], resorts: [], todos: []);
  }
}
