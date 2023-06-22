import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/ui/components/settings_component.dart';
import 'package:todo_app/ui/settings_provider/sett_provider.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  List<String> languageList = ['Arabic', 'English'];

  List<String> modeList = ['light', 'dark'];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var myProvider = Provider.of<SettingsProvider>(context);
    return Container(
      color: myProvider.isDark()
          ? const Color(0xff060E1E)
          : const Color(0xffDFECDB),
      child: Column(
        children: [
          SizedBox(
            height: height * 0.07,
          ),
          SettingsComponent(
            outerTitile: 'Language',
            dropDownList: languageList,
          ),
          SizedBox(
            height: height * 0.04,
          ),
          SettingsComponent(outerTitile: 'Mode', dropDownList: modeList),
        ],
      ),
    );
  }
}
// Widget languageTap(BuildContext context){
//
//
//   return Container(
//     color: Colors.black,
//     child: Text("test_1",style: TextStyle(fontSize: 20,color: Colors.red),),
//   );
// }
// Widget modeTap(BuildContext context){
//
//
//   return Container(
//     color: Colors.black,
//     child: Text("test_2",style: TextStyle(fontSize: 20,color: Colors.red),),
//   );
// }
