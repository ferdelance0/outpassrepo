import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mini/Repository/api-repository.dart';
import 'package:mini/models/AdminHomeDataModel.dart';
import 'package:intl/intl.dart';
class AdminHomeDataBloc extends Bloc<AdminHomeDataEvent, AdminHomeDataStates> {
  AdminHomeDataBloc() : super(AdminHomeDataInitial()) {
    final ApiRepository _apiRepository = ApiRepository();
    on<GetAdminHomeData>((event, emit) async {
      try {
        emit(AdminHomeDataLoading());
        final AdminHomeData = await _apiRepository.AdmnHomeDataPull();
        print(AdminHomeData);
        emit(AdminHomeDataLoaded(AdminHomeData));
        if (AdminHomeData.error != null) {
          emit(AdminHomeDataError(AdminHomeData.error));
          print(AdminHomeData.error);
        }
      } on Exception {
        emit(AdminHomeDataError("No More OutPasses"));
      }
    });
  }
}

class AdminHomeDataEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AdminHomeDataStates extends Equatable {
  @override
  List<Object?> get props => [];
}

class AdminHomeDataInitial extends AdminHomeDataStates {}

class AdminHomeDataLoading extends AdminHomeDataStates {}

class AdminHomeDataLoaded extends AdminHomeDataStates {
  final AdminHomeDataModel AdminHomeData;
  AdminHomeDataLoaded(this.AdminHomeData);
}

class AdminHomeDataError extends AdminHomeDataStates {
  final String? error;
  AdminHomeDataError(this.error);
}


class GetAdminHomeData extends AdminHomeDataEvent {}
