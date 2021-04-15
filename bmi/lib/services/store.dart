import 'package:bmi/Constants.dart';
import 'package:bmi/models/Workout.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class store {
  final Firestore _firestore =Firestore.instance;

  addWorkout(Workout workout){
  _firestore.collection(kWorkoutCollection).add({
      kWorkoutName:workout.wName,
      kWorkoutSetsNumber:workout.wSetsNum,
      kWorkoutDay:workout.wDay,
      kWorkoutPlan:workout.wPlan,
      kWorkoutGif:workout.wGif,
  });
  }

  Stream<QuerySnapshot> loadWorkouts (){

    return _firestore.collection(kWorkoutCollection).snapshots();
  }
  deleteWorkout(documentId){

    _firestore.collection(kWorkoutCollection).document(documentId).delete();
  }
  editWorkout(data,documentId){
    _firestore.collection(kWorkoutCollection).document(documentId).updateData(data);
  }
}