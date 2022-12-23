import 'package:flutter/material.dart';

import '../../model/constants/app_constants.dart';

class YardimPage extends StatelessWidget {
  List<String> yardimMessage;
  int mesajSize;
  int vurguSize;
  YardimPage(
      {required this.vurguSize,
      required this.mesajSize,
      required this.yardimMessage,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        if (details.delta.dx > 0) {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Sabitler.anaRenk,
              size: 36,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            Sabitler.menuHeaderText,
            style: Sabitler.yardimHeaderStyle,
          ),
          backgroundColor: Colors.transparent,
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: mesajSize,
          itemBuilder: (context, index) {
            return index < vurguSize
                ? Card(
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(
                          yardimMessage[index],
                          style: Sabitler.alertBoxStyle,
                        ),
                        leading: CircleAvatar(
                          child: Text((index + 1).toString() + "."),
                        ),
                      ),
                    ),
                  )
                : Card(
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(
                          yardimMessage[index],
                          style: Sabitler.alertBoxStyle,
                        ),
                        leading: CircleAvatar(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          child: Text((index + 1).toString() + "."),
                        ),
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }
}
