import 'package:flutter/material.dart';
import 'package:myapp/api/models/user.dart';
import 'package:myapp/widget/profile.dart';

class ProfilePage extends StatefulWidget {
  static final route = "/profile";

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ProfileParam params = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[900],
        title: Container(
          margin: EdgeInsets.only(left:110),
          child: Center(child: const Text('Welcome To Pandasoft & Development'))),

      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  'https://i.pinimg.com/originals/ea/00/0c/ea000cc6fb9375b14a7b21d55dcf9745.jpg',
                ),
              ),
            ),
          ),
          Column(
            children: <Widget>[
              Center(
                child: Container(
                  margin: EdgeInsets.only(top:100),
                  child: CircleAvatar(
                    radius: 75,
                    child: ClipOval(
                      child: Image.asset(
                        "assets/images/user-profile.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              //ถ้าเปิด cors แล้ว ให้มาเปิด แท็กด้านล่างด้วยเด้อ
              _buildProfile(params.user),
              // // Container(

              // //   child: _buildProfile(
              // //     UserData(
              // //       branchTh: "ประชาอุทิศ",
              // //       fullNameTh: "Nawapan",
              // //     ),
              // //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }

  _buildProfile(UserData user) {
    return Profile(
      user: user,
    );
  }
}

class ProfileParam {
  final UserData user;
    
  ProfileParam({
    @required this.user,
  });
}
