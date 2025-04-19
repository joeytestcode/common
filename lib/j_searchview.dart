import 'package:flutter/material.dart';

class JSearchView extends StatefulWidget {
  const JSearchView(
      {super.key,
      this.enableSearchOnTextChange = true,
      required this.onSearch});

  final bool enableSearchOnTextChange;
  final Function(String) onSearch;
  @override
  State<JSearchView> createState() => _JSearchViewState();
}

class _JSearchViewState extends State<JSearchView> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(7, 0, 0, 0),
          child: TextField(
            autofocus: true,
            controller: _controller,
            onSubmitted: widget.onSearch,
            onChanged: widget.enableSearchOnTextChange ? widget.onSearch : null,
            decoration: InputDecoration(
              fillColor: Colors.blueGrey.shade50,
              filled: true,
              prefixIcon: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  widget.onSearch(_controller.text);
                },
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  _controller.text = '';
                  widget.onSearch('');
                },
                icon: const Icon(
                  Icons.clear_outlined,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        )),
      ],
    );
  }
}
