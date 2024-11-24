import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String name;
  final String email;
  final String phoneNumber;
  final String gender;
  final String userToken;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.gender,
    required this.userToken,
  });

  Map<String, dynamic> toJson(Map<String, dynamic> map) => {
        'id': id,
        'name': name,
        'email': email,
        'phoneNumber': phoneNumber,
        'gender': gender,
        'userToken': userToken,
      };

  Map<String, dynamic> defaultMap() => {
        'id': '',
        'name': '',
        'email': '',
        'phoneNumber': '',
        'gender': '',
        'userToken': '',
      };
  @override
  List<Object?> get props => throw UnimplementedError();
}
