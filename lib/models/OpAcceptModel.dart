class OpAcceptModel {
  String? status;
  String? admin;
  String? error;  OpAcceptModel({this.status, this.admin});

  OpAcceptModel.withError(String errorMessage){
    error = errorMessage;
  }
  OpAcceptModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    admin = json['admin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['admin'] = this.admin;
    return data;
  }
}