import 'package:first_flutter_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  String equation = 'equation';
  String sum = 'sum';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: MyTextWidget(
          color: Colors.black,
          size: 25.0,
          text: 'Kalkulator',
        ),
        centerTitle: true,
        leading: const Icon(
          // leading jest zawsze pojedyncze, po lewej stronie appbaru
          Icons.menu,
          size: 40.0,
          color: Colors.black,
        ),
        actions: [
          // acctions to wszystko co jest po prawej stronie od title w appbarze
          const Icon(
            Icons.history,
            size: 40.0,
            color: Colors.black,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyTextWidget(
                  text: equation,
                  color: Colors.grey,
                  size: 20.0,
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyTextWidget(
                  text: sum,
                  color: Colors.blue,
                  size: 35.0,
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Divider(
              thickness: 1.5,
              color: Colors.grey,
            ),
            Row(
              children: [
                myButton('%', () {
                  print('hola amigo');
                }),
                myButton('1', () {
                  print('hola amigo');
                }),
                myButton('2', () {
                  print('hola amigo');
                }),
                myButton('3', () {
                  print('hola amigo');
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget myButton(String text, function) {
    return Expanded(
      child: MaterialButton(
        elevation: 5.0,
        color: Colors.white,
        child: MyTextWidget(
          color: Colors.black,
          size: 25.0,
          text: text,
        ),
        onPressed: function,
      ),
    );
  }
}
