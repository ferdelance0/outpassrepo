import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mini/Repository/api-repository.dart';
import 'package:mini/models/SecVerifModel.dart';
import 'package:intl/intl.dart';
class SecVerifBloc extends Bloc<SecVerifEvent, SecVerifStates> {
  SecVerifBloc() : super(SecVerifInitial()) {
    final ApiRepository _apiRepository = ApiRepository();
    on<GetSecVerif>((event, emit) async {
      try {
        emit(SecVerifLoading());

        final SecVerif = await _apiRepository.SecVerifPull(
          "${event.scannedText}"
        );
        print(SecVerif);
        emit(SecVerifLoaded(SecVerif));
        if (SecVerif.error != null) {
          emit(SecVerifError(SecVerif.error));
          print(SecVerif.error);
        }
      } on Exception {
        emit(SecVerifError("No More OutPasses"));
      }
    });
    on<GetSecInitial>((event, emit) async {
      try {
        emit(SecVerifInitial());
      } on Exception {
        print("serom");
      }
    });
  }
}

class SecVerifEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SecVerifStates extends Equatable {
  @override
  List<Object?> get props => [];
}

class SecVerifInitial extends SecVerifStates {}

class SecVerifLoading extends SecVerifStates {}

class SecVerifLoaded extends SecVerifStates {
  final SecVerifModel SecVerif;
  SecVerifLoaded(this.SecVerif);
}

class SecVerifError extends SecVerifStates {
  final String? error;
  SecVerifError(this.error);
}

class GetSecVerif extends SecVerifEvent {
  final String? scannedText;
  GetSecVerif(this.scannedText);
}

class GetSecInitial extends SecVerifEvent {
}
