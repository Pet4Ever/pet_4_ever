import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_4_ever/ui/pages/profile/upload_pet_profile.dart';

class AddProfileBox extends StatelessWidget {
  const AddProfileBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return UploadPetProfile();
        }));
      },
      child: Container(
        alignment: Alignment.center,
        color: Colors.transparent,
        padding: EdgeInsets.all(10),
        child: Icon(CupertinoIcons.plus_circled,
            color: Theme.of(context).highlightColor),
      ),
    );
  }
}
