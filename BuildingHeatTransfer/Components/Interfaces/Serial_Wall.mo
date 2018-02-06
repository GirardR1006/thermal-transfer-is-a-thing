within BuildingHeatTransfer.Components.Interfaces;

model Serial_Wall
  extends Modelica.Thermal.HeatTransfer.Interfaces.Element1D;
  parameter Integer numberOfLayers=1; 
  parameter Modelica.SIunits.Length[numberOfLayers] thicknesses "Thicknesses of interfaces";
  parameter Modelica.SIunits.ThermalConductivity[numberOfLayers] lambdas "Thermal conductivities of materials";
  parameter Modelica.SIunits.Area[numberOfLayers]  surfaces"Surfaces of interfaces";
  Real R_tot(unit="K/W")"Equivalent thermal resistance";
algorithm
  R_tot:=0;
  for i in 1:size(thicknesses,1) loop
    R_tot := R_tot + 1/(lambdas[i]*surfaces[i]/thicknesses[i]);
  end for;
  Q_flow := dT/R_tot;
  annotation (
    Icon(coordinateSystem(initialScale = 0.1), graphics={Rectangle(fillColor = {192, 192, 192}, pattern = LinePattern.None, fillPattern = FillPattern.Backward, extent = {{-90, 70}, {90, -70}}), Line(points = {{-90, 70}, {-90, -70}}, thickness = 0.5), Line(points = {{90, 70}, {90, -70}}, thickness = 0.5), Text(origin = {0, -10}, lineColor = {0, 0, 255}, extent = {{-150, 115}, {150, 75}}, textString = "%name"), Text(origin = {1, 0}, lineColor = {255, 255, 255}, extent = {{-59, 8}, {59, -8}}, textString = "Lambda = %lambda"), Text(origin = {5, 22}, lineColor = {255, 255, 255}, extent = {{-59, 8}, {59, -8}}, textString = "Thickness = %thickness"), Text(origin = {1, -22}, lineColor = {255, 255, 255}, extent = {{-59, 8}, {59, -8}}, textString = "Surface = %surface")}),
    Diagram(coordinateSystem(initialScale = 0.1), graphics={Line(points = {{-80, 0}, {80, 0}}, color = {255, 0, 0}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled})}));  
end Serial_Wall;