import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/landing/landing_bloc.dart';
import '../models/list_item.dart';
import 'colors.dart';
import 'constants.dart';
import 'strings.dart';
import 'styles.dart';

class HorizontalListViewSelector extends StatelessWidget {
  final double width;
  final bool isGridSelected;
  final List<ListItem> items;
  final Function(String) onSelect;

  const HorizontalListViewSelector({
    required this.width,
    required this.isGridSelected,
    required this.items,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 34.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            width: 80,
            height: 34,
            margin: const EdgeInsets.only(right: 12),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                  width: 40,
                  child: IconButton(
                    onPressed: () {
                      context.read<LandingBloc>().add(
                                      TabChangeEvent(
                                          tabIndex: 0,
                                          tabLabel: Strings.rNearMeMapList));
                    },
                    icon: Image.asset(
                      isGridSelected?gridSelectedIcon:gridIcon,
                      width: 35,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    context.read<LandingBloc>().add(TabChangeEvent(
                        tabIndex: 0, tabLabel: Strings.rNearMeList));
                  },
                  child: SizedBox(
                    width: 35,
                    height: 40,
                    child: IconButton(
                      onPressed: () {
                        context.read<LandingBloc>().add(TabChangeEvent(
                            tabIndex: 0, tabLabel: Strings.rNearMeList));
                      },
                      icon: Image.asset(
                        isGridSelected?listIcon:listSelectedIcon,
                        width: 24,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Add other items here based on the ListItem model
          ...items.map((item) {
            return Container(
              width: item.width,
              margin: const EdgeInsets.only(right: 16),
              child: TextButton.icon(
                style: item.isSelected
                    ? locationActiveElatedBtnStyle
                    : locationInActiveElatedBtnStyle,
                onPressed: () {
                  onSelect(
                      item.label); // Pass selected label back to parent widget
                },
                icon: Image.asset(
                  item.icon,
                  width: 12.0,
                  height: 12.0,
                  color:  item.isSelected ?AppColors.white:AppColors.black5,
                ),
                label: Text(
                  item.label,
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: item.isSelected ?FontWeight.w600:FontWeight.w400,
                    color: item.isSelected ? AppColors.white : AppColors.black5,
                  ),
                ),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
