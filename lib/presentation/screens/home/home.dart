import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:totalx_machine_task/presentation/providers/cubit/employee_cubit.dart';
import 'package:totalx_machine_task/presentation/screens/home/widgets/custom_employee_list.dart';
import 'package:totalx_machine_task/presentation/screens/home/widgets/search_and_filter.dart';
import 'package:totalx_machine_task/presentation/screens/home/widgets/show_loaction_title.dart';
import 'package:totalx_machine_task/presentation/widgets/add_employee_dialoge.dart';
import 'package:totalx_machine_task/presentation/widgets/const_space.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final TextEditingController _name = TextEditingController();
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
                            SearchAndFilterWidget(name: _name),
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
                    return CustomEmployeeList(
                      state: state,
                      name: _name,
                    );
                  },
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AddEmployeeDialog(),
              );
            },
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
