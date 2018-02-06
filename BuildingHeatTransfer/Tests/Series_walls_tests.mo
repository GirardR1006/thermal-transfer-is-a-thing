within BuildingHeatTransfer.Tests;

model Series_walls_tests
    extends Modelica.Icons.Example;
    Modelica.Thermal.HeatTransfer.Components.HeatCapacitor outside(C = 1000000000000000000000000, T(start = 278.15)) annotation(
      Placement(visible = true, transformation(origin = {-72, -8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor outsideTemperatureSensor annotation(
      Placement(visible = true, transformation(origin = {-78, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BuildingHeatTransfer.Components.Rooms.Room_with_source heated_room(Height = 2,SourcePower = 180, Surface = 10, T_int (displayUnit = "degC") = 298.15)  annotation(
      Placement(visible = true, transformation(origin = {59, -7}, extent = {{-25, -25}, {25, 25}}, rotation = 0)));
    Components.Interfaces.Parallel_wall double_glass_window(lambdas = {1.2, 0.0263, 1.2}, numberOfLayers = 3, surfaces = {2, 2, 2}, thicknesses = {0.004, 0.016, 0.004})  annotation(
    Placement(visible = true, transformation(origin = {-12, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));  equation
  connect(double_glass_window.port_a, outside.port) annotation(
    Line(points = {{-22, -12}, {-42, -12}, {-42, -24}, {-72, -24}, {-72, -18}, {-72, -18}, {-72, -18}}, color = {191, 0, 0}));
  connect(heated_room.thermal_port, double_glass_window.port_b) annotation(
    Line(points = {{34, -6}, {8, -6}, {8, -12}, {-2, -12}, {-2, -12}}, color = {191, 0, 0}));
  connect(outside.port, outsideTemperatureSensor.port) annotation(
    Line(points = {{-72, -18}, {-72, -7}, {-88, -7}, {-88, 38}}, color = {191, 0, 0}));

end Series_walls_tests;