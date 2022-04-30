import 'package:flutter/material.dart';

class SearchBox extends StatefulWidget {
  final TextEditingController? controller;
  const SearchBox({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: "Enter search topic...",
        hintStyle: const TextStyle(
          color: Colors.black45,
          fontSize: 18,
          fontStyle: FontStyle.italic,
        ),
        suffixIcon: IconButton(
          onPressed: widget.controller?.clear,
          icon: const Icon(Icons.clear),
        ),
        border: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 3,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            )),
      ),
    );
  }
}
