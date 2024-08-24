import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mindful_momentum/models/tasks_model.dart';
import 'package:uuid/uuid.dart';

class Firestore_Datasource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final User? user = FirebaseAuth.instance.currentUser;

  Future<bool> AddTask(String subtitle, String title, int image, int tasktime) async {
    try {
      var uuid = Uuid().v4();
      DateTime data = new DateTime.now();
      String dateString = data.toString().split(' ')[0];
      await _firestore
          .collection('tasks')
          .doc(_auth.currentUser!.uid)
          .collection('notes')
          .doc(uuid)
          .set({
        'id': uuid,
        'subtitle': subtitle,
        'isDon': false,
        'image': image,
        'time': '${dateString}',
        'taskTime':tasktime,
        'title': title,
      });
      return true;
    } catch (e) {
      print(e);
      return true;
    }
  }
  Future<bool> AddTaskFirebase(String subtitle, String title, int image, int tasktime) async {
    try {
      var uuid = Uuid().v4();
      DateTime data = new DateTime.now();
      await _firestore
          .collection('notecount${user?.uid}')
          .doc(uuid)
          .set({
        'id': uuid,
        'subtitle': subtitle,
        'isDon': false,
        'image': image,
        'time': '${data.hour}:${data.minute}',
        'taskTime':tasktime,
        'title': title,
      });
      return true;
    } catch (e) {
      print(e);
      return true;
    }
  }

  List getNotes(AsyncSnapshot snapshot) {
    try {
      final notesList = snapshot.data!.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return Tasks(
          data['id'],
          data['subtitle'],
          data['time'],
          data['image'],
          data['title'],
          data['isDon'],
          data['taskTime']
        );
      }).toList();
      return notesList;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Stream<QuerySnapshot> stream(bool isDone) {
    return _firestore
        .collection('tasks')
        .doc(_auth.currentUser!.uid)
        .collection('notes')
        .where('isDon', isEqualTo: isDone)
        .snapshots();
  }

  Future<bool> isdone(String uuid, bool isDon) async {
    try {
      await _firestore
          .collection('tasks')
          .doc(_auth.currentUser!.uid)
          .collection('notes')
          .doc(uuid)
          .update({'isDon': isDon});
      return true;
    } catch (e) {
      print(e);
      return true;
    }
  }

  Future<int> UpdateTime(String uuid, int updateTime) async {
    try {
      await _firestore
          .collection('tasks')
          .doc(_auth.currentUser!.uid)
          .collection('notes')
          .doc(uuid)
          .update({'taskTime': updateTime});
      print('Time Updated');
      return 0;
    } catch (e) {
      print(e);
      return 0;
    }
  }

  Future<bool> Update_Note(
      String uuid, int image, String title, String subtitle) async {
    try {
      DateTime data = new DateTime.now();
      await _firestore
          .collection('tasks')
          .doc(_auth.currentUser!.uid)
          .collection('notes')
          .doc(uuid)
          .update({
        'time': '${data.hour}:${data.minute}',
        'subtitle': subtitle,
        'title': title,
        'image': image,
      });
      return true;
    } catch (e) {
      print(e);
      return true;
    }
  }

  Future<bool> delet_note(String uuid) async {
    try {
      await _firestore
          .collection('tasks')
          .doc(_auth.currentUser!.uid)
          .collection('notes')
          .doc(uuid)
          .delete();
      return true;
    } catch (e) {
      print(e);
      return true;
    }
  }
}
