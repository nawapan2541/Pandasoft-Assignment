import 'package:flutter/material.dart';
import 'package:myapp/api/models/user.dart';

class Profile extends StatelessWidget {
  final UserData user;

  const Profile({
    Key key,
    @required this.user,
  }) : super(key: key);
//ถ้าเปิด core แล้ว ให่กลับมาตกแต่งในนี้
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 50),
              height: 400,
              width: 400,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                elevation: 8,
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 40),
                        child: Text(
                          'Profile',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 40),
                        child: Text(
                          'Name : ${user.fullNameTh}',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 20),
                        child: Text(
                          'Branch : ${user.branchTh}',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 20),
                        child: Text(
                          'Role : ${user.roleTh}',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                       Container(
                        padding: EdgeInsets.only(top: 20),
                        child: Text(
                          'UserId : ${user.userId}',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 20),
                        child: Text(
                          'Role-Code : ${user.roleCode}',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
