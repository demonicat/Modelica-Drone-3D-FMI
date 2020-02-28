within DroneSimulation.Examples.DroneWithoutIdealPower;
model controlModuleTest_fmu_main
  Modelica.Blocks.Sources.Ramp ramp(duration=5, height=5)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-70,0})));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{-66,18},{-46,38}})));
  Modelica.Blocks.Noise.UniformNoise uniformNoise(
    samplePeriod=0.1,
     y_min=-1,
     y_max=1)
    annotation (Placement(transformation(extent={{-80,-40},{-60,-20}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{-48,-18},{-38,-8}})));
   inner Modelica.Blocks.Noise.GlobalSeed globalSeed
     annotation (Placement(transformation(extent={{-36,-36},{-26,-26}})));
  DroneTest_FMU_Battery                     droneTest_FMU_Battery(          V=10)
    annotation (Placement(transformation(extent={{-18,-8},{40,48}})));
equation
  connect(ramp.y, add.u1) annotation (Line(points={{-59,0},{-54,0},{-54,-10},
          {-49,-10}}, color={0,0,127}));
  connect(add.u2, uniformNoise.y) annotation (Line(points={{-49,-16},{-49,
          -30},{-59,-30}}, color={0,0,127}));
  connect(droneTest_FMU_Battery.xcoord, const.y) annotation (Line(points={{-23.8,
          42.4},{-34.8,42.4},{-34.8,28},{-45,28}}, color={0,0,127}));
  connect(droneTest_FMU_Battery.ycoord, const.y) annotation (Line(points={{-23.8,
          20},{-34,20},{-34,28},{-45,28}}, color={0,0,127}));
  connect(droneTest_FMU_Battery.zcoord, add.u1) annotation (Line(points={{-23.8,
          -2.4},{-54,-2.4},{-54,-10},{-49,-10}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-80,
            -40},{40,60}})), Diagram(coordinateSystem(preserveAspectRatio=
            false, extent={{-80,-40},{40,60}})),
    experiment(StopTime=10, Tolerance=0.01));
end controlModuleTest_fmu_main;
