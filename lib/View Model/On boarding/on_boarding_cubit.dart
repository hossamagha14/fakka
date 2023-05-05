import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Model/on_boarding_model.dart';
import 'on_boarding_states.dart';

class OnBoardingCubit extends Cubit<OnBoardingStates> {
  OnBoardingCubit() : super(OnBoardingIntialState());

  static OnBoardingCubit get(context) => BlocProvider.of(context);
  int pageCounter=0;
  bool isLastPage=false;
  List<OnBoardingModel> onBoardingList = [
    OnBoardingModel(
        image: 'assets/images/on1.png',
        title1: 'With fakka you will take your change',
        title2:
            'Take back your change easily with a push of a button in less than one minute'),
    OnBoardingModel(
        image: 'assets/images/on2.png',
        title1: 'Save fakka, use it or even invest it',
        title2:
            'With fakka you can save the change, use it to pay for bills or even invest it'),
    OnBoardingModel(
        image: 'assets/images/on3.png',
        title1: 'Send and recieve money in seconds',
        title2: 'Sending and recieving money from family and friends has never been easier'),
  ];

  lastPage(int index){
    if(index==onBoardingList.length-1){
      isLastPage=true;
      emit(OnBoardingLastPageState());
    }
    else if(index != onBoardingList.length-1){
      isLastPage=false;
      emit(OnBoardingLastPageState());
    }
  }
}
