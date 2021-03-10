import 'package:braille_abc/components/bottom_bar_widget.dart';
import 'package:braille_abc/models/help_model.dart';
import 'package:braille_abc/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        leading: CupertinoNavigationBarBackButton(
          onPressed: () {
            scakey.currentState.onItemTapped(0);
          },
        ),
        middle: Text(
          "Test",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        trailing: Icon(CupertinoIcons.ear),
      ),
      body: SafeArea(
        child: Container(
          child: FutureBuilder(
              future: HomeScreen.getContactsFromXML(context),
              builder: (context, data) {
                if (data.hasData) {
                  List<Contact> contacts = data.data;
                  return ListView.builder(
                      itemCount: contacts.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            contacts[index].name,
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(contacts[index].email),
                        );
                      });
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ),
      ),
    );
  }
}
