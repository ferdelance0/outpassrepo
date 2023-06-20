class SecVerifModel {
  String? status;

  String? error;

  SecVerifModel.withError(String errorMessage){
    error = errorMessage;
  }  SecVerifModel({this.status});

  SecVerifModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    return data;
  }
}