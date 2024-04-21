import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VotingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Votaciones'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('bands').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text('No hay bandas disponibles'),
            );
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data() as Map<String, dynamic>;
              return ListTile(
                title: Text(data['name']),
                subtitle: Text('Álbum: ${data['album']} - Año: ${data['year']} - Votos: ${data['votes']}'),
                onTap: () {
                  FirebaseFirestore.instance.runTransaction((transaction) async {
                    DocumentSnapshot freshSnapshot = await transaction.get(document.reference);
                    transaction.update(freshSnapshot.reference, {'votes': freshSnapshot['votes'] + 1});
                  });
                },
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
