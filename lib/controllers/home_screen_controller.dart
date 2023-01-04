import 'package:get/get.dart';

class HomeScreenController extends GetxController{
  RxInt count=0.obs;

  increment(){
    print(count);
    count(++count.value);
  }


}