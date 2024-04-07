import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:totalx_machine_task/presentation/providers/cubit/employee_cubit.dart';

class SearchAndFilterWidget extends StatelessWidget {
  const SearchAndFilterWidget({
    super.key,
    required TextEditingController name,
  }) : _name = name;
  final TextEditingController _name;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          height: 32,
          width: MediaQuery.sizeOf(context).width - 200,
          child: TextField(
            onChanged: (value)async {
              await context.read<EmployeeCubit>().searchEmployees(value);
            },
            controller: _name,
            cursorHeight: 20,
            style: const TextStyle(
              fontSize: 13,
            ),
            decoration: InputDecoration(
              prefixIcon: const Icon(
                CupertinoIcons.search,
                size: 17,
              ),
              prefixIconConstraints: const BoxConstraints(
                maxWidth: 50,
                minWidth: 40,
              ),
              contentPadding: EdgeInsets.zero,
              hintText: 'search by name',
              hintStyle: TextStyle(
                fontSize: 13,
                fontFamily: GoogleFonts.montserrat().fontFamily,
                fontWeight: FontWeight.w400,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(
                  20,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  20,
                ),
              ),
            ),
          ),
        ),
        Container(
          width: 28,
          height: 30,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(Icons.filter_list),
        ),
      ],
    );
  }
}
