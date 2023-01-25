import 'package:bmi_app_flutter/users/users_settings.dart';
import 'package:flutter/material.dart';


// Hm2

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  TextEditingController nameController = TextEditingController();
  String? _activeUser;
  List<String>? _userList;
  List<BmiEntry>? _bmiEntryList;

  @override
  void initState() {
    super.initState();
    _loadUsers();
    _loadBmiEntries();
    _loadActiveUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settingsUserTextActiveUser), // passe das Applocalizations an den Code



        backgroundColor: Colors.brown,
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.greenAccent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.settingsUserTextActiveUser,
                  ),
                  SizedBox(width: 20),
                  DropdownButton(
                    value: _activeUser,
                    items: _userList?.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    })?.toList(),
                    onChanged: (String? value) {
                      setState(() {
                        _saveActiveUser(value!);
                        _loadActiveUser();
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () => showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: Text(
                      AppLocalizations.of(context)!.settingsUserBtnAddUser,
                    ),
                    content: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: AppLocalizations.of(context)!.settingsUserTextInputName,
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: Text(
                          AppLocalizations.of(context)!.settingsUserBtnCancel,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          _saveUsers(nameController.text);
                          _saveActiveUser(nameController.text);
                          _loadUsers();
                          _loadBmiEntries();
                          _loadActiveUser();
                          Navigator.pop(context, 'OK');
                        },
                        child: Text(
                          AppLocalizations.of(context)!.settingsUserBtnOK,
                        ),
                      ),
                    ],
                  ),
                ),
                child: Text(
                  AppLocalizations.of(context)!.settingsUserBtnAddUser,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _saveUsers(String name) {
    _userList ??= <String>[];
    _userList!.add(name);
  }

  void _saveBmiEntries(BmiEntry entry) {
    _bmiEntryList ??= <BmiEntry>[];
    _bmiEntryList!.add(entry);
  }

  void _saveActiveUser(String name) {
    _activeUser = name;
  }

  void _loadUsers() {
    // Load user list from persistent storage
  }

  void _loadBmiEntries() {
    // Load BmiEntry list from persistent storage
  }

  void _loadActiveUser() {
    // Load active user from persistent storage
  }
}

class BmiEntry {
  final int id;
  final String user;
  final double value;
  final String date;

  const BmiEntry({
    required this.id,
    required this.user,
    required this.value,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user': user,
      'value': value,
      'date': date,
    };
  }

  @override
  String toString() {
    return 'BmiEntry{id: $id, user: $user, value: $value, date: $date}';
  }





}