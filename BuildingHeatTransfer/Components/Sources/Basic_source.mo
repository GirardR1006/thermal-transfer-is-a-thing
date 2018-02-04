within BuildingHeatTransfer.Components.Sources;

model Basic_source
  parameter Modelica.SIunits.EnergyFlowRate Q_dot(displayUnit = "W") "Energy flow delivered from source";
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a port_a annotation(
    Placement(visible = true, transformation(origin = {-26, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {56, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  port_a.Q_flow = -Q_dot;
  annotation(
    Diagram(coordinateSystem(initialScale = 0.1)),
    Icon(graphics = {Rectangle(origin = {-34, 26}, fillColor = {255, 170, 127}, fillPattern = FillPattern.Vertical, extent = {{-26, 34}, {80, -80}}), Text(origin = {-5, 80}, extent = {{-57, 14}, {57, -14}}, textString = "%name"), Text(origin = {-21, -62}, lineColor = {170, 0, 0}, extent = {{-21, 6}, {49, -14}}, textString = "Q_flow=%Q_dot")}, coordinateSystem(initialScale = 0.1)));
end Basic_source;