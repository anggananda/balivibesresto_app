import 'package:balivibesresto_app/dto/food.dart';
import 'package:balivibesresto_app/services/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({super.key});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();
  Future<List<Foods>>? foods;
  late String _title;
  bool isUpdate = false;
  late int? foodIdForUpdate;
  late DBHelper dbHelper;
  final _foodTitleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
    refreshFoodLists();
  }

  @override
  void dispose() {
    _foodTitleController.dispose();
    dbHelper.close();
    super.dispose();
  }

  void cancelTextEditing() {
    _foodTitleController.text = '';
    setState(() {
      isUpdate = false;
      foodIdForUpdate = null;
    });
    closeKeyboard();
  }

  void closeKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  Future<void> refreshFoodLists() async {
    try {
      await dbHelper.initDatabase();
      setState(() {
        foods = dbHelper.getFoods();
        isUpdate = false;
      });
    } catch (error) {
      debugPrint('Error fetching foods: $error');
    }
  }

  void createOrUpdateFoods() {
    _formStateKey.currentState?.save();
    if (!isUpdate) {
      dbHelper.add(Foods(null, _title));
    } else {
      dbHelper.update(Foods(foodIdForUpdate, _title));
    }
    _foodTitleController.text = '';
    refreshFoodLists();
  }

  void editFormFood(BuildContext context, Foods foods) {
    setState(() {
      isUpdate = true;
      foodIdForUpdate = foods.id!;
    });
    _foodTitleController.text = foods.title;
  }

  void deleteFood(BuildContext context, int foodID) {
    setState(() {
      isUpdate = false;
    });
    _foodTitleController.text = '';
    dbHelper.delete(foodID);
    refreshFoodLists();
  }

  @override
  Widget build(BuildContext context) {
    var textFormField = TextFormField(
      onSaved: (value) {
        _title = value!;
      },
      autofocus: false,
      controller: _foodTitleController,
      decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: !isUpdate ? Colors.purple : Colors.blue,
                  width: 2,
                  style: BorderStyle.solid)),
          labelText: !isUpdate ? 'Add Food Title' : 'Edit Food Title',
          icon:
              Icon(Icons.food_bank, color: !isUpdate ? Colors.purple : Colors.blue),
          fillColor: Colors.white,
          labelStyle:
              TextStyle(color: !isUpdate ? Colors.purple : Colors.blue)),
    );
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Form(
            key: _formStateKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: textFormField,
                ),
              ],
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
                onPressed: () {
                  createOrUpdateFoods();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: !isUpdate
                      ? Colors.purple
                      : Colors.blue, // Set background color
                  foregroundColor: Colors.white,
                ),
                child: !isUpdate ? const Text('Save') : const Text('Update')),
            const SizedBox(
              width: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  cancelTextEditing();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange, // Set background color
                  foregroundColor: Colors.white,
                ),
                child: const Text('Cancel')),
          ],
        ),
        const Divider(),
        Expanded(
            child: FutureBuilder(
          future: foods,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Text('No Data');
            }
            if (snapshot.hasData) {
              return generateList(snapshot.data!);
            }
            return const CircularProgressIndicator();
          },
        ))
      ],
    ));
  }

  Widget generateList(List<Foods> foods) {
    return ListView.builder(
      itemCount: foods.length,
      itemBuilder: (context, index) => Slidable(
        // Customize appearance and behavior as needed
        key: ValueKey(index),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              // An action can be bigger than the others.
              onPressed: (context) => editFormFood(context, foods[index]),
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label: 'Edit',
            ),
            SlidableAction(
              // An action can be bigger than the others.
              onPressed: (context) => deleteFood(context, foods[index].id!),
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ), // Assuming each book has a unique id
        child: ListTile(title: Text(foods[index].title)),
      ),
    );
  }
}