import 'dart:core';

const String name = 'Adi'; // runtime constants
const String car = 'test'; // compile-time constans
const String car1 = 'test'; // compile-time constans
const String car2 = 'test'; // compile-time constans
const String car3 = 'test'; // compile-time constans

bool test = true;
void main() {
  // String _name = 'Cosmin';
  // List<String> list = <String> [
  //   "Cosmin",
  //   "Cosmin",
  //   if(test) "ceva" else "altceva",
  //   for (int i =0; i < 10; i++) "$i"
  // ];
  // print(list);
  // Set<String> set = <String> {
  //   "Cosmin",
  //   "Cosmin",
  //   if(test) "ceva" else "altceva",
  //   for (int i =0; i < 10; i++) "$i"
  // };
  // print(set);
  // Map<String, int> map = <String, int> {
  //   'nane' : 10,
  //   if (test) "ceva":10 else "altceva":20,
  //   for(int i = 0; i < 10; i++) "$i" : i
  // };
  // print(map);
  //
  // for(int i = 0; i < list.length; i++) {
  //   final String item = list[i];
  //   print(item);
  // }
  //
  // for(String item in list){
  //   print(item);
  // }

  List<String> list = <String>["Cosmin", "Razvan"];
  // map
  // expand
  // toList

  final items = list.map((String element) => element).toList();
  //print(items);

  // list.expand((element) => null)
}
