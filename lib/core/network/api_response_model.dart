import 'package:equatable/equatable.dart';

class ApiResponse extends Equatable {
  final List? data;
  final String? error;

  const ApiResponse({
    this.data,
    this.error,
  });

  factory ApiResponse.fromJson(
    dynamic json,
  ) {
    return ApiResponse(
      data: json,
    );
  }

  @override
  List<Object?> get props => [data];
}
