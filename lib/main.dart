import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app_bloc/ToDoAppUsingBloc/controllers/task_bloc.dart';

void main() {
  runApp(BlocProvider(create: (context) => TaskBloc(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ToDoHomePage(),
    );
  }
}

class ToDoHomePage extends StatefulWidget {
  const ToDoHomePage({super.key});

  @override
  State<ToDoHomePage> createState() => _ToDoHomePageState();
}

class _ToDoHomePageState extends State<ToDoHomePage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('To-Do App'),
      ),
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: const InputDecoration(
                          hintText: 'Add a new task',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        if (_controller.text.isEmpty) return;
                        /*   
                        ===========  cubit way ============
                         context.read<TaskCubit>().addTask(_controller.text);
                        
                         */

                        //===========  Bloc way ============
                        context.read<TaskBloc>().add(
                          AddTaskEvent(_controller.text),
                        );
                        _controller.clear();
                      },
                      child: const Icon(Icons.add),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                Expanded(
                  child: ListView.builder(
                    itemCount: state.tasksList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(state.tasksList[index].title),
                        leading: Checkbox(
                          value: state.tasksList[index].isCompleted,
                          onChanged: (value) {
                            /* 
                              ===========  cubit way ============
                              context.read<TaskCubit>().toggleTask(
                                state.tasksList[index].id,
                              ); */

                            //===========  Bloc way ============
                            context.read<TaskBloc>().add(
                              ToggleTaskEvent(state.tasksList[index].id),
                            );
                          },
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            context.read<TaskBloc>().add(
                              RemoveTaskEvent(state.tasksList[index].id),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
