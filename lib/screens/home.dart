import 'package:first_flutter_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  String equation = 'equation';
  String sum = 'sum';
  List listButtons = [
    '+/-',
    '0',
    '.',
    '=',
    '1',
    '2',
    '3',
    '+',
    '4',
    '5',
    '6',
    '-',
    '7',
    '8',
    '9',
    'x',
    'CE',
    'C',
    'BS',
    '/'
  ];

  List functionButtons = [
    Icon(
      TablerIcons.percentage,
      size: 40,
      color: Colors.black,
    ),
    Icon(
      TablerIcons.square_root,
      size: 40,
      color: Colors.black,
    ),
    Icon(
      TablerIcons.superscript,
      size: 40,
      color: Colors.black,
    ),
    '1/x',
  ];

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
        child: Center(
          child: ListView(
            shrinkWrap: true,
            // mainAxisSize: MainAxisSize.min,
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.end,
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
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (ctxt, index) {
                    return myButton(functionButtons[index], () {});
                    ;
                  }),
              // Row(
              //   children: [
              //     myButton('%', () {
              //       print('hola amigo');
              //     }),
              //     myButton('1', () {
              //       print('hola amigo');
              //     }),
              //     myButton('2', () {
              //       print('hola amigo');
              //     }),
              //     myButton('3', () {
              //       print('hola amigo');
              //     }),
              //   ],
              // ),
              // // GridView.count(
              //   shrinkWrap: true,
              //   crossAxisCount: 4,
              //   children: [
              //     myButton('%', () {
              //       print('hola amigo');
              //     }),
              //     myButton('1', () {
              //       print('hola amigo');
              //     }),
              //     myButton('2', () {
              //       print('hola amigo');
              //     }),
              //     myButton('3', () {
              //       print('hola amigo');
              //     }),
              //   ],
              // )

              GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  reverse: true,
                  shrinkWrap: true,
                  itemCount: listButtons.length,
                  // jeśli builder musi być itemCount!
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (contx, index) {
                    return myButton(listButtons[index], () {});
                  })
            ],
          ),
        ),
      ),
    );
  }

  Widget myButton(
    buttonConntent,
    function,
  ) {
    return MaterialButton(
      elevation: 5.0,
      color: Colors.white,
      child: (buttonConntent is String)
          // jeżeli text jest Stringiem to wyświetl widget
          ? MyTextWidget(
              color: Colors.black,
              size: 25.0,
              text: buttonConntent,
            )
          : buttonConntent,
      // jeżeli nie to wyświetl text
      onPressed: function,
    );
  }
}
