import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mini/Repository/api-repository.dart';
import 'package:mini/models/RejectedOpModel.dart';
class RejectedOpBloc extends Bloc<RejectedOpEvent, RejectedOpStates> {
  RejectedOpBloc() : super(RejectedOpInitial()) {
    final ApiRepository _apiRepository = ApiRepository();
    on<GetRejectedOp>((event, emit) async {
      try {
        emit(RejectedOpLoading());
        final RejectedOp = await _apiRepository.RejecteDataPull();
        print(RejectedOp);
        emit(RejectedOpLoaded(RejectedOp));
        if (RejectedOp.error != null) {
          emit(RejectedOpError(RejectedOp.error));
          print(RejectedOp.error);
        }
      } on Exception {
        emit(RejectedOpError("No More OutPasses"));
      }
    });
  }
}

class RejectedOpEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class RejectedOpStates extends Equatable {
  @override
  List<Object?> get props => [];
}

class RejectedOpInitial extends RejectedOpStates {}

class RejectedOpLoading extends RejectedOpStates {}

class RejectedOpLoaded extends RejectedOpStates {
  final RejectedOpModel RejectedOp;
  RejectedOpLoaded(this.RejectedOp);
}

class RejectedOpError extends RejectedOpStates {
  final String? error;
  RejectedOpError(this.error);
}

class GetRejectedOp extends RejectedOpEvent {}
