import 'package:get/get.dart';

class JobDetailsController extends GetxController {
  int selectedIndex = 0;
  bool isReadMore = false;
  List<Map<String, dynamic>> jobDetailsList = [
    {'title': 'Description'},
    {'title': 'Map'},
    {'title': 'Company'},
    {'title': 'Review'},
  ];

  readMore() {
    isReadMore = !isReadMore;
    update();
  }

  selectJobDetails(int index) {
    selectedIndex = index;
    update();
  }
}
