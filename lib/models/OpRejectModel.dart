class OpRejectModel {
  String? status;
  String? admin;
  String? error;

  OpRejectModel.withError(String errorMessage){
    error = errorMessage;
  }
  OpRejectModel({this.status, this.admin});

  OpRejectModel.fromJson(Map<String, dynamic> json) {
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