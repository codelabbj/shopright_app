import 'package:flutter/material.dart';

class ImportLocationsWidget extends StatelessWidget {
  const ImportLocationsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      _card(context, 'Import available data', Column(children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.amber.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Colors.amber.withValues(alpha: 0.4)),
          ),
          child: Text(
              'Countries are excluded from the list as they\'re already in the system. To re-import any, delete them from the Countries and retry.',
              style: Theme.of(context).textTheme.displaySmall),
        ),
        const SizedBox(height: 12),
        Row(children: [
          Expanded(
            child: Container(
              height: 42,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: Theme.of(context).dividerColor),
              ),
              alignment: Alignment.centerLeft,
              child: Text('Choose country...', style: Theme.of(context).textTheme.displaySmall),
            ),
          ),
          const SizedBox(width: 10),
          ElevatedButton(onPressed: () {}, child: const Text('Import')),
        ]),
        const SizedBox(height: 8),
        Align(
          alignment: Alignment.centerLeft,
          child: Text('Location data is sourced from our GitHub repository.', style: Theme.of(context).textTheme.displaySmall),
        ),
      ])),
      const SizedBox(height: 16),
      _card(context, 'Import Locations', Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.blue.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Colors.blue.withValues(alpha: 0.25)),
          ),
          child: Text(
              'If you want to export Locations data, you can do it quickly by clicking on Export to CSV or Export to Excel.',
              style: Theme.of(context).textTheme.displaySmall),
        ),
        const SizedBox(height: 12),
        Container(
          height: 120,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Theme.of(context).dividerColor, style: BorderStyle.solid),
          ),
          alignment: Alignment.center,
          child: Text('Drag and drop file here or click to upload', style: Theme.of(context).textTheme.displaySmall),
        ),
        const SizedBox(height: 12),
        _input(context, 'Chunk size', '200'),
        const SizedBox(height: 12),
        Row(children: [
          Switch(value: true, onChanged: (_) {}),
          const SizedBox(width: 6),
          Text('Skip existing records', style: Theme.of(context).textTheme.labelSmall),
        ]),
        const SizedBox(height: 12),
        ElevatedButton(onPressed: () {}, child: const Text('Import')),
      ])),
      const SizedBox(height: 16),
      _card(context, 'Example', _exampleTable(context)),
      const SizedBox(height: 16),
      _card(context, 'Rules', _rulesTable(context)),
    ]);
  }

  Widget _card(BuildContext context, String title, Widget child) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: Theme.of(context).brightness == Brightness.light
            ? [BoxShadow(color: Colors.grey.withValues(alpha: 0.1), blurRadius: 8, offset: const Offset(0, 3))]
            : [],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title, style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        child,
      ]),
    );
  }

  Widget _input(BuildContext context, String label, String placeholder) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(label, style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
      const SizedBox(height: 6),
      Container(
        height: 42,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: Theme.of(context).dividerColor),
        ),
        alignment: Alignment.centerLeft,
        child: Text(placeholder, style: Theme.of(context).textTheme.displaySmall),
      ),
    ]);
  }

  Widget _exampleTable(BuildContext context) {
    final headers = ['Name', 'Slug', 'Import Type', 'Order', 'Abbreviation', 'Status', 'Country', 'State', 'Nationality', 'Name VI'];
    final rows = [
      ['United States of America', 'country', '0', '0', '', 'published', '', '', 'Americans', ''],
      ['Texas', 'state', '0', '0', 'TX', 'published', 'United States of America', '', '', 'Bang Texas'],
      ['Washington', 'state', '0', '0', 'WA', 'published', 'United States of America', '', '', 'Bang Washington'],
      ['Houston', 'houston', '0', '0', '', 'published', 'United States of America', 'Texas', '', 'Thành phố Houston'],
      ['San Antonio', 'san-antonio', '0', '0', '', 'published', 'United States of America', 'Texas', '', 'Thành phố San Antonio'],
    ];
    return _simpleTable(context, headers, rows);
  }

  Widget _rulesTable(BuildContext context) {
    final headers = ['Column', 'Rules'];
    final rows = [
      ['Name', 'The name of the location is mandatory and should not exceed 120 characters.'],
      ['Slug', 'The slug of the location, if provided, should not exceed 120 characters.'],
      ['Import Type', 'The type of import is mandatory and should be one of the predefined values.'],
      ['Order', 'The order of the location, if provided, should be a positive integer between 0 and 127.'],
      ['Abbreviation', 'The abbreviation of the location, if provided, should not exceed 10 characters.'],
      ['Status', 'Should be one of the predefined values.'],
      ['Country', 'Mandatory if the import type is state or city.'],
      ['State', 'Mandatory if the import type is city.'],
      ['Nationality', 'If provided, should not exceed 120 characters.'],
      ['Name VI', 'The name of the location is mandatory and should not exceed 120 characters.'],
    ];
    return _simpleTable(context, headers, rows);
  }

  Widget _simpleTable(BuildContext context, List<String> headers, List<List<String>> rows) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          color: Theme.of(context).brightness == Brightness.light ? const Color(0xFFF5F7FA) : null,
          child: Row(children: headers.map((h) => Expanded(child: Text(h, style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)))).toList()),
        ),
        ...rows.map((r) => Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: Theme.of(context).dividerColor, width: 0.5)),
              ),
              child: Row(children: r.map((c) => Expanded(child: Text(c, style: Theme.of(context).textTheme.displaySmall))).toList()),
            )),
      ]),
    );
  }
}


