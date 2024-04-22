import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:salesbrozz/widgets/Common%20Widgets/Button.dart';
import '../../Get_x/C_D_Controller/C-d_Controller.dart';
import '../../widgets/Common Widgets/textfeild.dart';
import 'Common_/ComMon.dart';

class MyDistributorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DistriButorController controller = Get.put(DistriButorController());
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AddDialogeBoxAll(
                            citycontroller : controller.cityController.value,
                            namecontrller :  controller.nameController.value,
                            typecontroller : controller.typeController.value ,
                            contactcontrolller : controller.contactNumberController.value,
                            name: "name",
                            contact: "contact",
                            type: "Type",
                            city: "city",
                            saveontap: (){
                              controller.addDistibutor();
                              Get.back();
                            },
                            cancelontap: (){
                              Get.back();
                            }
                        );
                      },
                    );
                  },
                  child: Icon(Icons.person_add, color: Colors.white),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(4),
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.cyan,
                  ),),
                text(),
                SizedBox(width: 30,),
                Expanded(
                  child: searchbar(),
                ),
              ],
            ),
          ),
          SizedBox(height: 30,),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child:ArrowText(text:"My Customer")
          ),
          SizedBox(height: 5),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Card(
                shape:OutlineInputBorder(),
                color: Colors.white,
                child: Obx(() =>
                    DataTable(
                      columns: [
                        DataColumn(label: Text('Name')),
                        DataColumn(label: Text('Contact Number')),
                        DataColumn(label: Text('Type')),
                        DataColumn(label: Text('City')),
                        DataColumn(label: Text('Actions')),
                      ],
                      rows: controller.distributor.map((customer) => DataRow(
                        cells: [
                          DataCell(Text(customer['Name'] ?? '')),
                          DataCell(Text(customer['Contact Number'] ?? '')),
                          DataCell(Text(customer['Type'] ?? '')),
                          DataCell(Text(customer['City'] ?? '')),
                          DataCell(
                              Container(
                                  height: 30,
                                  width: 90,
                                  child: FButton(title: "Action", onpress: () {
                                    // Your action button functionality here
                                  })
                              )
                          ),
                        ],
                      )).toList(),
                    )
                )

            ),
          ),
        ],
      ),
    );
  }
}
