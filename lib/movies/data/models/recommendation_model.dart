import 'package:movies/core/network/api_constant.dart';
import 'package:movies/movies/domain/entites/recommended.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel({
    required super.backdropPath,
    required super.id,
  });

  factory RecommendationModel.fromJson(Map<String, dynamic> json) {
    return RecommendationModel(
        backdropPath: json['backdrop_path'] ?? ApiConstance.noDataFound,
        id: json['id']);
  }
}
