import 'package:bookly_clean_arch/Features/home/presentation/views/widgets/similerBooks_listView_item_loading.dart';
import 'package:flutter/material.dart';

class SimilerBooksListViewLoading extends StatelessWidget {
  const SimilerBooksListViewLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .15,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: SimilerBooksListViewItemLaoding(),
          );
        },
      ),
    );
  }
}
