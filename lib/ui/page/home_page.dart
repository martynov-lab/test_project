import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business/bloc/search_bloc_bloc.dart';
import '../../utils/validator.dart';
import 'list_project.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController mycontroller = TextEditingController();
    SearchBlocBloc searchBloc = BlocProvider.of<SearchBlocBloc>(context);
    int selectedLimit = 10;
    int page = 1;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              searchBloc.add(SearchProject(
                query: mycontroller.text,
                page: page <= 1 ? 1 : --page,
                limit: selectedLimit,
              ));
            },
            icon: const Icon(Icons.chevron_left),
          ),
          IconButton(
            onPressed: () {
              searchBloc.add(SearchProject(
                query: mycontroller.text,
                page: ++page,
                limit: selectedLimit,
              ));
            },
            icon: const Icon(Icons.chevron_right),
          ),
          PopupMenuButton(
              color: Colors.grey[200],
              elevation: 40,
              onSelected: (value) {
                selectedLimit = value as int;
              },
              itemBuilder: (context) => [
                    const PopupMenuItem(
                      child: Text("10"),
                      value: 10,
                    ),
                    const PopupMenuItem(
                      child: Text("25"),
                      value: 25,
                    ),
                    const PopupMenuItem(
                      child: Text("50"),
                      value: 50,
                    ),
                  ]),
        ],
        title: const Text('Github Project'),
        //centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(children: <Widget>[
              Expanded(
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    validator: (value) {
                      Validator.validateQuery(query: value.toString());
                      return null;
                      // if (value == null || value.isEmpty) {
                      //   return 'Введите наименование проекта';
                      // }
                      // return null;
                    },
                    controller: mycontroller,
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    decoration: const InputDecoration(
                      hintStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                      hintText: 'Введите запрос',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        borderSide: BorderSide(color: Colors.grey, width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                      ),
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    searchBloc.add(SearchProject(
                      query: mycontroller.text,
                      page: page,
                      limit: selectedLimit,
                    ));
                    FocusScope.of(context).requestFocus(
                        FocusNode()); //скрывает клавиатуру после нажатия
                  }
                },
                icon: const Icon(Icons.search),
              ),
            ]),
            //const FormSearch(),
            const Expanded(child: ListProject()),
          ],
        ),
      ),
    );
  }
}
