import 'package:flutter/material.dart';
import 'package:mynote/sqflite/db.helper.dart';
import 'package:mynote/widgets/info_alert_dialog.dart';
import '../constants/List.dart';
import '../constants/colors.dart';
import '../constants/famous_variable.dart';
import '../widgets/card_note.dart';
import '../widgets/container_icon.dart';
import '../widgets/custom_text.dart';
import '../widgets/search_alert_dialog.dart';
import '../widgets/note_input_field.dart';
import 'open_note.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({Key? key}) : super(key: key);

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
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

  int reset=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      backgroundColor: mainColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: mainColor,
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
                        builder: (BuildContext context) => SearchAlertDialog(
                            searchController: searchController),
                      );
                    },
                    child: ContainerIcon(
                      myIcon: Icons.search,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) =>
                            const InfoAlertDialog(),
                      );
                    },
                    child: ContainerIcon(
                      myIcon: Icons.info_outline,
                    ),
                  ),
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
        backgroundColor: mainColor,
        child: const Icon(
          Icons.add,
          size: 30,
        ),
        onPressed: () {
          key.currentState!.showBottomSheet((context) {
            return NoteInput(
                titleController: titleController,
                taskController: taskController,
                timeController: timeController,
                dateController: dateController,
                db: db);
          });
          setState(() {
            db!.getDataFromDataBase(db);
          });

          },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListView.builder(
                  itemCount: data.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                   int colornum=index;
                    if(reset==10){
                      reset=0;
                    }
                   colornum>=10 ? colornum=reset++ : colornum=index;
                   return GestureDetector(
                      onTap: () {
                        setState(() {
                          countme = index;
                          countmeid = data[index]['id'];
                          sendColor = colornum;
                          print(countme);
                          reset=0;
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const OpenNote()),
                        );
                      },
                      child: Column(
                        children: [
                          CardNote(
                              title: data[index]['title'],
                              par:   data[index]['task'],
                              date:  data[index]['date'],
                              time:  data[index]['time'],
                              color:colors[ colornum ]//colorMePlease(index)
                            //
                          ),
                          const SizedBox(
                            height: 15,
                          )
                        ],
                      ),
                    );
                  }),
            ))
          ],
        ),
      ),
    );
  }
}

