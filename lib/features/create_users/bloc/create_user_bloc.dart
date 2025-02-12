import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_practice/features/create_users/model/create_user_model.dart';
import 'package:bloc_practice/features/create_users/repo/create_user_repo.dart';
import 'package:meta/meta.dart';

part 'create_user_event.dart';

part 'create_user_state.dart';

class CreateUserBloc extends Bloc<CreateUserEvent, CreateUserState> {
  CreateUserBloc() : super(CreateUserInitial()) {
    on<CreateUserButtonClickedEvent>(createUserButtonClickedEvent);
  }

  FutureOr<void> createUserButtonClickedEvent(
      CreateUserButtonClickedEvent event, Emitter<CreateUserState> emit) async {
    emit(CreateUserLoadingState());

    CreateUserModel createUserModel =
        await CreateUserRepo.createUser(name: event.name, job: event.job);
    if (createUserModel != null) {
      emit(CreateUserSuccessState(createUserModel: createUserModel));
    } else {
      emit(CreateUserErrorState());
    }
  }
}
