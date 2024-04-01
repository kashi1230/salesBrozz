

import 'package:salesbrozz/widgets/text/textbuilder.dart';

import '../../controller/dashboard_controller.dart';
import '../../imports.dart';
import '../../utils/commons.dart';

class StatsCardTile extends StatelessWidget {
  final DashboardController? data;
  final int? index;
  const StatsCardTile({Key? key, this.index, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            color: Commons.dashColor[index!],
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(data!.dashboardPurchaseList[index!].icon, color: Colors.white, size: 40),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextBuilder(text: data!.dashboardPurchaseList[index!].value!, fontSize: 17.0, color: Colors.white),
                    TextBuilder(
                      text: data!.dashboardPurchaseList[index!].title!,
                      textOverflow: TextOverflow.clip,
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
