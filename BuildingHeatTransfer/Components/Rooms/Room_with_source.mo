within BuildingHeatTransfer.Components.Rooms;

model Room_with_source
    parameter Modelica.SIunits.Temperature T_int(displayUnit = "degC") "Initial temperature of room";
    parameter Modelica.SIunits.EnergyFlowRate SourcePower(displayUnit = "W") "Source heat flow";
    parameter Modelica.SIunits.Area Surface "Surface of Room";
    parameter Modelica.SIunits.Height Height "Height of Room";
    constant Real c_air(unit="J/(m3.K)") = 1.127e3 "Air heat capacity";
    Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacityOfRoom(C = Height*Surface*c_air, T(displayUnit = "K", fixed = true, start = T_int)) annotation(
      Placement(visible = true, transformation(origin = {42, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a thermal_port annotation(
      Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor innerRoomTemperatureSensor annotation(
      Placement(visible = true, transformation(origin = {-68, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BuildingHeatTransfer.Components.Sources.Basic_source basic_source(Q_dot = SourcePower)  annotation(
    Placement(visible = true, transformation(origin = {24, -8}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
equation
  connect(basic_source.port_a, thermal_port) annotation(
    Line(points = {{18, -8}, {-4, -8}, {-4, 2}, {-98, 2}, {-98, 0}, {-100, 0}}, color = {191, 0, 0}));
  connect(heatCapacityOfRoom.port, thermal_port) annotation(
    Line(points = {{42, 24}, {-96, 24}, {-96, 0}, {-100, 0}}, color = {191, 0, 0}));
  connect(innerRoomTemperatureSensor.port, thermal_port) annotation(
    Line(points = {{-78, -20}, {-100, -20}, {-100, 0}, {-100, 0}}, color = {191, 0, 0}));
  annotation(
      Icon(graphics = {Rectangle(fillColor = {235, 235, 235}, fillPattern = FillPattern.Solid, borderPattern = BorderPattern.Engraved, extent = {{-100, 100}, {100, -100}}, radius = 4), Text(origin = {-44, -18}, lineColor = {0, 0, 255}, extent = {{106, -12}, {-4, 10}}, textString = "T_int = %T_int"), Text(origin = {-84, 82}, extent = {{152, -34}, {-4, 10}}, textString = "%name"), Text(origin = {-48, -52}, lineColor = {0, 0, 255}, extent = {{106, -12}, {-4, 10}}, textString = "Ground surface = %Surface"), Text(origin = {-48, -72}, lineColor = {0, 0, 255}, extent = {{106, -12}, {-4, 10}}, textString = "Height = %Height"), Text(origin = {-28, -70}, lineColor = {0, 0, 255}, extent = {{116, -30}, {-52, -4}}, textString = "Power of source = %SourcePower")}, coordinateSystem(initialScale = 0.1)));
end Room_with_source;