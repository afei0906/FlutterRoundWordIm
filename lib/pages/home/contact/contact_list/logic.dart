part of '../../index.dart';

class ContactListLogic extends GetxController {
  final ContactListState state = ContactListState();

  void toAdd() {}

  void toNewFriends(){

  }

  void toMyGroup(){

  }
}

extension ContactListLogicX on ContactListLogic {
  void onChanged() {
    update();
  }

  void onSubmitted() {}
}
