import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/ui/settings_provider/sett_provider.dart';

class SettingsComponent extends StatefulWidget {
  String outerTitile;

  List<String> dropDownList;

  SettingsComponent({required this.outerTitile, required this.dropDownList});

  @override
  State<SettingsComponent> createState() => _SettingsComponentState();
}

class _SettingsComponentState extends State<SettingsComponent> {
  @override
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var myProvider = Provider.of<SettingsProvider>(context);
    String dropDownValue = widget.dropDownList.first;
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: width * 0.07,
            ),
            Text(
              widget.outerTitile,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
        SizedBox(
          height: height * 0.03,
        ),
        Container(
          width: width * 0.9,
          padding: EdgeInsets.symmetric(
              vertical: height * 0.02, horizontal: width * 0.05),
          decoration: BoxDecoration(
              color: myProvider.isDark() ? Color(0xff060E1E) : Colors.white,
              border: Border.all(color: Colors.blueAccent, width: 1.2)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                dropDownValue,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.w500),
              ),
              DropdownButton(
                items: widget.dropDownList.map((choice) {
                  return DropdownMenuItem(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList(),
                onChanged: (String? choice) {
                  dropDownValue = choice!;
                  setState(() {
                    if (choice == 'light') {
                      myProvider.changeMode(ThemeMode.light);
                    } else if (choice == 'dark') {
                      myProvider.changeMode(ThemeMode.dark);
                    }
                  });
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
