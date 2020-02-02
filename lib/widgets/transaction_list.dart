import 'package:flutter/material.dart';

import './transaction_item.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final Function deleteTransaction;
  final List<Transaction> transactions;

  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (BuildContext context, constraints) {
              return Column(
                children: <Widget>[
                  Text('No transactions added yet!',
                      style: Theme.of(context).textTheme.headline6),
                  SizedBox(height: 20),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset('lib/assets/images/waiting.png',
                        fit: BoxFit.cover),
                  ),
                ],
              );
            },
          )
        : ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return TransactionItem(
                transactions: transactions[index],
                mediaQuery: mediaQuery,
                deleteTransaction: deleteTransaction,
              );
            },
            itemCount: transactions.length,
          );
  }
}
