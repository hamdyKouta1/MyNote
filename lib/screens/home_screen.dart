import 'package:flutter/material.dart';
import 'package:mynote/screens/not_empty_screen.dart';
import 'package:mynote/sqflite/db.helper.dart';
import '../constants/colors.dart';
import '../constants/famous_variable.dart';
import '../widgets/container_icon.dart';
import '../widgets/custom_text.dart';
import '../widgets/info_alert_dialog.dart';
import '../widgets/search_alert_dialog.dart';
import '../widgets/note_input_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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



@override
  Widget build(BuildContext context) {
    return empty == true ? Scaffold(
      key:key,
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
                          builder: (BuildContext context) =>
                              SearchAlertDialog(searchController: searchController),
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
                          builder: (BuildContext context) =>   const InfoAlertDialog(),
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
        backgroundColor: mainColor,
        child: const Icon(Icons.add,size: 30,),
        onPressed: () {
          key.currentState!.showBottomSheet((context) {
            return NoteInput(
                titleController: titleController,
                taskController: taskController,
                timeController: timeController,
                dateController: dateController,
                db: db);
          });
        },

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset("assets/images/background.png"),
                Positioned(
                    left: MediaQuery.of(context).size.width/4,
                    top: 340,
                    child: CustomText(
                        text: "Create your first note !",
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Colors.white))
              ],
            ),
          ],
        ),
      ),
    ) :const NoteScreen();

  }
}
