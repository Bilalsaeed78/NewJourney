// import 'package:flutter/material.dart';

// class CustomSearchWidget extends StatefulWidget {
//   final TextEditingController? controller;
//   final String? Function(String?)? validator;
//   final void Function(String)? onFieldSubmit;

//   const CustomSearchWidget(
//       {Key? key, this.controller, this.validator, this.onFieldSubmit})
//       : super(key: key);

//   @override
//   _CustomSearchWidgetState createState() => _CustomSearchWidgetState();
// }

// class _CustomSearchWidgetState extends State<CustomSearchWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//         color: Colors.white,
//         border: Border.all(color: Colors.grey), // Add border color here
//       ),
//       child: TextFormField(
//         cursorColor: Colors.black,
//         controller: widget.controller,
//         onFieldSubmitted: widget.onFieldSubmit,
//         onChanged: widget.onFieldSubmit,
//         validator: widget.validator,
//         autovalidateMode: AutovalidateMode.onUserInteraction,
//         style: const TextStyle(color:  Colors.black,),
//         decoration: const InputDecoration(
//           prefixIcon: Icon(
//             Icons.search,
//             color:  Colors.black,
//           ),
//           hintText: 'Search for...',
//           hintStyle: TextStyle(color:  Colors.black,),
//           border: InputBorder.none,
//           contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class CustomSearchWidget extends StatefulWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmit;
  final void Function(String)? onSearch; // Callback function for search

  const CustomSearchWidget(
      {Key? key, this.controller, this.validator, this.onFieldSubmit, this.onSearch})
      : super(key: key);

  @override
  _CustomSearchWidgetState createState() => _CustomSearchWidgetState();
}

class _CustomSearchWidgetState extends State<CustomSearchWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: TextFormField(
        cursorColor: Colors.black,
        controller: widget.controller,
        onFieldSubmitted: (val) {
          widget.onFieldSubmit?.call(val);
        },
        onChanged: (val) {
          widget.onSearch?.call(val); // Call the search callback function
        },
        validator: widget.validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: const TextStyle(color:  Colors.black,),
        decoration: const InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color:  Colors.black,
          ),
          hintText: 'Search for...',
          hintStyle: TextStyle(color:  Colors.black,),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
    );
  }
}
