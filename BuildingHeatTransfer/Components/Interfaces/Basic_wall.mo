within BuildingHeatTransfer.Components.Interfaces;

model Basic_wall
  extends Modelica.Thermal.HeatTransfer.Interfaces.Element1D;
  parameter Modelica.SIunits.Length thickness "Thickness of interface";
  parameter Modelica.SIunits.ThermalConductivity lambda "Thermal conductivity of material";
  parameter Modelica.SIunits.Area surface "Surface of interface";
equation
  Q_flow = (lambda*surface/thickness)*dT;
  annotation (
    Icon(coordinateSystem(initialScale = 0.1), graphics={Rectangle(fillColor = {192, 192, 192}, pattern = LinePattern.None, fillPattern = FillPattern.Backward, extent = {{-90, 70}, {90, -70}}), Line(points = {{-90, 70}, {-90, -70}}, thickness = 0.5), Line(points = {{90, 70}, {90, -70}}, thickness = 0.5), Text(origin = {0, -10}, lineColor = {0, 0, 255}, extent = {{-150, 115}, {150, 75}}, textString = "%name"), Text(origin = {1, 0}, lineColor = {255, 255, 255}, extent = {{-59, 8}, {59, -8}}, textString = "Lambda = %lambda"), Text(origin = {5, 22}, lineColor = {255, 255, 255}, extent = {{-59, 8}, {59, -8}}, textString = "Thickness = %thickness"), Text(origin = {1, -22}, lineColor = {255, 255, 255}, extent = {{-59, 8}, {59, -8}}, textString = "Surface = %surface")}),
    Diagram(coordinateSystem(initialScale = 0.1), graphics={Line(points = {{-80, 0}, {80, 0}}, color = {255, 0, 0}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled})}));  
end Basic_wall;