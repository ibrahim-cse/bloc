import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app_complete/blocs/workout_cubit.dart';
import 'package:flutter_bloc_app_complete/blocs/workouts_cubit.dart';
import 'package:flutter_bloc_app_complete/screens/edit_workout_screen.dart';
import 'package:flutter_bloc_app_complete/screens/home_page.dart';
import 'package:flutter_bloc_app_complete/states/workout_states.dart';

void main() => runApp(const WorkoutTime());

class WorkoutTime extends StatelessWidget {
  const WorkoutTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Workouts',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(bodyText2: TextStyle(color: Color.fromARGB(255, 66, 74, 96))),
      ),
      debugShowCheckedModeBanner: false,
      home: /*BlocProvider<WorkoutsCubit>(
        create: (BuildContext context) {
          WorkoutsCubit workoutsCubit = WorkoutsCubit();

          if (workoutsCubit.state.isEmpty) {
            workoutsCubit.getWorkouts();
            print('...loading json since the state is empty');
          } else {
            print('...the state is not empty');
          }
          return workoutsCubit;
        },
        child: BlocBuilder<WorkoutsCubit, List<Workout>>(
          builder: (context, state) {
            return HomePage();
          },
        ),
      ),*/
          MultiBlocProvider(
        providers: [
          BlocProvider<WorkoutsCubit>(create: (BuildContext context) {
            WorkoutsCubit workoutsCubit = WorkoutsCubit();

            if (workoutsCubit.state.isEmpty) {
              workoutsCubit.getWorkouts();
              print('...loading json since the state is empty');
            } else {
              print('...the state is not empty');
            }
            return workoutsCubit;
          }),
          BlocProvider<WorkoutCubit>(
            create: (BuildContext context) => WorkoutCubit(),
          )
        ],
        child: BlocBuilder<WorkoutCubit, WorkoutState>(builder: (context, state) {
          if (state is WorkoutInitial) {
            return const HomePage();
          } else if (state is WorkoutEditing) {
            return EditWorkoutScreen();
          }
          return Container();
        }),
      ),
    );
  }
}
