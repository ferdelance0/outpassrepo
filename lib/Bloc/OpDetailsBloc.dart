import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mini/models/OpDetailsModel.dart';

import '../Repository/api-repository.dart';


class OpDetailsBloc extends Bloc<OpDetailsEvents,OpDetailsStates>{
  OpDetailsBloc() : super(OpDetailsInitial()){
    final ApiRepository _apiRepository = ApiRepository();
    on<AllOpDetailsPull>((event, emit) async {
      emit(OpDetailsLoading());
      try{
        final Details = await _apiRepository.AllOpDetailsPull();
        if(Details.status!="Success"){
          emit(OpDetailsSuccess(Details));
        };
        if (Details.error != null) {
          emit(OpDetailsError(Details.error));
          print(Details.error);
        }
      }  on NetworkError {
    emit(OpDetailsError("Some sort of network issue"));
    }
    });

  }

}




class OpDetailsEvents extends Equatable{
  List<Object?> get props => [];
}
class OpDetailsStates extends Equatable{
  List<Object?> get props => [];
}
class OpDetailsError extends OpDetailsStates{
  final String? error;
  OpDetailsError(this.error);
}
class OpDetailsSuccess extends OpDetailsStates{
  OpDetailsModel details;
  OpDetailsSuccess(this.details);
}
class OpDetailsInitial extends OpDetailsStates{}
class OpDetailsLoading extends OpDetailsStates{}
class AllOpDetailsPull extends OpDetailsEvents{}