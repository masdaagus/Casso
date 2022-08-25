import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../../../utils/constant.dart';

class ProductOrderItem extends StatelessWidget {
  const ProductOrderItem({
    Key? key,
    this.tittle,
    this.prices,
    this.count = 0,
    this.addCount,
    this.minCount,
    required this.removeOrder,
  }) : super(key: key);

  final String? tittle;
  final int? count;
  final double? prices;
  final VoidCallback? addCount;
  final VoidCallback? minCount;
  final VoidCallback removeOrder;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(0),
      endActionPane: ActionPane(
        extentRatio: .4,
        motion: const ScrollMotion(),
        // dismissible: DismissiblePane(onDismissed: removeOrder),
        children: [
          Expanded(
            child: GestureDetector(
              onTap: removeOrder,
              child: Container(
                height: double.infinity,
                color: merah,
                child: Icon(
                  Icons.delete_outline,
                  color: darkColor,
                  size: 32,
                ),
              ),
            ),
          )
        ],
      ),
      startActionPane: ActionPane(
        extentRatio: .4,
        motion: const ScrollMotion(),
        children: [
          Expanded(
            child: Container(
              height: double.infinity,
              color: putih,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: minCount,
                    child: Icon(
                      Icons.remove,
                      color: darkColor,
                      size: 32,
                    ),
                  ),
                  Text(
                    "$count",
                    style: TextStyle(
                      color: darkColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  GestureDetector(
                    onTap: addCount,
                    child: Icon(
                      Icons.add,
                      color: darkColor,
                      size: 32,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  tittle ?? '',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(width: 4),
                (count! > 1)
                    ? Text(
                        'x ${count}',
                        style: TextStyle(
                          color: darkColor.withOpacity(.6),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
            Text(
              'RM ${prices ?? 0}',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
