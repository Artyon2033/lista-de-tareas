import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  CollectionReference tasksReference =
      FirebaseFirestore.instance.collection('tasks');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firedbase Firestore"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                tasksReference.get().then((QuerySnapshot value) {
                  //QuerySnapshot collection = value;
                  //List<QueryDocumentSnapshot> docs = collection.docs;
                  //QueryDocumentSnapshot doc = docs[1];
                  //print(doc.id);
                  //print(doc.data());

                  QuerySnapshot collection = value;
                  collection.docs.forEach((QueryDocumentSnapshot element) {
                    Map<String, dynamic> myMap =
                        element.data() as Map<String, dynamic>;
                    print(myMap["title"]);
                  });
                });
              },
              child: Text("Obtener la data"),
            ),
            ElevatedButton(
              onPressed: () {
                tasksReference.add(
                  {
                    "title": "Ir de compras al super",
                    "description": "Debemos comprar comida para todo el mes",
                  },
                ).then((DocumentReference value) {
                  print(value.id);
                }).catchError((error) {
                  print("Ocurrio un error en el registro");
                }).whenComplete(() {
                  print("El regitro ha terminado");
                });
              },
              child: Text(
                "Agregar documento",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                tasksReference.doc("gvqKzAaj6zVU8TR7qh58").update(
                  {
                    "title": "Ir de paseo a la playa",
                  },
                ).catchError(
                  (error) {
                    print(error);
                  },
                ).whenComplete(
                  () {
                    print("Actualizacion terminada");
                  },
                );
              },
              child: Text(
                "Actualizar documento",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                tasksReference.doc("RrWpL6CUNfkcvumlbtZR").delete().catchError(
                  (error) {
                    print(error);
                  },
                ).whenComplete(() {
                  print("La eliminacion esta completa");
                });
              },
              child: Text("Eliminar documento"),
            ),
            ElevatedButton(
              onPressed: () {
                tasksReference.doc("A00002").set(
                  {
                    "Title": "Ir al concierto",
                    "description":
                        "Este fin de semana  debemos de ir al concierto",
                  },
                ).catchError((error) {
                  print(error);
                }).whenComplete(() {
                  print("Creacion completada");
                });
              },
              child: Text("Agregar documento personalizado"),
            ),
          ],
        ),
      ),
    );
  }
}
