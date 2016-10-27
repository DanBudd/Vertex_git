pyramidalgroups = [1 3 5];
interneuron = [2 3 4 5 6 9 10 11 12 17 18 19 20];
N = Results.params.TissueParams.N;
neuronInGroup = createGroupsFromBoundaries(Results.params.TissueParams.groupBoundaryIDArr);
pyramidalids = ismember(neuronInGroup,pyramidalgroups);
endv_m = Results.v_m(:,40);
pyramidalv_ms = endv_m(pyramidalids);
pars.toPlot = pyramidalids;
plotSomaPositionsMembranePotential(Results.params.TissueParams,pars,pyramidalv_ms);

%eletrode position x = 742, z = 650