import 'package:first_flutter_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  // statefull żeby appka myślała i była reaktywna
  // gdy statefull użyj restart (zielona strzałka) a nie hot reload, bo appka już zapamiętuje!

  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // rozszerza homepage o stan [state]

  String? equation;

  String? sum;

  @override
  void initState() {
    super.initState();
    equation = '';
    sum = '0';

    // gdy widget się zbuduje wykona to co tu jest jako pierwsze
  }

  List listButtons = [
    Row(
      children: [
        const Icon(
          TablerIcons.plus,
          size: 20,
          color: Colors.black,
        ),
        MyTextWidget(
          size: 20,
          color: Colors.black,
          text: '/',
        ),
        const Icon(
          TablerIcons.minus,
          size: 20,
          color: Colors.black,
        ),
      ],
    ),
    '0',
    ',',
    const Icon(
      TablerIcons.equal,
      size: 40,
      color: Colors.black,
    ),
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

    //for commit!
    const Icon(
      TablerIcons.backspace,
      size: 40,
      color: Colors.black,
    ),
    '/',
    const Icon(
      TablerIcons.percentage,
      size: 40,
      color: Colors.black,
    ),
    const Icon(
      TablerIcons.square_root,
      size: 40,
      color: Colors.black,
    ),
    const Icon(
      TablerIcons.superscript,
      size: 40,
      color: Colors.black,
    ),
    '1/x',
  ];

  List functionButtons = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
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
              Container(
                height: 50.0,
                width: MediaQuery.of(context).size.width - 16,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    MyTextWidget(
                      text: equation,
                      color: Colors.grey,
                      size: 20.0,
                    ),
                  ],
                ),
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
              // Container(
              //   width: 250.0,
              //   height: 100.0,
              //   child: ListView.builder(
              //       scrollDirection: Axis.horizontal,
              //       shrinkWrap: true,
              //       itemCount: 4,
              //       itemBuilder: (ctxt, index) {
              //         return myButton(functionButtons[index], () {});
              //         ;
              //       }),
              // ),
              // // Row(
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
                    return myButton(listButtons[index], () {
                      if (listButtons[index] is String &&
                          listButtons[index] != 'CE' &&
                          listButtons[index] != 'C') {
                        // || -> or
                        // && -> and
                        // if (int.tryParse(listButtons[index]) is int) {
                        // }

                        setState(() {
                          // equation = equation! + listButtons[index];

                          equation = equation! + listButtons[index];
                        });
                      }

                      if (listButtons[index] is String &&
                          listButtons[index] == 'C') {
                        setState(() {
                          equation = '';
                          sum = '0';
                        });
                      }

                      if (listButtons[index] is Icon) {
                        Icon icon = listButtons[index];

                        if (icon.icon == TablerIcons.backspace) {
                          setState(() {
                            equation =
                                equation!.substring(0, equation!.length - 1);
                          });
                        } else if (icon.icon == TablerIcons.equal) {
                          sumFunction();
                        }
                      }
                    },
                        index >= listButtons.length - 4
                            ? Colors.blue[800]
                            : null);
                  })
            ],
          ),
        ),
      ),
    );
  }

  sumFunction() {
    Parser p = Parser();
    String input = equation!.replaceAll('x', '*');

    Expression exp = p.parse(input);

    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      sum = eval.toString();
    });
  }

  Widget myButton(
    buttonConntent,
    function,
    color,
  ) {
    color = color ?? Colors.blue[200];
    // color = color chyba  że color nie został podany to będzie white

    return MaterialButton(
      elevation: 0.0,
      color: color,
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
