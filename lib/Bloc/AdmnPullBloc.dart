import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mini/Bloc/LoginBloc.dart';
import 'package:mini/Repository/api-repository.dart';

import '../models/AdmnPullModel.dart';


class AdmnPullOpBloc extends Bloc<AdmnPullOpEvents, AdmnPullOpStates> {
  AdmnPullOpBloc() : super(AdmnPullInitial()) {
    final ApiRepository _apiRepository = ApiRepository();
    on<AdmnPullPush>((event, emit) async {
      emit(AdmnPullOpLoading());
      try {
        print("iosaodi");
        final Details = await _apiRepository.AdmnPull(
        );
        emit(AdmnPullOpSuccess(Details));
        print("HElll");
        if (Details.error != null) {
          emit(AdmnPullOpError(Details.error));
          print(Details.error);
        }
      } on NetworkError {
        emit(AdmnPullOpError("Some sort of network issue"));
      }
    });
  }
}

class AdmnPullOpError extends AdmnPullOpStates {
  final String? error;
  AdmnPullOpError(this.error);
}

class AdmnPullOpSuccess extends AdmnPullOpStates {
  final AdmnPullModel details;
  AdmnPullOpSuccess(this.details);
}

class AdmnPullOpLoading extends AdmnPullOpStates {}

class AdmnPullPush extends AdmnPullOpEvents {
  AdmnPullPush();
}

class AdmnPullInitial extends AdmnPullOpStates {}

class AdmnPullOpEvents extends Equatable {
  @override
  List<Object?> get props => [];
}

class AdmnPullOpStates extends Equatable {
  @override
  List<Object?> get props => [];
}
