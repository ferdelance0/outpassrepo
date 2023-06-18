import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mini/Bloc/LoginBloc.dart';
import 'package:mini/Repository/api-repository.dart';
import 'package:mini/models/OpRejectModel.dart';


class RejectOpBloc extends Bloc<RejectOpEvents, RejectOpStates> {
  RejectOpBloc() : super(RejectInitial()) {
    final ApiRepository _apiRepository = ApiRepository();
    on<RejectPush>((event, emit) async {
      emit(RejectOpLoading());
      try {
        final Details = await _apiRepository.RejectOP(
          event.index,
          event.name,
        );
        emit(RejectOpSuccess(Details));
        print("HElllsinki");
        if (Details.error != null) {
          emit(RejectOpError(Details.error));
          print(Details.error);
        }
      } on NetworkError {
        emit(RejectOpError("Some sort of network issue"));
      }
    });
  }
}

class RejectOpError extends RejectOpStates {
  final String? error;
  RejectOpError(this.error);
}

class RejectOpSuccess extends RejectOpStates {
  final OpRejectModel details;
  RejectOpSuccess(this.details);
}

class RejectOpLoading extends RejectOpStates {}

class RejectPush extends RejectOpEvents {
  int index;
  String name;
  RejectPush({required this.index, required this.name});
}

class RejectInitial extends RejectOpStates {}

class RejectOpEvents extends Equatable {
  @override
  List<Object?> get props => [];
}

class RejectOpStates extends Equatable {
  @override
  List<Object?> get props => [];
}
