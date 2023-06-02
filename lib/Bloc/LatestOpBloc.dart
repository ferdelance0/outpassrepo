import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mini/models/LatestOpModel.dart';

import '../Repository/api-repository.dart';
import '../models/LatestOpModel.dart';

class LatestOpBloc extends Bloc<LatestOpEvents,LatestOpStates>{
  LatestOpBloc() :super(LatestInitial()){;
    final ApiRepository _apiRepository = ApiRepository();
    on<GetLatestDetails>((event, emit) async {
      try{
        emit(LatestLoading());
        final latestOp= await _apiRepository.LatestOpPull();
        print(latestOp.data1);
        emit(LatestLoaded(latestOp));
        if (latestOp.error != null) {
          emit(LatestError(latestOp.error));
          print(latestOp.error);
        }
      }on NetworkError {
        emit(LatestError("Some sort of network issue"));
      }

    });
  }
}

class LatestLoaded extends LatestOpStates {
  final LatestOpModel Details;
  LatestLoaded(this.Details);
}

class LatestLoading extends LatestOpStates{
}

class LatestError extends LatestOpStates{
  final String? error;
  LatestError(this.error);
}

class GetLatestDetails extends LatestOpEvents{
}

class LatestInitial extends LatestOpStates{
}








class LatestOpStates extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class LatestOpEvents extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
