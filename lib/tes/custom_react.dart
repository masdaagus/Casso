import 'package:flutter/material.dart';

// GestureDetector(
//   onTap: () {
//     Navigator.of(context)
//         .push(HeroDialogRoute(builder: (context) {
//       return const _AddTodoPopupCard();
//     }));
//   },
//   child: Container(
//     padding: const EdgeInsets.all(24),
//     height: 80,
//     width: 80,
//     decoration: BoxDecoration(
//       color: biru,
//       borderRadius: BorderRadius.circular(40),
//     ),
//     child: Hero(
//       tag: _heroAddTodo,
//       child: Material(
//         color: biru,
//         // elevation: 2,
//         shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(32)),
//         child: Icon(
//           Icons.add_rounded,
//           size: 35,
//         ),
//       ),
//     ),
//   ),
// )
const String _heroAddTodo = 'add-todo-hero';

class _AddTodoPopupCard extends StatelessWidget {
  /// {@macro add_todo_popup_card}
  const _AddTodoPopupCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Hero(
          tag: _heroAddTodo,
          child: Material(
            color: Colors.blue,
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const TextField(
                      decoration: InputDecoration(
                        hintText: 'New todo',
                        border: InputBorder.none,
                      ),
                      cursorColor: Colors.white,
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 0.2,
                    ),
                    const TextField(
                      decoration: InputDecoration(
                        hintText: 'Write a note',
                        border: InputBorder.none,
                      ),
                      cursorColor: Colors.white,
                      maxLines: 6,
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 0.2,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
