import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class ChartsTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ddd')),
      body: Container(
        height: 400,
        child: OrdinalInitialViewport.withSampleData(),
      ),
    );
  }
}

class OrdinalInitialViewport extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;
  static List<charts.TickSpec<String>> staticTicks = new List();
  OrdinalInitialViewport(this.seriesList, {this.animate});

  /// Creates a [BarChart] with sample data and no transition.
  factory OrdinalInitialViewport.withSampleData() {
    return new OrdinalInitialViewport(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final ticks = new charts.StaticOrdinalTickProviderSpec(staticTicks);
    return new charts.BarChart(
      seriesList,
      animate: animate,
      // Set the initial viewport by providing a new AxisSpec with the
      // desired viewport: a starting domain and the data size.
      domainAxis: new charts.OrdinalAxisSpec(
          viewport: new charts.OrdinalViewport('2018', 4),
          // scaleSpec: charts.SimpleOrdinalScaleSpec(),
          // tickProviderSpec: ticks,
          renderSpec: new charts.SmallTickRendererSpec(
              labelStyle: charts.TextStyleSpec(
                  lineHeight: 1, color: charts.Color.black),
              labelOffsetFromAxisPx: 10,
              minimumPaddingBetweenLabelsPx: 2,
              axisLineStyle:
                  charts.LineStyleSpec(dashPattern: [1, 2], thickness: 1))),
      // flipVerticalAxis: true,

      // Optionally add a pan or pan and zoom behavior.
      // If pan/zoom is not added, the viewport specified remains the viewport.
      behaviors: [
        new charts.PanAndZoomBehavior(),
        new charts.ChartTitle('title',
            titleDirection: charts.ChartTitleDirection.vertical)
      ],
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final data = [
      new OrdinalSales('2014', 5),
      new OrdinalSales('2015', 25),
      new OrdinalSales('2016', 100),
      new OrdinalSales('2017', 75),
      new OrdinalSales('2018', 33),
      new OrdinalSales('2019', 80),
      new OrdinalSales('2020', 21),
      new OrdinalSales('2021', 77),
      new OrdinalSales('2022', 8),
      new OrdinalSales('2023', 12),
      new OrdinalSales('2024', 42),
      new OrdinalSales('2025', 70),
      new OrdinalSales('2026', 77),
      new OrdinalSales('2027', 55),
      new OrdinalSales('2028', 19),
      new OrdinalSales('2029', 66),
      new OrdinalSales('2030', 27),
    ];
    staticTicks.add(new charts.TickSpec("2020", label: "2018"));
    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
