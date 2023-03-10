import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app_complete/blocs/workout_cubit.dart';

class EditWorkoutScreen extends StatelessWidget {
  const EditWorkoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => BlocProvider.of<WorkoutCubit>(context).goHome(),
        ),
      ),

      /// TODO: Will add listView.builder here
      body: const Center(child: Text('Body')),
      // body: ListView.builder(
      //   shrinkWrap: true,
      //   itemCount: workoutEditing.workout!.exercises!.length,
      //   itemBuilder: (context, index){
      //     Exercise exercise = workoutEditing.workout!.exercises![index];
      //     if(workoutEditing.exIndex == index){
      //       return EditExerciseScreen(workout: workoutEditing.workout, index: workoutEditing.index, exIndex: workoutEditing.exIndex);
      //     } else {
      //       return ListTile(
      //         leading: Text(formatTime(exercise.prelude!, true)),
      //         title: Text(exercise.title!),
      //         trailing: Text(formatTime(exercise.duration!, true)),
      //         onTap: ()=> BlocProvider.of<WorkoutCubit>(context)
      //             .editExercise(index),
      //       );
      //     }
      //   },
      // )
    );
  }
}
