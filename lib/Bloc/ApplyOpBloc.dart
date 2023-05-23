import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mini/Bloc/LoginBloc.dart';
import 'package:mini/Repository/api-repository.dart';
import 'package:mini/models/ApplyOpModel.dart';

class ApplyOpBloc extends Bloc<ApplyOpEvents, ApplyOpStates> {
  ApplyOpBloc() : super(ApplyInitial()) {
    final ApiRepository _apiRepository = ApiRepository();
    on<ApplyPush>((event, emit) async {
      emit(ApplyOpLoading());
      try {
        final Details = await _apiRepository.ApplyOpDetails(
            event.ad,
            event.Destination,
            event.Purpose,
            event.Dateofleaving,
            event.Dateofreturn
        );
        print(Details.data);
        emit(ApplyOpSuccess(Details));
        if (Details.error != null) {
          emit(ApplyOpError(Details.error));
          print(Details.error);
        }
      } on NetworkError {
        emit(ApplyOpError("Some sort of network issue"));
      }
    });
  }
}

class ApplyOpError extends ApplyOpStates {
  final String? error;
  ApplyOpError(this.error);
}

class ApplyOpSuccess extends ApplyOpStates {
  final ApplyOpModel details;
  ApplyOpSuccess(this.details);
}

class ApplyOpLoading extends ApplyOpStates {}

class ApplyPush extends ApplyOpEvents {
  final String ad, Destination, Purpose, Dateofleaving, Dateofreturn;
  ApplyPush(
      {required this.ad,
      required this.Destination,
      required this.Purpose,
      required this.Dateofleaving,
      required this.Dateofreturn});
}

class ApplyInitial extends ApplyOpStates {}

class ApplyOpEvents extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class ApplyOpStates extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}
