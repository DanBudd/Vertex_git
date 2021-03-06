NP(1).modelProportion = 0.2741;
NP(1).neuronModel = 'adex';
NP(1).C = 1.0*2.96;
NP(1).R_M = 20000/2.96;
NP(1).R_A = 1000;%150;
NP(1).E_leak = -70;
NP(1).V_t = -50;
NP(1).delta_t = 2;
NP(1).a = 2.6;
NP(1).tau_w = 65;
NP(1).b = 220;
NP(1).v_reset = -60;
NP(1).v_cutoff = -45;
NP(1).somaLayer = 2;
NP(1).numCompartments = 16;
NP(1).compartmentLengthArr = [6.5 24 62 72.5 68.5 20 81.7267 81.7267 6.5 24 62 72.5 68.5 20 81.7267 81.7267];
NP(1).compartmentDiameterArr = [29.8 3.75 1.91 2.81 2.69 2.62 1.69 1.69 29.8 3.75 1.91 2.81 2.69 2.62 1.69 1.69];
NP(1).compartmentParentArr = [0 1 2 2 4 1 6 6 1 2 3 4 5 6 7 8];
NP(1).compartmentXPositionMat = [0 0; 0 0; 0 62; 0 0; 0 0; ...
                                 0 0; 0 -69.5; 0 69.5; 0 0; 0 0; 62 124; 0 0; 0 0; 0 0; -69.5 -139; 69.5 139];
NP(1).compartmentYPositionMat = [0 0; 0 0; 0 0; 0 0; 0 0; ...
                                 0 0; 0 0; 0 0; 0 0; 0 0; 0 0; 0 0; 0 0; 0 0; 0 0; 0 0];
NP(1).compartmentZPositionMat = [-13 -6.5; 0 24; 48 48; 48 120.5; ...
                                 193 261.5; -13 -33; -53 -96; ...
                                 -53 -96; -6.5 0; 24 48; 48 48; 120.5 193; 261.5 330; -33 -53; -96 -139; -96 -139];
NP(1).somaID = [1 9];
NP(1).basalID = [6 7 8 14 15 16];
NP(1).proximalID = [2 6 10 14];
NP(1).distalID = [7 8 15 16];
NP(1).obliqueID = [3 11];
NP(1).apicalID = [4 12];
NP(1).trunkID = [2 10];
NP(1).tuftID = [5 13];
NP(1).axisAligned = 'z';
NP(1).Input(1).inputType = 'i_ou';
NP(1).Input(1).meanInput = 360;
NP(1).Input(1).tau = 2;
NP(1).Input(1).stdInput = 110;

NP(2).modelProportion = 0.0327;
NP(2).neuronModel = 'adex';
NP(2).C = 1*2.93;
NP(2).R_M = 15000/2.93;
NP(2).R_A = 1000;%150;
NP(2).E_leak = -70;
NP(2).V_t = -50;
NP(2).v_cutoff = -45;
NP(2).delta_t = 2;
NP(2).a = 0.04;
NP(2).tau_w = 10;
NP(2).b = 40;
NP(2).v_reset = -65;
NP(2).somaLayer = 2;
NP(2).numCompartments = 14;
NP(2).compartmentLengthArr = [5 28 75.6604 75.6604 28 75.6604 75.6604 5 28 75.6604 75.6604 28 75.6604 75.6604];
NP(2).compartmentDiameterArr = [24 1.93 1.95 1.95 1.93 1.95 1.95 24 1.93 1.95 1.95 1.93 1.95 1.95];
NP(2).compartmentParentArr = [0 1 2 2 1 5 5 1 2 3 4 5 6 7];
NP(2).compartmentXPositionMat = [0 0; 0 0; 0 53.5; 0 -53.5; ...
                                 0 0; 0 -53.5; 0 53.5; 0 0; 0 0; 53.5 107; -53.5 -107; 0 0; -53.5 -107; 53.5 107];
NP(2).compartmentYPositionMat = [0 0; 0 0; 0 0; 0 0; 0 0; ...
                                 0 0; 0 0; 0 0; 0 0; 0 0; 0 0; 0 0; 0 0; 0 0];
NP(2).compartmentZPositionMat = [-10 -5; 0 28; 56 109.5; ...
                                  56 109.5; -10 -38; -66 -119.5; ...
                                 -66 -119.5; -5 0; 28 56; 109.5 163; 109.5 163; -38 -66; -119.5 -173; -119.5 -173];
NP(2).somaID = [1 8];
NP(2).basalID = [3 4 5 6 7 10 11 12 13 14];
NP(2).proximalID = [2 5 9 12];
NP(2).distalID = [3 4 6 7 10 11 13 14];
NP(2).axisAligned = '';
NP(2).Input(1).inputType = 'i_ou';
NP(2).Input(1).meanInput = 200;
NP(2).Input(1).tau = .8;
NP(2).Input(1).stdInput = 60;

