import 'package:flutter/material.dart';

import '../../../../utils/context_extensions.dart';

class WatchDetailFooter extends StatelessWidget {
  const WatchDetailFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        InkWell(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.only(right: 15),
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: const Color.fromRGBO(230, 230, 230, 1),
              ),
            ),
            child: const Icon(
              Icons.favorite,
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.only(right: 15),
              height: 60,
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
              ),
              decoration: BoxDecoration(
                color: context.theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: const Color.fromRGBO(230, 230, 230, 1),
                ),
              ),
              child: const Center(
                child: Text(
                  'Add to Cart',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
