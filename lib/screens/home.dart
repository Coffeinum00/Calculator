import 'package:first_flutter_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: MyTextWidget(
          color: Colors.black,
          text: 'Kalkulator!',
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
      body: Container(
        child: Text('Hello World'),
      ),
    );
  }
}
