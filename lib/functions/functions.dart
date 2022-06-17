
import '../main.dart';

setList(String email, String number) async {
  List<String>? value = pref.getStringList("email") ?? [];
  value.add(email);
  pref.setStringList("email", value);
  List<String>? valueNumber = pref.getStringList("number") ?? [];
  valueNumber.add(number);
  pref.setStringList("number", valueNumber);
}

Map<String, List<String>?> getListAll() {
  final list = pref.getStringList("email");
  final listnumber = pref.getStringList("number");
  if (list == null || listnumber == null) {
    return {};
  } else {
    final maping = {
      'emails': list,
      'numbers': listnumber,
    };

    return maping;
  }
}

bool cheakIsThere(String value) {
 
  if (pref.getStringList("email") == null ||
      pref.getStringList("email")!.isEmpty) {
    return true;
  } else {
    final list = pref.getStringList("email");

    for (var i = 0; i < list!.length; i++) {
      if (value.toLowerCase().trim() == list[i].toLowerCase().trim()) {
        return false;
      }
    }
    return true;
  }
}
bool cheakIsThereNumber(String value) {
 
  if (pref.getStringList("number") == null ||
      pref.getStringList("number")!.isEmpty) {
    return true;
  } else {
    final list = pref.getStringList("number");

    for (var i = 0; i < list!.length; i++) {
      if (value == list[i]) {
        return false;
      }
    }
    return true;
  }
}
