
import 'package:flutter/material.dart';
import 'package:mynote/widgets/task_open_note.dart';
import 'package:mynote/widgets/title_open_note.dart';
import '../constants/colors.dart';
import '../constants/famous_variable.dart';
import 'custom_date.dart';
import 'custom_time.dart';

class NoteBody extends StatelessWidget {
  const NoteBody({
    Key? key,
    required this.color,
    required this.titleController,
    required this.taskController,
    required this.dateController,
    required this.timeController,
  }) : super(key: key);

  final TextEditingController titleController;
  final TextEditingController taskController;
  final TextEditingController dateController;
  final TextEditingController timeController;
  final Color color;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - 115,
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            color: mainColor,
          ),
          child: Column(
            children: [
              const SizedBox(height: 8,),
              CustomTitleOpenNote(
                  customController: titleController,
                  lable: "title",
                  myIcon: Icons.title),
              TaskTitleOpenNote(
                  customController: taskController,
                  lable: "title",
                  myIcon: Icons.title),
              CustomDate(dateController: dateController),
              CustomTime(timeController: timeController),
            ],
          ),
        ),
      ),
    );
  }
}
