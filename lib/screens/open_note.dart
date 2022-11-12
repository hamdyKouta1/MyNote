import 'package:flutter/material.dart';
import 'package:mynote/sqflite/db.helper.dart';
import '../constants/List.dart';
import '../constants/colors.dart';
import '../constants/famous_variable.dart';
import '../widgets/container_icon.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_form_field.dart';
import '../widgets/delete_button.dart';
import '../widgets/note_body.dart';
import '../widgets/save_button.dart';
import 'not_empty_screen.dart';

class OpenNote extends StatefulWidget {
  const OpenNote({Key? key}) : super(key: key);

  @override
  State<OpenNote> createState() => _OpenNote();
}

class _OpenNote extends State<OpenNote> {
  final key = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  DataBaseHelper? db;

  TextEditingController searchController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController taskController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    db = DataBaseHelper();
    db!.createDataBase();
  }
int x=countme!;

  @override
  Widget build(BuildContext context) {
    titleController.text = data[x]['title'];
    taskController.text  = data[x]['task'];
    timeController.text  = data[x]['time'];
    dateController.text  = data[x]['date'];

    return Scaffold(
      key: key,
      backgroundColor: mainColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: mainColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            countme = -1;
          },
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
            size: 30,
          ),
        ),
        title: CustomText(
          text: "Notes",
          fontSize: 40,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
        actions: [
          SizedBox(
            width: 160,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                      onTap: () {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            backgroundColor: mainColor,
                            title: CustomText(
                              text: 'Search For Notes',
                              fontWeight: FontWeight.w800,
                              fontSize: 25,
                              color: Colors.white,
                            ),
                            content: CustomTextFormField(
                              customController: searchController,
                              lable: "Search",
                              myIcon: Icons.search,
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Done'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Cancel'),
                              ),
                            ],
                          ),
                        );
                      },
                      child: ContainerIcon(
                        myIcon: Icons.search,
                      )),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                      onTap: () {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            backgroundColor: mainColor,
                            title: CustomText(
                              text: 'Notes',
                              fontWeight: FontWeight.w800,
                              fontSize: 35,
                              color: Colors.white,
                            ),
                            content: CustomText(
                              text: 'Designed by Hamdy Kouta',
                              fontWeight: FontWeight.w500,
                              fontSize: 30,
                              color: Colors.white,
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Done'),
                              ),
                            ],
                          ),
                        );
                      },
                      child: ContainerIcon(
                        myIcon: Icons.info_outline,
                      )),
                  const SizedBox(
                    width: 5,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        backgroundColor: Colors.green,
        child: const Icon(
          Icons.arrow_circle_up_outlined,
          size: 30,
        ),
        /**/

        onPressed: () {
          key.currentState!.showBottomSheet((context) {
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
                        GestureDetector(
                          onTap: () {
                            db!.updateData(
                                title: titleController.text,
                                task: taskController.text,
                                time: timeController.text,
                                date: dateController.text,
                                myId: countmeid!);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const NoteScreen()),
                            );
                          },
                          child: SaveButton(),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            db!.deleteData(check: data[countme!]['id']);
                            print("object");
                            setState(() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const NoteScreen()),
                              );
                            });
                          },
                          child: DeleteButton(),
                        ),
                      ],
                    )),
                  )),
            );
          });
        },
      ),
      body: SingleChildScrollView(
        child: NoteBody(
            color:colors[sendColor!],
            titleController: titleController,
            taskController: taskController,
            dateController: dateController,
            timeController: timeController),
      ),
    );
  }
}
