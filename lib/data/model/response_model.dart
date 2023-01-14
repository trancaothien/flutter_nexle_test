class ResponseModel<T> {
  ResponseModel({
    this.data,
    this.errors,
    this.statusCode,
    this.success,
  });
  T? data;
  Error? errors;
  int? statusCode;
  bool? success;

  ResponseModel.fromJson(dynamic json) {
    errors = Error.fromJson(json['errors']);
    statusCode = json['statusCode'];
    success = json['success'];
  }
}

class Error {
  Error({this.message, this.error, this.stack});
  List<String>? message;
  String? error;
  String? stack;

  Error.fromJson(dynamic json) {
    message = json != null
        ? List<String>.from(json['message'].map((model) => model))
        : [];
    error = json['error'];
    stack = json['stack'];
  }
}
