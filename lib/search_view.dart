import 'package:flutter/material.dart';

class SearchView extends StatefulWidget {
  const SearchView(
      {Key? key, this.enableSearchOnTextChange = true, required this.onSearch})
      : super(key: key);

  final bool enableSearchOnTextChange;
  final Function(String) onSearch;
  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(7, 0, 0, 0),
          child: TextField(
            focusNode: _focusNode,
            autofocus: true,
            controller: _controller,
            onSubmitted: widget.onSearch,
            onChanged: widget.enableSearchOnTextChange ? widget.onSearch : null,
            decoration: InputDecoration(
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
                  _focusNode.requestFocus();
                },
                icon: const Icon(
                  Icons.clear_outlined,
                ),
              ),
            ),
          ),
        )),
      ],
    );
  }
}
