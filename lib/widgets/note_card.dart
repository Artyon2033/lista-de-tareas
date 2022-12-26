import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tasks/style/app_style.dart';

Widget noteCard(Function()? onTap, QueryDocumentSnapshot doc) {
  return InkWell(
      onTap: onTap,
      child:

      //Aqui es donde se pone la decoracion para que se vea en la pagina principal
          Container(
            padding: EdgeInsets.all(8.0),
             margin: EdgeInsets.all(8.0),
             decoration: BoxDecoration(
              color: AppStyle.cardsColor[doc['color_id'] ],
              borderRadius: BorderRadius.circular(8.0),
             ),
             child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(doc["Titulo_Nota"],
                style: AppStyle.mainTitle,
                ),
                SizedBox(height: 4.0,), 
                
                SizedBox(height: 4.0,), 
                Text(doc["Contenido de la Nota"],
                style: AppStyle.mainContent,
                overflow: TextOverflow.ellipsis,
                ),
              ],
             ),
             )
             );
}
