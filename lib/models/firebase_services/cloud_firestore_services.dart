import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mela_skin/constants/extensions.dart';

class CloudFirestoreServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Create Function.
  Future<int> create(String collection, {String? docId, required Map<String, dynamic> data}) async {
    try {
      if (docId == null) {
        await _firestore.collection(collection).add(data);
      } else {
        await _firestore.collection(collection).doc(docId).set(data);
      }
      return 1;
    } catch (error) {
      error.toString().showToast;
      return -1;
    }
  }

  /// Read by Condition Function.
  Future<List<Map<String, dynamic>>?> readByCondation(String collection, {required String fieldName, required dynamic fieldValue}) async {
    try {
      QuerySnapshot<Map<String, dynamic>> documents = await _firestore.collection(collection).where(fieldName, isEqualTo: fieldValue).get();
      List<Map<String, dynamic>> data = documents.docs.map((element) => element.data()).toList();
      return data;
    } catch (error) {
      error.toString().showToast;
      return null;
    }
  }

  /// Read Specific Document Function.
  Future<Map<String, dynamic>?> readSpecificDocument(String collection, String docId) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> document = await _firestore.collection(collection).doc(docId).get();
      if (document.exists) {
        return document.data();
      }
      return null;
    } catch (error) {
      error.toString().showToast;
      return null;
    }
  }

  /// Update Function.
  Future<int> update(String collection, {required String docId, required Map<String, dynamic> data}) async {
    try {
      _firestore.collection(collection).doc(docId).update(data);
      return 1;
    } catch (error) {
      error.toString().showToast;
      return -1;
    }
  }

  /// Delete Function.
  Future<int> delete(String collection, {required String docId}) async {
    try {
      _firestore.collection(collection).doc(docId).delete();
      return 1;
    } catch (error) {
      error.toString().showToast;
      return -1;
    }
  }
}
