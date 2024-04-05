

import 'package:salesbrozz/widgets/text/textbuilder.dart';

import '../../imports.dart';
import '../../model/profile_model.dart';

class ProfileButtonTile extends StatelessWidget {
  final ProfileModel? data;
  final Function()? onTap;
  const ProfileButtonTile({Key? key, this.data, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          height: 60.0,
          child: Row(
            children: [
              const SizedBox(width: 20.0),
              Icon(
                data!.icon!,
                size: 35.0,
                color: data!.textColor,
              ),
              const SizedBox(width: 20.0),
              TextBuilder(
                text: data!.title,
                fontSize: 20.0,
                color: data!.textColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
