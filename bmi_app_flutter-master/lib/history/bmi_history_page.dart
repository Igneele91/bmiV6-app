import 'package:bmi_app_flutter/database/sql_helper.dart';
import 'package:bmi_app_flutter/layout/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BmiHistoryPage extends StatefulWidget {
  const BmiHistoryPage({Key? key}) : super(key: key);

  @override
  State<BmiHistoryPage> createState() => _BmiHistoryPageState();
}

class _BmiHistoryPageState extends State<BmiHistoryPage> {
  bool _isLoading = true;
  List<Map<String, dynamic>> _bmi = [];

  void _loadAllBMI() async {
    final data = await SQLHelper.getBmi();
    setState(() {
      _bmi = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadAllBMI();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI History'),
      ),
      drawer: const CustomDrawer(),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(10),
              itemCount: _bmi.length,
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 70,
                  child: ListTile(
                    title: Text("Date: " +
                        DateFormat('dd.MM.yyyy - kk:mm')
                            .format(DateTime.parse(_bmi[index]['createdAt']))),
                    isThreeLine: true,
                    subtitle: Text("Height: " +
                        _bmi[index]['height'].toString() +
                        "\n" +
                        "Weight: " +
                        _bmi[index]['weight'].toString()),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            ),
    );
  }
}
