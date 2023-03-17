import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app_complete/blocs/workout_cubit.dart';
import 'package:flutter_bloc_app_complete/states/workout_states.dart';

class EditWorkoutScreen extends StatelessWidget {
  const EditWorkoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: BlocBuilder<WorkoutCubit, WorkoutState>(
        builder: (context, state) {
          WorkoutEditing we = state as WorkoutEditing;
          return Scaffold(
            appBar: AppBar(
              leading: BackButton(
                onPressed: () => BlocProvider.of<WorkoutCubit>(context).goHome(),
              ),
            ),
            body: ListView.builder(
              itemCount: we.workout!.exercises.length,
              itemBuilder: (context, index) {
                return const ListTile(
                  leading: Text('Edit workout data need to be implemented'),
                );
              },
            ),
          );
        },
      ),
      onWillPop: () => BlocProvider.of<WorkoutCubit>(context).goHome(),
    );
  }
}
