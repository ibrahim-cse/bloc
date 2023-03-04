import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app_complete/blocs/workout_cubit.dart';
import 'package:flutter_bloc_app_complete/blocs/workouts_cubit.dart';
import 'package:flutter_bloc_app_complete/helpers.dart';
import 'package:flutter_bloc_app_complete/models/workout.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workout Time!'),
        actions: const [
          IconButton(onPressed: null, icon: Icon(Icons.event_available)),
          IconButton(onPressed: null, icon: Icon(Icons.settings)),
        ],
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<WorkoutsCubit, List<Workout>>(
            builder: (context, workouts) => ExpansionPanelList.radio(
                  children: workouts
                      .map((workout) => ExpansionPanelRadio(
                            value: workout,
                            headerBuilder: (BuildContext context, bool isExpanded) => ListTile(
                              visualDensity: const VisualDensity(horizontal: 0, vertical: VisualDensity.maximumDensity),
                              title: Text(workout.title!),
                              leading: IconButton(
                                onPressed: BlocProvider.of<WorkoutCubit>(context).editWorkout(workout, workouts.indexOf(workout)),
                                icon: const Icon(Icons.edit),
                              ),
                              trailing: Text(formatTime(workout.getTotal(), true)),
                            ),
                            body: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: workout.exercises.length,
                              itemBuilder: (BuildContext context, int index) => ListTile(
                                visualDensity: const VisualDensity(horizontal: 0, vertical: VisualDensity.maximumDensity),
                                title: Text(workout.exercises[index].title!),
                                leading: Text(formatTime(workout.exercises[index].prelude!, true)),
                                trailing: Text(formatTime(workout.exercises[index].duration!, true)),
                                onTap: null,
                              ),
                            ),
                          ))
                      .toList(),
                )),
      ),
    );
  }
}
