import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_provider/controller/user_notifier.dart';
import 'package:state_provider/model/user.dart';

class UserList extends StatelessWidget {
  UserList();

  @override
  Widget build(BuildContext context) {
    //UserNotifire userNotifire = Provider.of<UserNotifire>(context);
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) => Card(
        elevation: 8,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Consumer<UserNotifire>(builder: (context, notifire, child) {
                    return Text(
                      'Name: ${notifire.userList[index].name}',
                      style: TextStyle(fontSize: 18),
                    );
                  }),
                  Consumer<UserNotifire>(builder: (context, notifire, child) {
                    return Text(
                      'Name: ${notifire.userList[index].city}',
                      style: TextStyle(fontSize: 18),
                    );
                  }),
                ],
              ),
              Consumer<UserNotifire>(builder: (context, notifire, child) {
                return IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => notifire.deleteUser(index),
                );
              })
            ],
          ),
        ),
      ),
      itemCount: context.watch<UserNotifire>().userList.length,
    );
  }
}
