within BuildingHeatTransfer.Components.Sources;

model Basic_source
  constant Real sigma(final unit = "W/(m2.K4)") = 5.670367e-8 "Stefan-Boltzmann constant";
  parameter Modelica.SIunits.EnergyFlowRate Phi(displayUnit = "W") "Energy flow delivered to source";
  parameter Modelica.SIunits.Area S(displayUnit = "m²") "Ground surface of room";
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a port_a annotation(
    Placement(visible = true, transformation(origin = {-26, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {56, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  port_a.T = (Phi / (sigma * S)) ^ (1 / 4);
protected
  annotation(
    Diagram(coordinateSystem(initialScale = 0.1)),
    Icon(graphics = {Rectangle(origin = {-34, 26}, fillColor = {255, 170, 127}, fillPattern = FillPattern.Vertical, extent = {{-26, 34}, {80, -80}}), Text(origin = {-5, 80}, extent = {{-57, 14}, {57, -14}}, textString = "%name"), Text(origin = {-21, -62}, lineColor = {170, 0, 0}, extent = {{-21, 6}, {49, -14}}, textString = "Phi=%Phi"), Text(origin = {-21, -80}, lineColor = {170, 0, 0}, extent = {{-21, 6}, {49, -14}}, textString = "Surface=%S")}, coordinateSystem(initialScale = 0.1)));
end Basic_source;