NP(3) = NP(2);
NP(3).modelProportion = 0.0225;
NP(3).V_t = -55;
NP(3).v_cutoff = -50;
NP(3).delta_t = 2.2;
NP(3).a = .04;
NP(3).tau_w = 75;
NP(3).b = 75;
NP(3).v_reset = -62;
NP(3).Input(1).inputType = 'i_ou';
NP(3).Input(1).meanInput = 160;
NP(3).Input(1).tau = .8;
NP(3).Input(1).stdInput = 40;

NP(4) = NP(2);
NP(4).modelProportion = 0.0967;
NP(4).V_t = -50;
NP(4).v_cutoff = -45;
NP(4).delta_t = 2.2;
NP(4).a = .35;
NP(4).tau_w = 150;
NP(4).b = 40;
NP(4).v_reset = -70;
NP(4).somaLayer = 3;
NP(4).Input(1).inputType = 'i_ou';
NP(4).Input(1).meanInput = 205;
NP(4).Input(1).tau = 2;
NP(4).Input(1).stdInput = 50;

NP(5) = NP(4);

NP(6) = NP(1);
NP(6).modelProportion = 0.0967;
NP(6).somaLayer = 3;
NP(6).Input(1).inputType = 'i_ou';
NP(6).Input(1).meanInput = 250;
NP(6).Input(1).tau = 2;
NP(6).Input(1).stdInput = 70;

NP(7) = NP(2);
NP(7).modelProportion = 0.0568;
NP(7).somaLayer = 3;

NP(8) = NP(3);
NP(8).modelProportion = 0.0158;
NP(8).somaLayer = 3;

NP(9).modelProportion = 0.05;
NP(9).neuronModel = 'adex';
NP(9).C = 1.0*2.95;
NP(9).R_M = 20000/2.95;
NP(9).R_A = 1000;%150;
NP(9).E_leak = -70;
NP(9).V_t = -52;
NP(9).v_cutoff = -47;
NP(9).delta_t = 2;
NP(9).a = 10;
NP(9).tau_w = 75;
NP(9).b = 345;
NP(9).v_reset = -60;
NP(9).somaLayer = 4;
NP(9).numCompartments = 18;
NP(9).compartmentLengthArr = [17.5 32.5 76 199 201 126 26 110.0965 110.0965 17.5 32.5 76 199 201 126 26 110.0965 110.0965];
NP(9).compartmentDiameterArr = [25 4.36 2.65 4.10 2.25 2.4 5.94 3.45 3.45 25 4.36 2.65 4.10 2.25 2.4 5.94 3.45 3.45];
NP(9).compartmentParentArr = [0 1 2 2 4 5 1 7 7 1 2 3 4 5 6 7 8 9];
NP(9).compartmentXPositionMat = [0 0; 0 0; 0 76; 0 0; 0 0; ...
                                 0 0; 0 0; 0 -96.5; 0 96.5; 0 0; 0 0; 76 152; 0 0; 0 0; 0 0; 0 0; -96.5 -193; 96.5 193];
NP(9).compartmentYPositionMat = [0 0; 0 0; 0 0; 0 0; 0 0; ...
                                 0 0; 0 0; 0 0; 0 0; 0 0; 0 0; 0 0; 0 0; 0 0; 0 0; 0 0; 0 0; 0 0];
NP(9).compartmentZPositionMat = [-35 -17.5; 0 32.5; 65 65; ...
                                  65 264; 463 664; 865 991; ...
                                 -35 -61; -87 -140; -87 -140; -17.5 0; 32.5 65; 65 65; 264 463; 664 865; 991 1117; -61 -87; -140 -193; -140 -193];
NP(9).somaID = [1 10];
NP(9).basalID = [7 8 9 16 17 18];
NP(9).proximalID = [2 7 11 16];
NP(9).distalID = [8 9 17 18];
NP(9).obliqueID = [3 12];
NP(9).apicalID = [4 5 13 14];
NP(9).trunkID = [2 11];
NP(9).tuftID = [6 15];
NP(9).axisAligned = 'z';
NP(9).Input(1).inputType = 'i_ou';
NP(9).Input(1).meanInput = 860;
NP(9).Input(1).tau = 2;
NP(9).Input(1).stdInput = 260;

NP(10) = NP(9);
NP(10).modelProportion = 0.0136;

NP(11) = NP(2);
NP(11).modelProportion = 0.0063;
NP(11).somaLayer = 4;

NP(12) = NP(3);
NP(12).modelProportion = 0.0084;
NP(12).somaLayer = 4;

NP(13) = NP(9);
NP(13).modelProportion = 0.1413;
NP(13).V_t = -50;
NP(13).v_cutoff = -45;
NP(13).delta_t = 2;
NP(13).a = 0.35;
NP(13).tau_w = 160;
NP(13).b = 60;
NP(13).v_reset = -65;
NP(13).somaLayer = 5;
NP(13).Input(1).inputType = 'i_ou';
NP(13).Input(1).meanInput = 660;
NP(13).Input(1).tau = 2;
NP(13).Input(1).stdInput = 170;

NP(14) = NP(13);
NP(14).modelProportion = 0.0468;

NP(15) = NP(2);
NP(15).modelProportion = 0.0416;
NP(15).somaLayer = 5;
NP(15).Input.tau = 2;

