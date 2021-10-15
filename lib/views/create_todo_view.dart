import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/ultilities/ultils.dart';

class CreateTodoView extends StatefulWidget {
  const CreateTodoView({Key? key}) : super(key: key);

  @override
  State<CreateTodoView> createState() => _CreateTodoViewState();
}

class _CreateTodoViewState extends State<CreateTodoView> {
  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _descController = TextEditingController();

  final TextEditingController _dateController = TextEditingController();

  final TextEditingController _timeController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create new Task"),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _titleController,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value!.isEmpty) {
                  return "please enter title";
                }
              },
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                  labelText: "Title",
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  hintText: "please enter title",
                  labelStyle: Theme.of(context).textTheme.bodyText1),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: _descController,
              keyboardType: TextInputType.multiline,
              textCapitalization: TextCapitalization.sentences,
              validator: (value) {
                if (value!.isEmpty) {
                  return "please enter description";
                }
              },
              decoration: InputDecoration(
                  labelText: "Description",
                  hintText: "enter description here",
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelStyle: Theme.of(context).textTheme.bodyText1),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(const Duration(days: 365)),
                      ).then((value) {
                        setState(() {
                          _dateController.text =
                              DateFormat.yMMMd().format(value!);
                        });
                      });
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "please select date";
                      }
                    },
                    controller: _dateController,
                    keyboardType: TextInputType.multiline,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration(
                        labelText: "Date",
                        hintText: "select date",
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelStyle: Theme.of(context).textTheme.bodyText1),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: TextFormField(
                    onTap: () {
                      showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      ).then((value) =>
                          _timeController.text = value!.format(context));
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "please select time";
                      }
                    },
                    controller: _timeController,
                    keyboardType: TextInputType.multiline,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration(
                        labelText: "Time",
                        hintText: "Select time",
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelStyle: Theme.of(context).textTheme.bodyText1),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: customBlue,
                  padding: const EdgeInsets.all(15)),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  print(_titleController.text);
                  print(_descController.text);
                  print(_dateController.text);
                  print(_timeController.text);
                } else {
                  print("please enter data");
                }
              },
              child: const Text(
                "Create Todo",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
