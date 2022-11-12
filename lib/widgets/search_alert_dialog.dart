import 'package:flutter/material.dart';
import 'package:mynote/screens/open_note_2.dart';
import '../constants/colors.dart';
import '../constants/famous_variable.dart';
import '../constants/function.dart';
import '../screens/open_note.dart';
import 'custom_text.dart';
import 'custom_text_form_field.dart';

class SearchAlertDialog extends StatelessWidget {
  const SearchAlertDialog({
    Key? key,
    required this.searchController,
  }) : super(key: key);

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: mainColor,
      title: CustomText(
        text: 'Search For Notes',
        fontWeight: FontWeight.w800,
        fontSize: 25,
        color: Colors.white,
      ),
      content: CustomTextFormField(
        customController: searchController,
        lable: "Search by Title",
        myIcon: Icons.search,
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            searchByTitle(searchController.text);
            sendColor = 10;
            if (goBySearch >= 0) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                    const OpenNoteBySearch()),
              );
              print(goBySearch);
              searchController.clear();
            }
            else {
              showDialog<String>(
                  context: context,
                  builder: (BuildContext context)=>
                      AlertDialog(
                        backgroundColor: mainColor,
                        title: CustomText(
                          text: 'NOT FOUND :(',
                          fontWeight: FontWeight.w800,
                          fontSize: 25,
                          color: Colors.white,
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              searchController.clear();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      )
              );
            }
          },
          child: const Text('Done'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            searchController.clear();
          },

          child: const Text('Cancel'),
        ),
      ],
    );
  }
}
