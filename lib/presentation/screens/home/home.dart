import 'package:flutter/material.dart';
import 'package:totalx_machine_task/presentation/screens/home/widgets/search_and_filter.dart';
import 'package:totalx_machine_task/presentation/screens/home/widgets/show_loaction_title.dart';
import 'package:totalx_machine_task/presentation/widgets/const_space.dart';

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
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => CustomListTile(),
                    childCount: 10,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2.0,
            blurRadius: 5.0,
          ),
        ],
      ),
      child: ListTile(
        title: const Text('Jesbin Jose'),
        subtitle: const Text('Age 32'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }
}
