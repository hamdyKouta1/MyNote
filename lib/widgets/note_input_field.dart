import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../sqflite/db.helper.dart';
import 'custom_date_floating.dart';
import 'custom_text.dart';
import 'custom_text_form_field.dart';
import 'custom_time_floating.dart';

class NoteInput extends StatelessWidget {
  const NoteInput({
    Key? key,
    required this.titleController,
    required this.taskController,
    required this.timeController,
    required this.dateController,
    required this.db,
  }) : super(key: key);

  final TextEditingController titleController;
  final TextEditingController taskController;
  final TextEditingController timeController;
  final TextEditingController dateController;
  final DataBaseHelper? db;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: mainColor,
      child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(15),
              topLeft: Radius.circular(15),
            ),
            color: thirdColor,
          ),
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomTextFormField(
                      customController: titleController,
                      lable: "Title",
                      myIcon: Icons.title,
                    ),
                    Divider(
                      thickness: 2,
                      color: mainColor,
                    ),
                    CustomTextFormField(
                      customController: taskController,
                      lable: "What is your Task?",
                      myIcon: Icons.task,
                    ),
                    Divider(
                      thickness: 2,
                      color: mainColor,
                    ),
                    CustomTimeFloating(timeController: timeController),
                    Divider(
                      thickness: 2,
                      color: mainColor,
                    ),
                    CustomDateFloating(dateController: dateController),
                    Divider(
                      thickness: 2,
                      color: mainColor,
                    ),
                    GestureDetector(
                      onTap: () {
                        db!
                            .insertToDataBase(
                            title: titleController.text,
                            task: taskController.text,
                            time: timeController.text,
                            date: dateController.text)
                            .then((value) {
                          Navigator.pop(context);
                          print("not me $value");
                          titleController.clear();
                          taskController.clear();
                          timeController.clear();
                          dateController.clear();
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: Colors.lightGreen,
                        ),
                        child: Center(
                            child: CustomText(
                                text: "Add",
                                fontWeight: FontWeight.w700,
                                fontSize: 30,
                                color: Colors.white)),
                      ),
                    )
                  ],
                ),),
          ),),
    );
  }
}