import 'package:equatable/equatable.dart';

class RatingModel extends Equatable {
  final double rate;
  final int count;
  RatingModel({required this.rate, required this.count});
// this function is used to convert the object to a map, which can be used to convert the object to json
  Map<String, dynamic> toMap() {
    return {'rate': rate, 'count': count};
  }
// this function is used to convert the map to an object, which can be used to convert the json to an object
  factory RatingModel.fromMap(Map<String, dynamic> map) {
    return RatingModel(rate: map['rate'], count: map['count']);
  }

  @override
  List<Object?> get props => [rate, count];
}
