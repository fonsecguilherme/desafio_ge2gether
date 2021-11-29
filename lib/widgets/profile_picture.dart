import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  final String image;
  const ProfilePicture({Key? key,required this.image}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return CircularProfileAvatar(
      '',
      child: Image.asset(image),
      radius: 35,
      borderColor: Colors.purple,
      borderWidth: 5,
    );
  }
}
