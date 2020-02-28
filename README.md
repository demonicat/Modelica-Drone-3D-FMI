[![DOI](https://zenodo.org/badge/176610570.svg)](https://zenodo.org/badge/latestdoi/176610570)

# Modelica-Drone-3D-FMI
A drone model with 3D visualization and FMU export configuration developed using Modelica by Hao Chang and Luigi Vanfretti.

![Alt text](/D_Pics/main.png "Drone Model")

# Contents
Drone Model with FMU Export Configuration and VR simulation.

## A. Modelica Model

All sub-systems and simulation cases are contained within the ``./DroneSimulation/package.mo`` package. Each model is saved individually as its own file. The [Claytex VySeMA](http://https://www.claytex.com/products/dymola/model-libraries/vesyma/ "Claytex VySeMA") and [Modelon](http://https://www.modelon.com/products-services/modelon-library-suite-modelica-libraries/ "Modelon") Libraries are required to run models with non-ideal power systems using batteries and certain DC motor configurations. The full version of the DLR Visualization library is required to run any of the models using VR in the ``DroneSimulation.Visualization.mo`` package.

How to simulate it?

1. Open ``./A_Modelica/DroneSimulation.mo``
2. The package structure is set up with the following sub-packages:
	- Examples
	- Blocks
	- Electrical
	- Mechanical
	- Sensors
	- Gyroscope
	- Visualization
	- Tests
3. Under the Examples/DroneWithIdealPowerSystem package, open the model ``DroneTest.mo`` and select it as ``Simulation model``. This has inputs that act as change in x, y, z coordinates of the drone and outputs x, y, z from the pseudo-GPS modeled within.
4. Go to simulation tab of your tool and change the simulation time to 10s then click simulate button.
5. This simulation should result with the z-coordinate approaching 5 meters, and the other coordinates (x,y) should be around zero. To verify, plot the variables ``.xgps``, ``.ygps`` and ``.zgps`` of the model by running the Modelica script ``drone_simulation_setup.mos``. You should obtain the result below.
![Alt text](/D_Pics/sim.png "Simulation Results")

6. Within Dymola, run the script ``drone_anymation_setup.mos``, and then click on the ``Play`` button to see the animation. The red arrows indicate the force of the propellers.

![Alt text](/D_Pics/anim.gif "Animation")

## B. FMU
### Using the distributed FMU
- Within ``./B_FMI/`` an FMU generated by Dymola 2019 FD01 (64-bit) with both ME and CS (using Cvode) options is included.
Note that this model requires a Dymola license to execute in your local machine to run.

### Generating the FMU under Dymola 2019 FD01 (64-bit)
It is possible to generate an FMU from the Modelica model to provide inputs to x, y and z coordinate changes.
Under the 'Test' sub-package, the ``controlModuleTest_fmu_inputs`` model can be used. To generate the FMU using Dymola 2019 FD01 (64-bit) under Windows 10, follow the next steps:

1. Open ``./A_Modelica/DroneSimulation/package.mo``
2. Set as ``Simulation model`` the model under ``DroneSimulation.Examples.DroneWithIdealPowerSystem.DroneTests_FMU``

	![Alt text](/D_Pics/fmiexport/02_setmodel.png "Set model")

3. Go to the ``Simulation Setup`` menu ``Simulation>Setup...`` and provide the following configurations in the different tabs shown below:

	![Alt text](/D_Pics/fmiexport/03_general.png "General Settings")

	![Alt text](/D_Pics/fmiexport/03_compiler.png "Compiler Settings")

4. Under the ``Simulation`` mode, go to the menu ``Simulation>Translate>FMU``, and provide the following settings on the ``Export FMU`` window:

![Alt text](/D_Pics/fmiexport/04_fmuconfig.png "Export FMU Settings")


Alternatively, issue the following command under the ``Commands`` window of Dymola:

``translateModelFMU("DroneSimulation.Tests.controlModuleTest_fmu_inputs", false, "", "2", "all", false, 1);
 = "DroneSimulation_Tests_controlModuleTest_0fmu_0inputs"``

## C. Running the in Simulink using FMIKIT
- Install the [FMIKit](https://github.com/CATIA-Systems/FMIKit-Simulink).

- Under the folder ``./C_SimulinkWithFMIKit`` a Simulink model ``./drone_model.slx`` set-up using FMIKit to reproduce the simulation scenario explained above.

- Note that you might need to reload the FMU using the one in the directory ``./B_FMI/`` as explained above.

- You should obtain the results shown below.
![Alt text](/D_Pics/simulinkfmikit.png "Model running in Simulink using the FMIKIT")

## D. Model Visualization
1. Open the models for visualization under ``DroneSimulation.Examples.Visualization.ModuleTest_SimVis`` and select it as ``Simulation model``.
2.  Go to simulation tab of your tool and change the simulation time to 100s then click simulate button.
3. A window for the DLR SimVis application will open with the drone flying in a desert terrain. The drone can be controlled by the keyboard by default, but it can be reconfigured to control the drone with a joystick. 

## Contributing
- Via pull requests.

## Copyright
(c) Meaghan Podlaski, Hao Chang and Luigi Vanfretti, Rensselaer Polytechnic Institute, Troy, NY.

Licensed under the BSD 3-Clause License.
