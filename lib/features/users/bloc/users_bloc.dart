import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_practice/features/users/bloc/users_bloc.dart';
import 'package:bloc_practice/features/users/modal/UserModal.dart';
import 'package:bloc_practice/features/users/repo/users_repo.dart';
import 'package:meta/meta.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc() : super(UsersInitial()) {
    on<FetchedInitialEvent>(fetchedInitialEvent);
    on<LikedButtonClickedEvent>(likedButtonClickedEvent);
    on<DisLikedButtonClickedEvent>(disLikedButtonClickedEvent);
  }

  FutureOr<void> fetchedInitialEvent(FetchedInitialEvent event, Emitter<UsersState> emit)async {

    emit(UsersLoadingState());

    List<UsersData> users=await UsersRepo.getUsers();

    if(users.isNotEmpty){
      emit(UsersSuccessState(list: users));
    }
    else{
      emit(UsersErrorState(errorMessage: "Error"));
    }

  }

  FutureOr<void> disLikedButtonClickedEvent(DisLikedButtonClickedEvent event, Emitter<UsersState> emit) {

    event.usersData[event.index].isLiked=false;
    emit(DisLikedUserState(usersDataList:  event.usersData));
    // emit(fetchedInitialEvent());



  }

  FutureOr<void> likedButtonClickedEvent(LikedButtonClickedEvent event, Emitter<UsersState> emit) {
    event.usersData[event.index].isLiked=true;
    emit(LikedUserState(usersDataList:  event.usersData));
  }
}

