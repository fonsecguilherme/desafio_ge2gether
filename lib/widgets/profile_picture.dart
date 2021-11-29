import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';


class ProfilePicture extends StatelessWidget {
  const ProfilePicture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularProfileAvatar(
      '',
      child: Image.asset('assets/images/perry.jpg'),
      radius: 35,
      borderColor: Colors.purple,
      borderWidth: 5,
    );
  }
}
