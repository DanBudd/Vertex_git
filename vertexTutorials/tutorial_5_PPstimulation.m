%% VERTEX TUTORIAL 5
% In this tutorial we will create a model arranged into several cortical
% layers. The model represents a simplified neocortical circuit containing
% cortical layers 3, 4 and 5. Note that this tutorial may take some time to run
% as it implements a model containing more than 10,000 neurons.
%
%% Tissue parameters
% Our tissue parameters are similar to the previous tutorials:

TissueParams.X = 2200; %2000
TissueParams.Y = 400;
TissueParams.Z = 1240; %650
TissueParams.neuronDensity = 20000;
TissueParams.numStrips = 50;
TissueParams.tissueConductivity = 0.3;
TissueParams.maxZOverlap = [-1 , -1];

%%
% However, we need to set the number of layers to 3 and make sure we set
% the layer boundaries to create a 200 micron thick layer 3, a 300 micron
% thick layer 4 and a 150 micron thick layer 5:

TissueParams.numLayers = 3;
TissueParams.layerBoundaryArr = [1240, 450, 150, 0];

%%
% As the total Z-depth of the model is 650, we specify the top boundary of our
% layer three (the model's first layer) to be 650 microns, then the top of
% layer 4 to be 450 microns, and the top of layer 5 to be 150 microns.
%
%% Neuron group parameters
% Next we need to set up our neuron groups. Groups are allocated to a
% layer, and we will include pyramidal cells and basket interneurons in layer 3,
% spiny stellate cells and basket interneurons in layer 4, and pyramidal
% cells and basket interneurons in layer 5. We therefore need six neuron
% groups. We take the proportion of the total number of neurons that each
% group makes up (very) approximately from the data in Binzegger et al. 2004.
% Basket cells and spiny stellate cells share the same morphology, but have
% different firing dynamics (see Tomsett et al. 2014 for the firing responses of
% the cell models).

NeuronParams(1).somaLayer = 1; % Pyramidal cells in layer 3
NeuronParams(1).modelProportion = 0.4;
NeuronParams(1).neuronModel = 'adex';
NeuronParams(1).V_t = -50;
NeuronParams(1).delta_t = 2;
NeuronParams(1).a = 2.6;
NeuronParams(1).tau_w = 65;
NeuronParams(1).b = 220;
NeuronParams(1).v_reset = -60;
NeuronParams(1).v_cutoff = -45;
NeuronParams(1).numCompartments = 8;
NeuronParams(1).compartmentParentArr = [0, 1, 2, 2, 4, 1, 6, 6];
NeuronParams(1).compartmentLengthArr = [13 48 124 145 137 40 143 143];
NeuronParams(1).compartmentDiameterArr = ...
  [29.8, 3.75, 1.91, 2.81, 2.69, 2.62, 1.69, 1.69];
NeuronParams(1).compartmentXPositionMat = ...
[   0,    0;
    0,    0;
    0,  124;
    0,    0;
    0,    0;
    0,    0;
    0, -139;
    0,  139];
NeuronParams(1).compartmentYPositionMat = ...
[   0,    0;
    0,    0;
    0,    0;
    0,    0;
    0,    0;
    0,    0;
    0,    0;
    0,    0];
NeuronParams(1).compartmentZPositionMat = ...
[ -13,    0;
    0,   48;
   48,   48;
   48,  193;
  193,  330;
  -13,  -53;
  -53, -139;
  -53, -139];
NeuronParams(1).axisAligned = 'z';
NeuronParams(1).C = 1.0*2.96;
NeuronParams(1).R_M = 20000/2.96;
NeuronParams(1).R_A = 150;
NeuronParams(1).E_leak = -70;
NeuronParams(1).somaID = 1;
NeuronParams(1).basalID = [6, 7, 8];
NeuronParams(1).apicalID = [2 3 4 5];

NeuronParams(2).somaLayer = 1; % Basket cells in layer 3
NeuronParams(2).modelProportion = 0.1;
NeuronParams(2).axisAligned = '';
NeuronParams(2).neuronModel = 'adex';
NeuronParams(2).V_t = -50;
NeuronParams(2).delta_t = 2;
NeuronParams(2).a = 0.04;
NeuronParams(2).tau_w = 10;
NeuronParams(2).b = 40;
NeuronParams(2).v_reset = -65;
NeuronParams(2).v_cutoff = -45;
NeuronParams(2).numCompartments = 7;
NeuronParams(2).compartmentParentArr = [0 1 2 2 1 5 5];
NeuronParams(2).compartmentLengthArr = [10 56 151 151 56 151 151];
NeuronParams(2).compartmentDiameterArr = ...
  [24 1.93 1.95 1.95 1.93 1.95 1.95];
NeuronParams(2).compartmentXPositionMat = ...
[   0,    0;
    0,    0;
    0,  107;
    0, -107; 
    0,    0; 
    0, -107;
    0,  107];
NeuronParams(2).compartmentYPositionMat = ...
[   0,    0;
    0,    0;
    0,    0;
    0,    0;
    0,    0;
    0,    0;
    0,    0];
NeuronParams(2).compartmentZPositionMat = ...
[ -10,    0;
    0,   56;
   56,  163;
   56,  163; 
  -10,  -66;
  -66, -173;
  -66, -173];
NeuronParams(2).C = 1.0*2.93;
NeuronParams(2).R_M = 15000/2.93;
NeuronParams(2).R_A = 150;
NeuronParams(2).E_leak = -70;
NeuronParams(2).dendritesID = [2 3 4 5 6 7];


NeuronParams(3) = NeuronParams(2); % spiny stellates same morphology as basket
NeuronParams(3).somaLayer = 2;     % but in layer 4
NeuronParams(3).modelProportion = 0.3;
NeuronParams(3).V_t = -50;         % and different AdEx parameters
NeuronParams(3).delta_t = 2.2;
NeuronParams(3).a = 0.35;
NeuronParams(3).tau_w = 150;
NeuronParams(3).b = 40;
NeuronParams(3).v_reset = -70;
NeuronParams(3).v_cutoff = -45;

NeuronParams(4) = NeuronParams(2); % basket cells same in every layer
NeuronParams(4).somaLayer = 2;     % these are in layer 4
NeuronParams(4).modelProportion = 0.08;

NeuronParams(5).somaLayer = 3; % Pyramidal cells in layer 5
NeuronParams(5).modelProportion = 0.1;
NeuronParams(5).axisAligned = 'z';
NeuronParams(5).neuronModel = 'adex';
NeuronParams(5).V_t = -52;
NeuronParams(5).delta_t = 2;
NeuronParams(5).a = 10;
NeuronParams(5).tau_w = 75;
NeuronParams(5).b = 345;
NeuronParams(5).v_reset = -60;
NeuronParams(5).v_cutoff = -47;
NeuronParams(5).numCompartments = 9;
NeuronParams(5).compartmentParentArr = [0 1 2 2 4 5 1 7 7];
NeuronParams(5).compartmentLengthArr = [35 65 152 398 402 252 52 186 186];
NeuronParams(5).compartmentDiameterArr = ...
  [25 4.36 2.65 4.10 2.25 2.4 5.94 3.45 3.45];
NeuronParams(5).compartmentXPositionMat = ...
[   0,    0;
    0,    0;
    0,  152;
    0,    0; 
    0,    0;
    0,    0;
    0,    0;
    0, -193;
    0,  193];
NeuronParams(5).compartmentYPositionMat = ...
[   0,    0;
    0,    0;
    0,    0;
    0,    0;
    0,    0;
    0,    0;
    0,    0;
    0,    0;
    0,    0];
NeuronParams(5).compartmentZPositionMat = ...
[ -35,    0;
    0,   65;
   65,   65;
   65,  463;
  463,  865;
  865, 1117;
  -35,  -87;
  -87, -193;
  -87, -193];
NeuronParams(5).C = 1.0*2.95;
NeuronParams(5).R_M = 20000/2.95;
NeuronParams(5).R_A = 150;
NeuronParams(5).E_leak = -70;
NeuronParams(5).dendritesID = [2 3 4 5 6 7 8 9];

NeuronParams(6) = NeuronParams(2); % Basket cells in layer 5
NeuronParams(6).somaLayer = 3; 
NeuronParams(6).modelProportion = 0.02;

%%
% We will also need to provide the neurons with some input:

NeuronParams(1).Input(1).inputType = 'i_ou';
NeuronParams(1).Input(1).meanInput = 210;
NeuronParams(1).Input(1).stdInput = 80;
NeuronParams(1).Input(1).tau = 2;
NeuronParams(2).Input(1).inputType = 'i_ou';
NeuronParams(2).Input(1).meanInput = 200;
NeuronParams(2).Input(1).stdInput = 20;
NeuronParams(2).Input(1).tau = 1;
NeuronParams(3).Input(1).inputType = 'i_ou';
NeuronParams(3).Input(1).meanInput = 190;
NeuronParams(3).Input(1).stdInput = 60;
NeuronParams(3).Input(1).tau = 2;
NeuronParams(4).Input(1).inputType = 'i_ou';
NeuronParams(4).Input(1).meanInput = 200;
NeuronParams(4).Input(1).stdInput = 20;
NeuronParams(4).Input(1).tau = 1;
NeuronParams(5).Input(1).inputType = 'i_ou';
NeuronParams(5).Input(1).meanInput = 650;
NeuronParams(5).Input(1).stdInput = 160;
NeuronParams(5).Input(1).tau = 2;
NeuronParams(6).Input(1).inputType = 'i_ou';
NeuronParams(6).Input(1).meanInput = 200;
NeuronParams(6).Input(1).stdInput = 20;
NeuronParams(6).Input(1).tau = 1;

%% Connectivity
% Connectivity parameteres are specified as before, except that now we have
% several layers, the numbers can be specified per layer. Parameters that
% can specified on a per-layer basis are |axonArborRadius|,
% |axonArborLimit|, and |numConnectionsToAllFromOne|: 

ConnectionParams(1).axonArborRadius = [300, 200, 100];
ConnectionParams(1).axonArborLimit = [600, 400, 200];

%%
% The above code sets the axons arbor radius of the layer 3 pyramidal cells to
% 250 microns in layer 3, 200 microns in layer 4 and 100 microns in layer
% 5, as well as setting the axon arbor limit to 500, 400 and 200 microns in
% those layers, respectively. To set the number of connections between
% neuron groups in different layers, we use the same syntax:

ConnectionParams(1).numConnectionsToAllFromOne{1} = [600,    0,    0];
ConnectionParams(1).numConnectionsToAllFromOne{2} = [ 450,    0,    0];
ConnectionParams(1).numConnectionsToAllFromOne{3} = [   0,   50,    0];
ConnectionParams(1).numConnectionsToAllFromOne{4} = [   0,   20,    0];
ConnectionParams(1).numConnectionsToAllFromOne{5} = [  25,    0,  175];
ConnectionParams(1).numConnectionsToAllFromOne{6} = [   0,    0,   25];

%%
% Most neurons only reside in their soma layer, so many of the values are
% zero. However, layer 5 neurons are large and so span all three layers.
% Layer 3 pyramidal neurons can make connections with layer 5 pyramidal
% neurons in layer 3 and layer 5. VERTEX automatically calculates which
% compartments of each neuron type are in each layer.
%
% The other connection parameters are specified as before:
% i_exp_stdp gives us synapses with spike timing depedent plasticity. We
% also now are required to specify the preRate (maximum change in the
% synaptic weight when the presynaptic neuron fires) and postRate (maximum
% change in synaptic weight when post synaptic neuron fires), and the time
% constants for the decay in weight change occuring when pre or post
% synaptic neuron fires (tPre and tPost). We also specify a wmin and wmax
% to apply upper and lower boundaries on the weight.
ConnectionParams(1).synapseType = ...
  {'g_exp_mt', 'g_exp_mt', 'g_exp_mt', 'g_exp_mt', 'g_exp_mt', 'g_exp_mt'};
ConnectionParams(1).targetCompartments = ...
  {NeuronParams(1).dendritesID, NeuronParams(2).dendritesID, ...
   NeuronParams(3).dendritesID, NeuronParams(4).dendritesID, ...
   NeuronParams(5).dendritesID, NeuronParams(6).dendritesID};
ConnectionParams(1).weights = {0.3, 0.3, 0.3, 0.3, 0.3, 0.3};
ConnectionParams(1).tau = {5, 3, 5, 3, 5, 3};
ConnectionParams(1).tau_s = {5, 3, 5, 3, 5, 3};
ConnectionParams(1).fac_tau = {17, 20, 17, 20, 17, 20};
ConnectionParams(1).rec_tau = {62, 50, 62, 50, 62, 50};
ConnectionParams(1).U = {0.5, 0.4, 0.5, 0.4, 0.5, 0.4};
ConnectionParams(1).E_reversal = {-10, -10, -10, -10, -10, -10};

ConnectionParams(1).axonArborSpatialModel = 'gaussian';
ConnectionParams(1).sliceSynapses = true;
ConnectionParams(1).axonConductionSpeed = 0.3;
ConnectionParams(1).synapseReleaseDelay = 0.5;

%%
% And now we set the connectivity parameters for the other neuron groups:

ConnectionParams(2).axonArborRadius = [150, 0, 0];
ConnectionParams(2).axonArborLimit = [300, 0, 0];
ConnectionParams(2).numConnectionsToAllFromOne = ...
  {[3500, 0, 0], [200, 0, 0], [0, 20, 0], [0, 50, 0], [15, 0, 50], [0, 0, 10]};
ConnectionParams(2).synapseType = ...
  {'g_exp_mt', 'g_exp_mt', 'g_exp_mt', 'g_exp_mt', 'g_exp_mt', 'g_exp_mt'};
ConnectionParams(2).targetCompartments = ...
  {1, NeuronParams(2).dendritesID, ...
   1, NeuronParams(4).dendritesID, ...
   1, NeuronParams(6).dendritesID};
ConnectionParams(2).weights = {1.5, 0.3, 1.5, 0.3, 1.5, 0.3};
ConnectionParams(2).tau = {5, 8, 5, 8, 5, 8};
ConnectionParams(2).tau_s = {5, 8, 5, 8, 5, 8};
ConnectionParams(2).fac_tau = {35, 20, 35, 20, 35, 20};
ConnectionParams(2).rec_tau = {60, 70, 60, 70, 60, 70};
ConnectionParams(2).U = {0.25, 0.25, 0.25, 0.25, 0.25, 0.25 };
ConnectionParams(2).E_reversal = {-80,-80, -80, -80, -80, -80};

ConnectionParams(2).axonArborSpatialModel = 'gaussian';
ConnectionParams(2).sliceSynapses = true;
ConnectionParams(2).axonConductionSpeed = 0.3;
ConnectionParams(2).synapseReleaseDelay = 0.5;

ConnectionParams(3).axonArborRadius = [200, 300, 200];
ConnectionParams(3).axonArborLimit = [400, 600, 400];
ConnectionParams(3).numConnectionsToAllFromOne = ...
  {[50, 0, 0], [5, 0, 0], [0, 500, 0], [0, 200, 0], [0, 10, 40], [0, 0, 5]};
ConnectionParams(3).synapseType = ...
  {'g_exp_mt', 'g_exp_mt', 'g_exp_mt', 'g_exp_mt', 'g_exp_mt', 'g_exp_mt'};
ConnectionParams(3).targetCompartments = ...
  {NeuronParams(1).dendritesID, NeuronParams(2).dendritesID, ...
   NeuronParams(3).dendritesID, NeuronParams(4).dendritesID, ...
   NeuronParams(5).dendritesID, NeuronParams(6).dendritesID};
ConnectionParams(3).weights = {0.3, 0.3, 0.3, 0.3, 0.3, 0.3};
ConnectionParams(3).tau = {5, 3, 5, 3, 5, 3};
ConnectionParams(3).tau_s = {5, 3, 5, 3, 5, 3};
ConnectionParams(3).fac_tau = {17, 20, 17, 20, 17, 20};
ConnectionParams(3).rec_tau = {62, 50, 62, 50, 62, 50};
ConnectionParams(3).U = {0.5, 0.4, 0.5, 0.4, 0.5, 0.4};
ConnectionParams(3).E_reversal = {-10, -10,-10, -10,-10, -10};

ConnectionParams(3).axonArborSpatialModel = 'gaussian';
ConnectionParams(3).sliceSynapses = true;
ConnectionParams(3).axonConductionSpeed = 0.3;
ConnectionParams(3).synapseReleaseDelay = 0.5;

ConnectionParams(4).axonArborRadius = [0, 150, 0];
ConnectionParams(4).axonArborLimit = [0, 300, 0];
ConnectionParams(4).numConnectionsToAllFromOne = ...
  {[50, 0, 0], [10, 0, 0], [0, 450, 0], [0, 150, 0], [0, 10, 15], [0, 0, 5]};
ConnectionParams(4).synapseType = ...
  {'g_exp_mt', 'g_exp_mt', 'g_exp_mt', 'g_exp_mt', 'g_exp_mt', 'g_exp_mt'};
ConnectionParams(4).targetCompartments = ...
  {1, NeuronParams(2).dendritesID, ...
   1, NeuronParams(4).dendritesID, ...
   1, NeuronParams(6).dendritesID};
ConnectionParams(4).weights = {1.5, 0.3, 1.5, 0.3, 1.5, 0.3};
ConnectionParams(4).tau = {5, 8, 5, 8, 5, 8};
ConnectionParams(4).tau_s = {5, 8, 5, 8, 5, 8};
ConnectionParams(4).fac_tau = {35, 20, 35, 20, 35, 20};
ConnectionParams(4).rec_tau = {60, 70, 60, 70, 60, 70};
ConnectionParams(4).U = {0.25, 0.25, 0.25, 0.25, 0.25, 0.25};
ConnectionParams(4).E_reversal = {-90,-70, -90, -70, -90, -70};
ConnectionParams(4).axonArborSpatialModel = 'gaussian';
ConnectionParams(4).sliceSynapses = true;
ConnectionParams(4).axonConductionSpeed = 0.3;
ConnectionParams(4).synapseReleaseDelay = 0.5;

ConnectionParams(5).axonArborRadius = [100, 200, 300];
ConnectionParams(5).axonArborLimit = [200, 400, 600];
ConnectionParams(5).numConnectionsToAllFromOne = ...
  {[50, 0, 0], [30, 0, 0], [0, 50, 0], [0, 20, 0], [15, 0, 200], [0, 0, 100]};
ConnectionParams(5).synapseType = ...
  {'g_exp_mt', 'g_exp_mt', 'g_exp_mt', 'g_exp_mt', 'g_exp_mt', 'g_exp_mt'};
ConnectionParams(5).targetCompartments = ...
  {NeuronParams(1).dendritesID, NeuronParams(2).dendritesID, ...
   NeuronParams(3).dendritesID, NeuronParams(4).dendritesID, ...
   NeuronParams(5).dendritesID, NeuronParams(6).dendritesID};
ConnectionParams(5).weights = {0.3, 0.3, 0.3, 0.3, 0.3, 0.3};
ConnectionParams(5).tau = {5, 3, 5, 3, 5, 3};
ConnectionParams(5).tau_s = {5, 3, 5, 3, 5, 3};
ConnectionParams(5).fac_tau = {17, 20, 17, 20, 17, 20};
ConnectionParams(5).rec_tau = {62, 50, 62, 50, 62, 50};
ConnectionParams(5).U = {0.5, 0.4, 0.5, 0.4, 0.5, 0.4};
ConnectionParams(5).E_reversal = {0, 0, 0, 0, 0, 0};
ConnectionParams(5).axonArborSpatialModel = 'gaussian';
ConnectionParams(5).sliceSynapses = true;
ConnectionParams(5).axonConductionSpeed = 0.3;
ConnectionParams(5).synapseReleaseDelay = 0.5;

ConnectionParams(6).axonArborRadius = [0, 0, 150];
ConnectionParams(6).axonArborLimit = [0, 0, 300];
ConnectionParams(6).numConnectionsToAllFromOne = ...
  {[0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 400], [0, 0, 40]};
ConnectionParams(6).synapseType = {[], [], [], [], 'g_exp_mt', 'g_exp_mt'};
ConnectionParams(6).targetCompartments = ...
  {[], [], [], [], NeuronParams(5).dendritesID, NeuronParams(6).dendritesID};
ConnectionParams(6).weights = {[], [], [], [], 1.5, 0.3};
ConnectionParams(6).tau = {[], [], [], [],15, 8};
ConnectionParams(6).tau_s = {[], [], [], [], 15, 8};
ConnectionParams(6).fac_tau = {[], [], [], [],35, 20};
ConnectionParams(6).rec_tau = {[], [], [], [], 60, 70};
ConnectionParams(6).U = {[], [], [], [], 0.25, 0.25 };
ConnectionParams(6).E_reversal = {[], [], [], [],-90, -70};

ConnectionParams(6).axonArborSpatialModel = 'gaussian';
ConnectionParams(6).sliceSynapses = true;
ConnectionParams(6).axonConductionSpeed = 0.3;
ConnectionParams(6).synapseReleaseDelay = 0.5;

%%
% The connectivity statistics are influenced by the data in Binzegger et
% al. 2004, while the weights are set arbitrarily to produce some
% interesting spiking behaviour in the network (oscillations). Note that when
% there are no connections between groups (e.g. neurons in group 6 make no
% connections to neurons in groups 1-4), the relevant cells in the connection
% parameters are set to be empty matrices.



%% Set up stimulation field

model = buildPDEgeometry('bipolarElectrode.stl');

%%
outfaces = [5:10 16];
cathode = [3,4,13,14,15];
annode = [1,2,11,12,17];
[TissueParams.StimulationField, TissueParams.StimulationModel] = ...
    buildBipolarElectrodeModel(model, outfaces,annode, cathode,500);
pdeplot3D(TissueParams.StimulationModel,'ColorMapData', TissueParams.StimulationField.NodalSolution);
TissueParams.StimulationOn = [600 700];%pulse interval of 100 ms
TissueParams.StimulationOff = [600.5 700.5];% pulse width of 0.5 ms


%% Recording and simulation settings
% Here we wish to record the various neuronal and synaptic variables of
% interest. 
% We record the synaptic current arriving at group 3 neurons near to the
% stimulating electrode, found by running the simulation and recording the
% neurons recruited during stimulation.
RecordingSettings.I_syn_location = [[700 1500];[700 1500]];
RecordingSettings.I_syn_number = [50, 50];
RecordingSettings.I_syn_group = [1,3];

% Record the short term plasticity variables for recruited neurons.
% This will allow us to calculate the dynamic synaptic weight for these
% cells. 
RecordingSettings.stp_syn_location = [[700 1500];[700 1500]];
RecordingSettings.stp_syn_number = [50, 50];
RecordingSettings.stp_syn_group = [1,3];

RecordingSettings.saveDir = '~/VERTEX_results_tutorial_5/';
RecordingSettings.LFP = true;
%For recording the weights of specific connections at each time step. 
%We specify the presynaptic neuron IDs we wish to record from, we will
%receive the weights of all synapses from these cells.
%For recording a snapshot of the weights of the entire network, we can
%specify the simulation step of the time we wish to record the snapshot at.
%So to calculate the recording step we can do:
% recordingstep = recordingtime/SimulationSettings.timeStep;
[meaX, meaY, meaZ] = meshgrid(0:50:150, 200, 1000);
RecordingSettings.meaXpositions = meaX;
RecordingSettings.meaYpositions = meaY;
RecordingSettings.meaZpositions = meaZ;
RecordingSettings.minDistToElectrodeTip = 20;
%RecordingSettings.v_m = 250:250:4750;
RecordingSettings.maxRecTime = 2500;
RecordingSettings.sampleRate = 2500;

SimulationSettings.simulationTime = 1000;
SimulationSettings.timeStep = 0.03125;
SimulationSettings.parallelSim = true;

%% Run simulation and load results
% We run the simulation and load results as before. Note that this simulation
% will take some time, as it contains more than 10,000 spiking neurons.

[params, connections, electrodes] = ...
  initNetwork(TissueParams, NeuronParams, ConnectionParams, ...
              RecordingSettings, SimulationSettings);

runSimulation(params, connections, electrodes);
Results = loadResults(RecordingSettings.saveDir);

%% Plot the results
% Using these parameters, we obtain the following spike raster:

rasterParams.colors = {'k','m','k','m','k','m'};
rasterParams.groupBoundaryLines = 'c';
rasterParams.title = 'Spike Raster';
rasterParams.xlabel = 'Time (ms)';
rasterParams.ylabel = 'Neuron ID';
rasterParams.figureID = 1;
%rasterFigureImproved = plotSpikeRaster(Results, rasterParams);
%%
figure;
pdeplot3D(TissueParams.StimulationModel, 'ColorMap', TissueParams.StimulationField.NodalSolution, 'FaceAlpha', 0.8)
hold on;

pars.colors = rasterParams.colors;

%plotSomaPositions(Results.params.TissueParams,pars);

%%
% Plotting the LFP and weight change during stimulation


figure;plot(Results.LFP(1,:), 'LineWidth', 2);
set(gcf,'color','w');
set(gca, 'FontSize', 16);

%%
% Showing the recruitment of cells during each pulse
recr = getStimulusRecruitment(Results,false);
disp([num2str(sum([recr(1,1), recr(1,3), recr(1,5)])) ' cells recruited by first stimulation']);
disp([num2str(sum([recr(2,1), recr(2,3), recr(2,5)])) ' cells recruited by second stimulation']);
% Get the inhibitory current at point of stimulation
 inh = getCurrents(Results,[2 4],1:30);
 disp(['First pulse: ' num2str(inh(1)) ' pA of current arriving at recorded cells.']);
 disp(['Second pulse: ' num2str(inh(2)) ' pA of current arriving at recorded cells.']);
%% 
time = 1000:2100;
plotSynapticResource(time, Results);