import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mini/Bloc/LoginBloc.dart';
import 'package:mini/Repository/api-repository.dart';
import 'package:mini/models/OpAcceptModel.dart';


class AcceptOpBloc extends Bloc<AcceptOpEvents, AcceptOpStates> {
  AcceptOpBloc() : super(AcceptInitial()) {
    final ApiRepository _apiRepository = ApiRepository();
    on<AcceptPush>((event, emit) async {
      emit(AcceptOpLoading());
      try {
        print("iosaodi");
        final Details = await _apiRepository.AcceptOP(
          event.index,
          event.name,
        );
        emit(AcceptOpSuccess(Details));
        print("HElll");
        if (Details.error != null) {
          emit(AcceptOpError(Details.error));
          print(Details.error);
        }
      } on NetworkError {
        emit(AcceptOpError("Some sort of network issue"));
      }
    });
  }
}

class AcceptOpError extends AcceptOpStates {
  final String? error;
  AcceptOpError(this.error);
}

class AcceptOpSuccess extends AcceptOpStates {
  final OpAcceptModel details;
  AcceptOpSuccess(this.details);
}

class AcceptOpLoading extends AcceptOpStates {}

class AcceptPush extends AcceptOpEvents {
  int index;
  String name;
  AcceptPush({required this.index, required this.name});
}

class AcceptInitial extends AcceptOpStates {}

class AcceptOpEvents extends Equatable {
  @override
  List<Object?> get props => [];
}

class AcceptOpStates extends Equatable {
  @override
  List<Object?> get props => [];
}
