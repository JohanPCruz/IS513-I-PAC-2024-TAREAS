import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VotingScreen extends StatelessWidget {
  const VotingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Votaciones'),
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
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text('No hay bandas disponibles'),
            );
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data() as Map<String, dynamic>;
              return ListTile(
                title: Text(data['name']),
                subtitle: Text('Álbum: ${data['album']} - Año: ${data['year']} - Votos: ${data['votes']}'),
                leading: data['imageUrl'] != null
                  ? CircleAvatar(
                      backgroundImage: NetworkImage(data['imageUrl']),
                    )
                  : const CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Icon(
                        Icons.music_note,
                        color: Colors.white,
                      ),
                    ),
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
