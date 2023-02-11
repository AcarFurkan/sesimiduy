import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:sesimiduy/product/init/language/locale_keys.g.dart';
import 'package:sesimiduy/product/items/colors_custom.dart';
import 'package:sesimiduy/product/model/poi_category.dart';
import 'package:sesimiduy/product/utility/firebase/collection_enums.dart';

class FilterDropDown extends StatefulWidget {
  const FilterDropDown({super.key});

  @override
  State<FilterDropDown> createState() => _FilterDropDownState();
}

class _FilterDropDownState extends State<FilterDropDown> {
  PoiCategory? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: CollectionEnums.poiCategory.collection
          .withConverter<PoiCategory>(
            fromFirestore: (snapshot, options) =>
                PoiCategory.fromFirestore(snapshot),
            toFirestore: (value, options) {
              return value.toJson();
            },
          )
          .get(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const SizedBox();
        }
        final items = snapshot.data?.docs.map((e) => e.data()).toList() ?? [];

        return DropdownButtonHideUnderline(
          child: DropdownButton<PoiCategory>(
            dropdownColor: ColorsCustom.sambacus,
            isDense: true,
            alignment: Alignment.centerRight,
            hint: Text(
              LocaleKeys.category.tr(),
              style: context.textTheme.bodySmall?.copyWith(
                color: ColorsCustom.white,
              ),
            ),
            items: items
                .map(
                  (e) => DropdownMenuItem<PoiCategory>(
                    value: e,
                    onTap: () {},
                    child: _DropdownTitle(e.name),
                  ),
                )
                .toList(),
            onChanged: (value) {
              setState(() {
                if (value != null) _selectedItem = value;
              });
            },
            value: _selectedItem,
          ),
        );
      },
    );
  }
}

class _DropdownTitle extends StatelessWidget {
  const _DropdownTitle(this.name);

  final String? name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        name ?? '',
        maxLines: 4,
        overflow: TextOverflow.ellipsis,
        style: context.textTheme.bodySmall?.copyWith(
          color: ColorsCustom.white,
        ),
      ),
    );
  }
}
