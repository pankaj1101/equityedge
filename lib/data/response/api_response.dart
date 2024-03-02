import 'package:equityedge/data/response/status.dart';

class ApiResponse<T> {
  String? message;
  Status? status;
  T? data;

  ApiResponse(this.message, this.status, this.data);

  
}
