import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:pet_4_ever/data/model/pet.dart';
import 'package:pet_4_ever/data/model/user_model.dart';

class FriendsRepository {
  final firestore = FirebaseFirestore.instance;

  Future<List<Pet>?> getFilteredPetsByAddress(String userAddress) async {
    try {
      final userCollectionRef =
          firestore.collection('user').where('address', isEqualTo: userAddress);
      final userResult = await userCollectionRef.get();
      final userDocs = userResult.docs;

      final userIds = userDocs.map(
        (doc) {
          return doc.id;
        },
      ).toList();

      final petCollectionRef = firestore
          .collection('pet')
          .where('visibility', isEqualTo: true)
          .where('owner_id', whereIn: userIds);
      final result = await petCollectionRef.get();
      final docs = result.docs;

      final pets = docs.map((doc) {
        final map = doc.data();
        final newMap = {
          'id': doc.id,
          ...map,
        };
        return Pet.fromJson(newMap);
      }).toList();

      return pets;
      // final collectionRef = firestore.collection('pet');
      // final result = await collectionRef.get();
      // final docs = result.docs;

      // if (docs.isEmpty) {
      //   print('Firestore에 데이터가 없음.');
      //   return [];
      // }

      // final filteredPets = <Pet>[];

      // for (final doc in docs) {
      //   final petData = doc.data();
      //   final ownerId = petData['owner_id'] as String;
      //   if (ownerId != null) {
      //     final userDoc = await firestore.collection('user').doc(ownerId).get();
      //     if (userDoc.exists) {
      //       final user =
      //           UserModel.fromJson({'id': userDoc.id, ...userDoc.data()!});
      //       if (user.address == userAddress) {
      //         final pet = Pet.fromJson({'id': doc.id, ...petData});
      //         filteredPets.add(pet);
      //       }
      //     }
      //   }
      // }
      // return filteredPets;

      // final pets = docs.map((doc) {
      //   final map = doc.data();
      //   final newMap = {'id': doc.id, ...map};
      //   return Pet.fromJson(newMap);
      // }).toList();
      // return pets;
    } catch (e) {
      print('getFilteredPetsByAddress에러: $e');
      return [];
    }
  }

  // CRUD
  // create
  Future<bool> insert({
    required String name,
    required String imageUrl,
    required String species,
    required String gender,
    required int age,
    required String size,
    required String special_notes,
  }) async {
    try {
      final firestore = FirebaseFirestore.instance;
      final collectionRef = firestore.collection('pet');
      final docRef = collectionRef.doc(); // 빈 값 -> id 자동 생성

      await docRef.set({
        'name': name,
        'imageUrl': imageUrl,
        'species': species,
        'gender': gender,
        'age': age,
        'size': size,
        'special_notes': special_notes
      });
      return true;
    } catch (e) {
      print('쓰기 에러: $e');
      return false;
    }
  }

  // load and insert
  Future<bool> loadAndInsert(String jsonPath) async {
    try {
      final String jsonString = await rootBundle.loadString(jsonPath);
      final List<dynamic> pets = json.decode(jsonString);
      final batch = FirebaseFirestore.instance.batch();
      final collectionRef = FirebaseFirestore.instance.collection('pet');
      for (var pet in pets) {
        final docRef = collectionRef.doc();
        batch.set(docRef, pet);
      }
      await batch.commit();
      print('한번에 잘 insert 했소.');
      return true;
    } catch (e) {
      print('한번에Insert에러: $e');
      return false;
    }
  }

  // read
  Future<Pet?> getOne(String id) async {
    try {
      final firestore = FirebaseFirestore.instance;
      final collectionRef = firestore.collection('pet');
      final docRef = collectionRef.doc(id);
      final doc = await docRef.get();
      return Pet.fromJson({
        'id': doc.id,
        ...doc.data()!,
      });
    } catch (e) {
      print('읽기 에러: $e');
    }
  }

  // update
  Future<bool> update({
    required String id,
    required String name,
    required String imageUrl,
    required String species,
    required String gender,
    required int age,
    required String size,
    required String special_notes,
  }) async {
    try {
      final firestore = FirebaseFirestore.instance;
      final collectionRef = firestore.collection('pet');
      final docRef = collectionRef.doc(id);
      await docRef.update({
        'name': name,
        'imageUrl': imageUrl,
        'species': species,
        'gender': gender,
        'age': age,
        'size': size,
        'special_notes': special_notes
      });
      return true;
    } catch (e) {
      print('업데이트 에러: $e');
      return false;
    }
  }

  //delete
  Future<bool> delete(String id) async {
    try {
      final firestore = FirebaseFirestore.instance;
      final collectionRef = firestore.collection('pet');
      final docRef = collectionRef.doc(id);
      await docRef.delete();
      return true;
    } catch (e) {
      print('삭제 에러: $e');
      return false;
    }
  }
}
