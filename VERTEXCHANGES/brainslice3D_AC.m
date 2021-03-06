
model = createpde(); % initialise blank pde model
importGeometry(model,'catvisblend1.stl'); % importing stl geometry from within current path, or give .stl file a full path name. Pass this to 'model'
h = pdegplot(model,'FaceLabels','on','FaceAlpha',0.5); % set up plotting parameters and plots geometry to check face labels

%% Apply boundary conditions
%Outer, insulating boundaries
% applyBoundaryCondition(model,'face',2:5,'g',0.0,'q',0.0); % the outer model boundarys have no change in electric current, so it is always zero here and beyond? 
%applyBoundaryCondition(model,'face',[2 5 3 6],'g',0.0,'q',0.0);
%disp(model.IsTimeDependent)


% myrfun = @(region,state)sin(state.time);
% myrfun2 = @(region,state)-sin(state.time);


%Electrode-tissue boundary
%applyBoundaryCondition(model,'face',[7,8,15:19],'h',1.0,'r',@myrfun); %Dirichlet boundary condition, the 'r' 5.0 sets up a 5(mv?) voltage here
%applyBoundaryCondition(model,'face',[1,9:14],'h',1.0,'r',@myrfun2); %the 'r' -5.0 sets up a -5 (mv?) voltage at this electrode. 
% applyBoundaryCondition(model,'face',6,'h',1.0,'r',@myrfun); %Dirichlet boundary condition, the 'r' 5.0 sets up a 5(mv?) voltage here
% applyBoundaryCondition(model,'face',1,'h',1.0,'r',@myrfun2); %the 'r' -5.0 sets up a -5 (mv?) voltage at this electrode. 




tlist=0:0.03125:(2*pi)/(2*pi*(60/1000)); % extract solutions for one period of the sine wave. 


    applyBoundaryCondition(model,'face',[3:6],'g',0.0,'q',0.0); % the outer model boundarys have no change in electric current, so it is always zero here and beyond?
    applyBoundaryCondition(model,'face',[2],'h',1.0,'r',@myrfun); %the 'r' 5.0 sets up a 5(mv?) voltage here
    applyBoundaryCondition(model,'face',[1],'h',1.0,'r',@myrfun2);



% the two opposing currents set up the electric field. If this can be time
% varying then this would be potentially how to make tACS and tRNS. From
% looking throught the documentation, it seems that the way to specify a
% non-constant boundary condition is to specify it as a function, so 'r',


%disp(model.IsTimeDependent)

% the coefficients modify the equation being solved. I think m and d being
% zero makes this time independent. 
specifyCoefficients(model,'m',0, 'd',1, 'c',0.3/1000000, 'a',0, 'f',0);
generateMesh(model)%,'Hmax',10000);


%% Set initial conditions and solve
% % this is necessary for a time dependent model
 if model.IsTimeDependent
     setInitialConditions(model,0); 
    %first condition after model is u, the state att=0.
    result = solvepde(model,tlist);
 else
    result = solvepde(model);
 end


save('A4mv2hz','result','-v7.3')
 
disp(model.IsTimeDependent) % checking time dependence (output 0 if not).
%component = 3;




 %% Plotting results
u = result.NodalSolution; % so u is the solution

%hold off
% if model.IsTimeDependent
%     for i=1:length(tlist)
%         %figure
%         pdeplot3D(model,'ColorMapData', u(:,i));
%         view([0,100])
%         caxis([-1,1]) % colour bar scale, need to change this if increasing the amplitude
%         colorbar
%         Fu(i) = getframe(gcf);
%     end
% else
%     pdeplot3D(model,'ColorMapData', u);
% end

% [X,Y,Z] = meshgrid(0:10:2000,0:10:400,0:10:650); % (-8:10,-3:1,-2:10);
%  
%  if model.IsTimeDependent
%      V = interpolateSolution(result,X,Y,Z,1:length(tlist));
%      Vr = reshape(V,[size(X),length(tlist)]);
%        contourslice(X,Y,Z,squeeze(Vr(:,:,:,length(tlist))),[],[],0:10:500)
% %      for i = 1:length(tlist)
%          figure %(i+length(tlist))
%          colormap jet
%          contourslice(X,Y,Z,squeeze(Vr(:,:,:,i)),[],[],0:10:500)
%          xlabel('x')
%          ylabel('y')
%          zlabel('z')
%          caxis([-0.06,0.06])
%          colorbar
%          axis equal
%          view(0,90)
%          %view(-50,22)
%          Fv(i)=getframe(gcf);
%      end
%  else
%      V = interpolateSolution(result,X,Y,Z);
%      Vr = reshape(V,size(X));
%      figure
%      colormap jet
%      contourslice(X,Y,Z,Vr(:,:,:),[],[],-5:0.5:5)
%      xlabel('x')
%      ylabel('y')
%      zlabel('z')
%      colorbar
%      axis equal
%      view(-50,22)
%  end
%      
% clear fig 
% if model.IsTimeDependent
%     [gradx,grady,gradz] = evaluateGradient(result,X,Y,Z,1:length(tlist));
%     gradx = reshape(gradx,[size(X),length(tlist)]);
%     grady = reshape(grady,[size(Y),length(tlist)]);
%     gradz = reshape(gradz,[size(Z),length(tlist)]);
%    
%     figure
%     quiver3(X,Y,Z,squeeze(gradx(:,:,:,1)),squeeze(grady(:,:,:,1)),squeeze(gradz(:,:,:,1)))
%     axis equal
%     xlabel 'x'
%     ylabel 'y'
%     zlabel 'z'
%     title('Quiver Plot of Estimated Gradient of Solution')
% else
%     [gradx,grady,gradz] = evaluateGradient(result,X,Y,Z);
%     gradx = reshape(gradx,size(X));
%     grady = reshape(grady,size(Y));
%     gradz = reshape(gradz,size(Z));
%     figure
%     quiver3(X,Y,Z,gradx,grady,gradz)
%     axis equal
%     xlabel 'x'
%     ylabel 'y'
%     zlabel 'z'
%     title('Quiver Plot of Estimated Gradient of Solution')
% end
% 
% 


function bcMatrix = myrfun(~,state) 

bcMatrix = 100*sin((2*pi*(60/1000))*state.time); %multiply state.time by the value set to B

end

function bcMatrix = myrfun2(~,state)

bcMatrix = -100*sin(2*pi*(60/1000)*state.time); %multiply state.time by the value set to B

end
