import 'package:flutter/material.dart';
import 'package:totalx_machine_task/constants.dart';

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
        leading: CircleAvatar(
          child: Image.network(
            '${firebaseStorageBaseUrl}1712416504571.png?alt=media&token=de5b40ed-d079-467e-a496-2d5535959322',
            fit: BoxFit.cover,
          ),
        ),
        title: const Text('Jesbin Jose'),
        subtitle: const Text('Age 32'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }
}
