within BuildingHeatTransfer.Components.Rooms;

model Room_with_source
    parameter Modelica.SIunits.Temperature T_int(displayUnit = "degC") "Initial temperature of room";
    parameter Modelica.SIunits.Area Surface(displayUnit = "m^2") "Ground surface of room";
    parameter Modelica.SIunits.EnergyFlowRate Consumption(displayUnit = "W") "Consumption of source";
    Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacityOfRoom(C = 500, T(displayUnit = "K", fixed = true, start = T_int)) annotation(
      Placement(visible = true, transformation(origin = {42, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a thermal_port annotation(
      Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor innerRoomTemperatureSensor annotation(
      Placement(visible = true, transformation(origin = {-68, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    DAEProject.Components.Sources.Basic_source radiator(Phi = Consumption, S(displayUnit = "m2") = Surface) annotation(
      Placement(visible = true, transformation(origin = {62, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Thermal.HeatTransfer.Components.BodyRadiation radiatorGrid(Gr = 1) annotation(
      Placement(visible = true, transformation(origin = {36, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(radiatorGrid.port_a, thermal_port) annotation(
      Line(points = {{26, -16}, {-40, -16}, {-40, 2}, {-100, 2}, {-100, 0}}, color = {191, 0, 0}));
    connect(radiator.port_a, radiatorGrid.port_b) annotation(
      Line(points = {{56, -18}, {46, -18}, {46, -16}, {46, -16}}, color = {191, 0, 0}));
    connect(heatCapacityOfRoom.port, thermal_port) annotation(
      Line(points = {{42, 24}, {-96, 24}, {-96, 0}, {-100, 0}}, color = {191, 0, 0}));
    connect(innerRoomTemperatureSensor.port, thermal_port) annotation(
      Line(points = {{-78, -20}, {-100, -20}, {-100, 0}, {-100, 0}}, color = {191, 0, 0}));
    annotation(
      Icon(graphics = {Rectangle(fillColor = {235, 235, 235}, fillPattern = FillPattern.Solid, borderPattern = BorderPattern.Engraved, extent = {{-100, 100}, {100, -100}}, radius = 4), Text(origin = {-66, 38}, extent = {{144, -42}, {-4, 10}}, textString = "Room"), Text(origin = {-44, -18}, lineColor = {0, 0, 255}, extent = {{106, -12}, {-4, 10}}, textString = "T_int = %T_int"), Text(origin = {-44, -44}, lineColor = {0, 0, 255}, extent = {{110, -16}, {-4, 10}}, textString = "Surface = %Surface"), Text(origin = {-54, 72}, extent = {{106, -10}, {-4, 10}}, textString = "%name"), Text(origin = {-46, -62}, lineColor = {0, 0, 255}, extent = {{116, -30}, {-4, 10}}, textString = "Consumption = %Consumption")}, coordinateSystem(initialScale = 0.1)));
end Room_with_source;