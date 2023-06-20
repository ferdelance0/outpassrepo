import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mini/Repository/api-repository.dart';
import 'package:mini/models/SecLopModel.dart';
import 'package:intl/intl.dart';
class SecLopBloc extends Bloc<SecLopEvent, SecLopStates> {
  SecLopBloc() : super(SecLopInitial()) {
    final ApiRepository _apiRepository = ApiRepository();
    on<GetSecLop>((event, emit) async {
      try {
        emit(SecLopLoading());

        final SecLop = await _apiRepository.SecLopPull(
            "${event.scannedText}"
        );
        print(SecLop);
        emit(SecLopLoaded(SecLop));
        if (SecLop.error != null) {
          emit(SecLopError(SecLop.error));
          print(SecLop.error);
        }
      } on Exception {
        emit(SecLopError("No More OutPasses"));
      }
    });
    on<GetSecLopInitial>((event, emit) async {
      try {
        emit(SecLopInitial());
      } on Exception {
        print("serom");
      }
    });
  }
}

class SecLopEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SecLopStates extends Equatable {
  @override
  List<Object?> get props => [];
}

class SecLopInitial extends SecLopStates {}

class SecLopLoading extends SecLopStates {}

class SecLopLoaded extends SecLopStates {
  final SecLopModel SecLop;
  SecLopLoaded(this.SecLop);
}

class SecLopError extends SecLopStates {
  final String? error;
  SecLopError(this.error);
}

class GetSecLop extends SecLopEvent {
  final String? scannedText;
  GetSecLop(this.scannedText);
}

class GetSecLopInitial extends SecLopEvent {
}
