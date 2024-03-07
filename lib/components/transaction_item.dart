import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class TransactionItem extends StatelessWidget {
  const TransactionItem({
    super.key,
    required this.tr,
    required this.onRemove,
  });

  final Transaction tr;
  final void Function(String p1) onRemove;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: FittedBox(
                child: Text('R\$${tr.value.toStringAsFixed(2)}'),
              ),
            ),
          ),
          title: Text(
            tr.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          subtitle: Text(
            DateFormat('d MMM y').format(tr.date),
          ),
          trailing: MediaQuery.of(context).size.width > 400
              ? ElevatedButton.icon(
                  onPressed: () => onRemove(tr.id),
                  icon: Icon(
                    Icons.delete,
                    color: Theme.of(context).colorScheme.error,
                  ),
                  style: ButtonStyle(),
                  label: Text(
                    "Excluir",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                )
              : IconButton(
                  onPressed: () => onRemove(tr.id),
                  icon: Icon(Icons.delete),
                  color: Theme.of(context).colorScheme.error,
                )),
    );
  }
}