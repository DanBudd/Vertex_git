function result=brainslice3D(posFaces,negFaces)

model = createpde(); % initialise blank pde model
importGeometry(model,'catvisblend1.stl'); % importing stl geometry from within current path, or give .stl file a full path name. Pass this to 'model'
h = pdegplot(model,'FaceLabels','on','FaceAlpha',0.5); % set up plotting parameters and plots geometry to check face labels

%% Apply boundary conditions
%Outer, insulating boundaries
applyBoundaryCondition(model,'face',[1:6],'g',0.0,'q',0.0); % the outer model boundarys have no change in electric current, so it is always zero here and beyond? 
%applyBoundaryCondition(model,'face',[2 5 3 6],'g',0.0,'q',0.0);
%disp(model.IsTimeDependent)

posFaces(posFaces==0)=[]; % zero means default boundary
negFaces(negFaces==0)=[];

%Electrode-tissue boundary
applyBoundaryCondition(model,'face',posFaces,'h',1.0,'r',6.0); %the 'r' 5.0 sets up a 5(mv?) voltage here
applyBoundaryCondition(model,'face',negFaces,'h',1.0,'r',2.0); %the 'r' -5.0 sets up a -5 (mv?) voltage at this electrode. 
% the two opposing currents set up the electric field. If this can be time
% varying then this would be potentially how to make tACS and tRNS. From
% looking throught the documentation, it seems that the way to specify a
% non-constant boundary condition is to specify it as a function, so 'r',
% @myrfun
%disp(model.IsTimeDependent)

% the coefficients modify the equation being solved. I think m and d being
% zero makes this time independent. 
specifyCoefficients(model,'m',0, 'd',0, 'c',0.3/1000000, 'a',0, 'f',0);

%% Set initial conditions
 % this is necessary for a tme dependent model
%  if model.IsTimeDependent
%      setInitialConditions(model,0,1); %first condition is u, then m...
%  end


%% Solve model

% disp(model.IsTimeDependent) % checking time dependence (output 0 if not).
generateMesh(model);
result = solvepde(model);

%  u = result.NodalSolution; % so u is the solution
%  
%  [X,Y,Z] = meshgrid(-8:10,-3:1,-2:10);
%  V = interpolateSolution(result,X,Y,Z);
% V = reshape(V,size(X));
% 
% pdeplot3D(model,'ColorMapData', u,'FaceAlpha',0.3);

% figure
% colormap jet
% contourslice(X,Y,Z,V,[],[],-5:0.5:5)
% xlabel('x')
% ylabel('y')
% zlabel('z')
% colorbar
% axis equal

% [gradx,grady,gradz] = evaluateGradient(result,X,Y,Z);
% gradx = reshape(gradx,size(X));
% grady = reshape(grady,size(Y));
% gradz = reshape(gradz,size(Z));
% % 
% figure
% quiver3(X,Y,Z,gradx,grady,gradz)
% axis equal
% xlabel 'x'
% ylabel 'y'
% zlabel 'z'
% title('Quiver Plot of Estimated Gradient of Solution')
