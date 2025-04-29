import 'package:flutter/material.dart';

class ContactDetailScreen extends StatelessWidget {
  final int index;
  final Map contact;
  final Function(int, Map) onUpdate;
  final Function(int) onDelete;

  ContactDetailScreen({
    required this.index,
    required this.contact,
    required this.onUpdate,
    required this.onDelete,
  });

  final nameController = TextEditingController();
  final numberController = TextEditingController();
  final addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameController.text = contact['names'];
    numberController.text = contact['number'];
    addressController.text = contact['addres'];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Contact Details'),
          actions: [
            IconButton(
              icon: Icon(Icons.edit, color: Color(0xFFff0030)),
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  builder: (context) {
                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                        left: 20,
                        right: 20,
                        top: 20,
                      ),
                      child: Wrap(
                        children: [
                          Text("Edit Contact", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          SizedBox(height: 10),
                          TextField(
                            controller: nameController,
                            decoration: InputDecoration(labelText: "Name"),
                          ),
                          TextField(
                            controller: numberController,
                            decoration: InputDecoration(labelText: "Phone"),
                            keyboardType: TextInputType.phone,
                          ),
                          TextField(
                            controller: addressController,
                            decoration: InputDecoration(labelText: "Address"),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  onUpdate(index, {
                                    'names': nameController.text,
                                    'number': numberController.text,
                                    'addres': addressController.text,
                                  });
                                  Navigator.pop(context); // Close bottom sheet
                                  Navigator.pop(context); // Return to main screen
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  foregroundColor: Colors.white,
                                ),
                                child: Text("Update"),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  foregroundColor: Colors.white,
                                ),
                                onPressed: () => Navigator.pop(context),
                                child: Text("Cancel"),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.delete, color: Color(0xFFff0030)),
              onPressed: () {
                onDelete(index);
                Navigator.pop(context);
              },
            ),
            SizedBox(width: 10),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 100),
                  CircleAvatar(
                    radius: 70,
                    child: Text(
                      contact['names'][0],
                      style: TextStyle(fontSize: 50),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(contact['names'], style: TextStyle(fontSize: 25)),
                  SizedBox(height: 20),
                  buildDetailBox("Mobile Number", contact['number'],Icon(Icons.call,color: Colors.grey.shade800,)),
                  SizedBox(height: 10),
                  buildDetailBox("Address", contact['addres'],Icon(Icons.location_pin,color: Colors.grey.shade800,)),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      SizedBox(width: 15),
                      Icon(Icons.block, size: 25, color: Color(0xFFff0030)),
                      SizedBox(width: 10),
                      Text(
                        "Block Number",
                        style: TextStyle(
                          color: Color(0xFFff0030),
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50,),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(image: AssetImage("assets/images/logo.png"),
                        width: 20,
                          height: 20,
                        ),
                        SizedBox(width: 10,),
                        Text("Powered By"),
                        SizedBox(width: 5,),
                        Text("KONNECTLY",
                        style: TextStyle(
                          color: Color(0xff22CAC5),
                          fontFamily: "Lexend",
                          fontStyle: FontStyle.italic
                        ),)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDetailBox(String title, String content, Widget icon) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(color: Color(0xFFff0030))),
          SizedBox(height: 5),
          Row(
            children: [
              icon,
              SizedBox(width: 10,),
              Text(content, style: TextStyle(fontSize: 18)),
            ],
          ),
        ],
      ),
    );
  }
}
