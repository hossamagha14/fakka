import 'package:fakka/View%20Model/Log/log_in_states.dart';
import 'package:fakka/View%20Model/database/cache_helpher.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInCubit extends Cubit<SignInStates> {
  SignInCubit() : super(SignInIntialState());

  static SignInCubit get(context) => BlocProvider.of(context);
  bool secure = true;

  showPassword() {
    secure = !secure;
    emit(SignInShowPasswordState());
  }

  signIn({required String email, required String password}) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      CacheHelper.saveData(key: 'uid',value: value.user!.uid);
      print(value.user);
      emit(SignInSuccessState());
    }).catchError((onError) {
      emit(SignInFailState());
    });
  }
}
