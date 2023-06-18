import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../Repository/api-repository.dart';
import '../models/DeleteOpModel.dart';

class DeleteBloc extends Bloc<DeleteEvents, DeleteStates> {
  DeleteBloc() : super(DeleteInitial()) {
    final ApiRepository _apiRepository = ApiRepository();
    on<GetDelete>((event, emit) async {
      try {
        print("object");
        emit(DeleteLoading());
        final Delete = await _apiRepository.DeleteOP();
        //troubleshoothere
        // print(Delete.data2?[0].name);
        emit(DeleteLoaded(Delete));
        if (Delete.error != null) {
          emit(DeleteError(Delete.error));
          print(Delete.error);
        }
      } on NetworkError {
        emit(DeleteError("Some sort of network issue"));
      }
    });
  }
}













class DeleteEvents extends Equatable {
  @override
  List<Object?> get props => [];
}

class DeleteStates extends Equatable {
  @override
  List<Object?> get props => [];
}
class DeleteInitial extends DeleteStates {}

class DeleteLoading extends DeleteStates {}

class DeleteLoaded extends DeleteStates {
  final DeleteOpModel Delete;
  DeleteLoaded(this.Delete);
}

class DeleteError extends DeleteStates {
  final String? error;
  DeleteError(this.error);
}

class GetDelete extends DeleteEvents {}
