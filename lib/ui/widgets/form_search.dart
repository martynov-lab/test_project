import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business/bloc/search_bloc_bloc.dart';

class FormSearch extends StatelessWidget {
  const FormSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController mycontroller = TextEditingController();
    final SearchBlocBloc searchBloc = BlocProvider.of<SearchBlocBloc>(context);
    return Row(children: <Widget>[
      Expanded(
        child: Form(
          key: _formKey,
          child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty)
                return 'Введите наименование проекта';
              return null;
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
            searchBloc.add(SearchProject(mycontroller.text));
          }
        },
        icon: Icon(Icons.search),
      ),
    ]);
  }
}
