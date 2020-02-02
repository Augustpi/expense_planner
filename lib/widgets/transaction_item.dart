import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.transactions,
    @required this.mediaQuery,
    @required this.deleteTransaction,
    @required this.index,
  }) : super(key: key);

  final List<Transaction> transactions;
  final MediaQueryData mediaQuery;
  final Function deleteTransaction;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FittedBox(
              child: Text('\$${transactions[index].amount}'),
            ),
          ),
        ),
        title: Text(
          transactions[index].title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(
            transactions[index].date,
          ),
        ),
        trailing: mediaQuery.size.width > 460
            ? FlatButton.icon(
                onPressed: () => deleteTransaction(transactions[index].id),
                icon: Icon(Icons.delete),
                textColor: Theme.of(context).errorColor,
                label: Text('Delete'),
              )
            : IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => deleteTransaction(transactions[index].id),
              ),
      ),
    );
  }
}
