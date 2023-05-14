import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mini/Repository/api-repository.dart';
import 'package:mini/models/DetailsModel.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsStates> {
  DetailsBloc() : super(DetailsInitial()) {
    final ApiRepository _apiRepository = ApiRepository();
    on<GetDetails>((event, emit) async {
      try {
        emit(DetailsLoading());
        final Details = await _apiRepository.fetchStudentDetails();
        print(Details.data1);
        emit(DetailsLoaded(Details));
        if (Details.error != null) {
          emit(DetailsError(Details.error));
          print(Details.error);
        }
      } on NetworkError {
        emit(DetailsError("Some sort of network issue"));
      }
    });
  }
}

class DetailsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class DetailsStates extends Equatable {
  @override
  List<Object?> get props => [];
}

class DetailsInitial extends DetailsStates {}

class DetailsLoading extends DetailsStates {}

class DetailsLoaded extends DetailsStates {
  final DetailsModel details;
  DetailsLoaded(this.details);
}

class DetailsError extends DetailsStates {
  final String? error;
  DetailsError(this.error);
}

class GetDetails extends DetailsEvent {}
