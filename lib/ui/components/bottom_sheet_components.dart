import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/ui/settings_provider/sett_provider.dart';

class BottomSheetComponents extends StatefulWidget {
  @override
  State<BottomSheetComponents> createState() => _BottomSheetComponentsState();
}

class _BottomSheetComponentsState extends State<BottomSheetComponents> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery
        .of(context)
        .size
        .height;
    double width = MediaQuery
        .of(context)
        .size
        .width;
    ThemeData theme = Theme.of(context);
    var myProvider = Provider.of<SettingsProvider>(context);

    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: height * 0.04,
          ),
          Text(
            'Add New Task',
            style: Theme
                .of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(
                color: myProvider.isDark() ? Colors.grey : Colors.black),
          ),
          SizedBox(
            height: height * 0.04,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.03),
            child: TextFormField(
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return " please enter task title";
                } else {
                  return null;
                }
              },
              maxLines: 1,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(
                    color: myProvider.isDark() ? Colors.white : Colors.grey)),
                label: Text(
                  'enter task title',
                  style:
                  theme.textTheme.bodyMedium!.copyWith(
                      color: myProvider.isDark() ? Colors.grey : Colors.black),
                ),

              ),
            ),
          ),
          SizedBox(
            height: height * 0.03,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.03),
            child: TextFormField(
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return " please enter task description";
                } else {
                  return null;
                }
              },
              maxLines: 1,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(
                    color: myProvider.isDark() ? Colors.white : Colors.grey)),
                label: Text(
                  'enter task Description',
                  style:
                  theme.textTheme.bodyMedium!.copyWith(
                      color: myProvider.isDark() ? Colors.grey : Colors.black),
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(left: width * 0.02),
            child: Text(
              'Select Date',
              style: theme.textTheme.bodyMedium!.copyWith(
                  color: myProvider.isDark() ? Colors.grey : Colors.black),
            ),
          ),
          InkWell(
            onTap: () {
              showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(Duration(days: 365)));
            },
            child: Text(
              '5/23/2023',
              style: theme.textTheme.bodySmall!.copyWith(fontSize: 18,
                  color: myProvider.isDark() ? Colors.grey : Colors.black),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  showDialog(
                    context: context,
                    builder: (context) =>
                        AlertDialog(
                          title: Text(
                            'sample hint',

                          ),
                          content: Text('sucssesfully adding',
                            style: theme.textTheme.bodyMedium?.copyWith(
                                color: myProvider.isDark()
                                    ? Colors.grey
                                    : Colors.black),
                          ),
                        ),
                  );
                }
              },
              child: Text(
                'Submeit New Task',
                style:
                theme.textTheme.bodyMedium!.copyWith(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
