import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_provider/api/cheetah_api.dart';
import 'package:state_provider/controller/user_notifier.dart';
import 'package:state_provider/model/user.dart';
import 'package:state_provider/screens/user_list_screen.dart';

import 'package:state_provider/widget/cheetah_button.dart';
import 'package:state_provider/widget/cheetah_input.dart';
import 'package:state_provider/widget/user_list.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  String _name;
  String _city;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    UserNotifire userNotifire = Provider.of<UserNotifire>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Center(
          child: Text(
            context.watch<String>(),
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(32),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FutureProvider(
                create: (_) => getCurrentTime(),
                initialData: "Loading Time",
                child: Consumer<String>(
                  builder: (context, timeString, child) => Text(
                    timeString,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              SizedBox(height: 20),
              CheetahInput(
                labelText: 'Name',
                onSaved: (String value) {
                  _name = value;
                },
              ),
              SizedBox(height: 16),
              CheetahInput(
                labelText: 'City',
                onSaved: (String value) {
                  _city = value;
                },
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CheetahButton(
                    text: 'Add',
                    onPressed: () {
                      if (!_formKey.currentState.validate()) return;

                      _formKey.currentState.save();

                      userNotifire.addUser(User(_name, _city));
                      //addUser(User(_name, _city));
                    },
                  ),
                  SizedBox(width: 8),
                  CheetahButton(
                    text: 'List',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserListScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              UserList(),
            ],
          ),
        ),
      ),
    );
  }
}
