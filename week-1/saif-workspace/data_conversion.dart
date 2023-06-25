import 'dart:math';

String s = '123';
String date = '2023-07-1';
var date2 = DateTime.now().toString();
var float = 1.2;
int side = 3;

int x = int.parse(s);
int y = int.tryParse(
    s)!; // tryParse returns a null that's why we need to say dart it's not null with ! sign.
var floatToString = float.toInt();
var floatToString2 = float.toString();
var floatToString3 = float.toStringAsFixed(3);

int sToString = s as int; // another way to typeCast
double area = pow(side, 2).toDouble();

final d = DateTime.tryParse(date); // will return null
final d2 = DateTime.tryParse(date2); // will return a dateTime successfully.
final d3 = date2 as DateTime;
final d4 = date2 as String; // unnecessary casting because it is already String.

void main(List<String> args) {
  // print(d);
  // print(date2);
  // print(d2);
}
