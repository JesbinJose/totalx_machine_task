import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:totalx_machine_task/data/models/age_enum.dart';
import 'package:totalx_machine_task/presentation/cubit/employee_cubit.dart';
import 'package:totalx_machine_task/presentation/widgets/const_space.dart';

class SearchAndFilterWidget extends StatelessWidget {
  SearchAndFilterWidget({
    super.key,
    required TextEditingController name,
  }) : _name = name;
  final TextEditingController _name;
  final ValueNotifier<Selection> _age = ValueNotifier(Selection.all);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          height: 32,
          width: MediaQuery.sizeOf(context).width - 200,
          child: TextField(
            onChanged: (value) async {
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
        InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => MyBottomSheet(selected: _age),
            ).then((value) {
              context.read<EmployeeCubit>().searchEmployeesbyAge(_age.value);
            });
          },
          child: Container(
            width: 28,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.filter_list),
          ),
        ),
      ],
    );
  }
}

class MyBottomSheet extends StatelessWidget {
  final ValueNotifier<Selection> selected;

  const MyBottomSheet({super.key, required this.selected});

  @override
  Widget build(BuildContext context) {
    const Map<Selection, String> map = {
      Selection.all: "All",
      Selection.elder: "Age: Elder",
      Selection.younger: "Age: Younger",
    };
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sort',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          ValueListenableBuilder(
            valueListenable: selected,
            builder: (context, value, child) {
              return Column(
                children: [
                  k20Height,
                  for (Selection i in Selection.values)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () => selected.value = i,
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: i == selected.value ? 5 : 1,
                                  color: i == selected.value
                                      ? const Color(0xFF2873F0)
                                      : const Color(0xFF333333),
                                ),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          k20Width,
                          Text(
                            map[i]!,
                            style: TextStyle(
                              fontFamily: GoogleFonts.montserrat().fontFamily,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  k30Height,
                  k30Height,
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
