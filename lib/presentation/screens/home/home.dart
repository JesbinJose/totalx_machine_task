import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:totalx_machine_task/presentation/providers/cubit/employee_cubit.dart';
import 'package:totalx_machine_task/presentation/screens/home/widgets/custom_list_tile.dart';
import 'package:totalx_machine_task/presentation/screens/home/widgets/search_and_filter.dart';
import 'package:totalx_machine_task/presentation/screens/home/widgets/show_loaction_title.dart';
import 'package:totalx_machine_task/presentation/widgets/const_space.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: const Color(0xFFEBEBEB),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xFFEBEBEB),
          appBar: AppBar(
            title: const ShowLoactionText(),
            elevation: 0,
          ),
          body: SizedBox(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  elevation: 0,
                  expandedHeight: 110,
                  flexibleSpace: FlexibleSpaceBar(
                    titlePadding: EdgeInsets.zero,
                    centerTitle: true,
                    background: const ColoredBox(
                      color: Color(0xFFEBEBEB),
                    ),
                    title: SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: SizedBox(
                        height: 120,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            k30Height,
                            k10Height,
                            const SearchAndFilterWidget(),
                            k10Height,
                            Text(
                              '  Users Lists',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            k10Height,
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                BlocBuilder<EmployeeCubit, EmployeeState>(
                  builder: (context, state) {
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => const CustomListTile(),
                        childCount: state.employees.length,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              ImagePicker().pickImage(source: ImageSource.camera).then(
                (value) async {
                  if (value != null) {
                    context.read<EmployeeCubit>().addEmployee(
                        await value.readAsBytes(), 'Jesbin Jose', 18);
                  }
                },
              );
            },
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
