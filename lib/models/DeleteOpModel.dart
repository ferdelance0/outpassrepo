class DeleteOpModel {
  bool? status;
  String? msg;
  String? error;
  DeleteOpModel({this.status, this.msg});
  DeleteOpModel.withError(String errorMessage){
    error = errorMessage;
  }
  DeleteOpModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    return data;
  }
}
