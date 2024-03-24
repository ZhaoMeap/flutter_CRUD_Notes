import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_demo/services/firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // firestore
  final FirestoreService firestoreService = FirestoreService();

  // text controller
  final TextEditingController textController = TextEditingController();

  // open a dialog to add a note
  void openNoteBox({String? docID}) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(content: TextField(
          controller: textController,
        ), actions: [
              ElevatedButton(
                  onPressed: () {
                    // add a new note
                    if(docID == null){
                      firestoreService.addNote(textController.text);
                    }

                    // update an existing note
                    else{
                      firestoreService.updateNote(docID, textController.text);
                    }

                    // clear the text controller
                    textController.clear();
                    // close the box
                    Navigator.pop(context);
                  },
                  child: Text("新增"))
            ]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("備忘錄")),
        floatingActionButton: FloatingActionButton(
          onPressed: openNoteBox,
          child: const Icon(Icons.add),
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: firestoreService.getNotesStream(),
            // if we have data, get all the docs
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List notesList = snapshot.data!.docs;

                // display as a list
                return ListView.builder(
                  itemCount: notesList.length,
                  itemBuilder: (context, index) {
                    // get each individual doc
                    DocumentSnapshot document = notesList[index];
                    String docID = document.id;

                    // get note from each doc
                    Map<String, dynamic> data =
                        document.data() as Map<String, dynamic>;
                    String noteText = data['note'];

                    // display as a list tile
                    return ListTile(
                      title: Text(noteText),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                        // update button
                        IconButton(
                          onPressed: () => openNoteBox(docID: docID),
                          icon: const Icon(Icons.edit),
                        ),
                        // delete button
                        IconButton(
                          onPressed: () => FirestoreService().deleteNote(docID),
                          icon: const Icon(Icons.delete),
                        ),
                      ],)
                    );
                  },
                );
              }

              // if there is no data return nothing
              else {
                return const Text("目前沒有備忘錄內容..");
              }
            }));
  }
}
