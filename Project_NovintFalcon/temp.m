%%
thetas = [pi/3,2*pi/3,pi/3;pi/3,2*pi/3,pi/3;pi/3,2*pi/3,pi/3];

a = 60; %mm
b = 103; %mm
c = 16.3; %mm
d = 12; %mm
e = 12; % mm
r = 37; %mm

% work space of the Novint Falcon [ xmin, xmax, ymin, ymax, zmin, zmax]
workspace = [-100,100,-100,100,0,200];
vector_size = 0.05*max(abs(diff(reshape(workspace,2,3))));

T = NovintFalcon_FK( thetas );

% Create figure window
figure('Color','w');

% Create axes object
ax = axes('XLim',workspace(1:2),'YLim',workspace(3:4),'ZLim',workspace(5:6));
% vw = [31.3,22.8];
set(gca,'View',vw);
grid minor;
% axis equal;
xlabel('X (mm)','FontSize',10);
ylabel('Y (mm)','FontSize',10);
zlabel('Z (mm)','FontSize',10);
%
%%
% General Base
h = drawRobotFrame([0,0,0]);
hg = hggroup('Parent',ax);
set(h,'Parent',hg);
circ = linspace(0,2*pi,50);
L_base = line(r*cos(circ),r*sin(circ),zeros(length(circ)),...
    'Color','k','LineWidth',1.5);
set(L_base,'Parent',hg);
T_base = hgtransform('Parent',ax,'Matrix',makehgtform('translate',[0,0,0]));
set(hg,'Parent',T_base);

% Leg 1: Base
h = drawRobotFrame([0,0,1]);
hg = hggroup('Parent',ax);
set(h,'Parent',hg);
T1_0 = hgtransform('Parent',T_base,'Matrix',T{1,1});
set(hg,'Parent',T1_0);

% Leg 1: Link 1
h = drawRobotFrame([0,1,0]);
hg = hggroup('Parent',ax);
set(h,'Parent',hg);
L1_1 = line([0,a],[0,0],[0,0],...
    'Color','r','LineWidth',1.5);
set(L1_1,'Parent',hg);
T1_1 = hgtransform('Parent',T1_0,'Matrix',T{1,2});
set(hg,'Parent',T1_1);

% Leg 1: Link 2
h = drawRobotFrame([1,0,0]);
hg = hggroup('Parent',ax);
set(h,'Parent',hg);
L1_2 = line([0,e],[0,0],[0,0],...
    'Color','b','LineWidth',1.5);
set(L1_2,'Parent',hg);
T1_2 = hgtransform('Parent',T1_1,'Matrix',T{1,3});
set(hg,'Parent',T1_2);

% Leg 1: Link 3
h = drawRobotFrame([1,1,0]);
hg = hggroup('Parent',ax);
set(h,'Parent',hg);
L1_3 = line([0,b],[0,0],[0,0],...
    'Color','g','LineWidth',1.5);
set(L1_3,'Parent',hg);
T1_3 = hgtransform('Parent',T1_2,'Matrix',T{1,4});
set(hg,'Parent',T1_3);

% Leg 1: Link 4
h = drawRobotFrame([1,0,1]);
hg = hggroup('Parent',ax);
set(h,'Parent',hg);
L1_4 = line([0,d],[0,0],[0,0],...
    'Color','b','LineWidth',1.5);
set(L1_4,'Parent',hg);
T1_4 = hgtransform('Parent',T1_3,'Matrix',T{1,5});
set(hg,'Parent',T1_4);

% Leg 1: end
h = drawRobotFrame([0,1,1]);
hg = hggroup('Parent',ax);
set(h,'Parent',hg);
T1_5 = hgtransform('Parent',T1_4,'Matrix',T{1,6});
set(hg,'Parent',T1_5);
%
% Leg 2: Base
h = drawRobotFrame([0,0,1]);
hg = hggroup('Parent',ax);
set(h,'Parent',hg);
T2_0 = hgtransform('Parent',T_base,'Matrix',T{2,1});
set(hg,'Parent',T2_0);

% Leg 2: Link 1
h = drawRobotFrame([0,1,0]);
hg = hggroup('Parent',ax);
set(h,'Parent',hg);
L2_1 = line([0,a],[0,0],[0,0],...
    'Color','r','LineWidth',1.5);
set(L2_1,'Parent',hg);
T2_1 = hgtransform('Parent',T2_0,'Matrix',T{2,2});
set(hg,'Parent',T2_1);

% Leg 2: Link 2
h = drawRobotFrame([1,0,0]);
hg = hggroup('Parent',ax);
set(h,'Parent',hg);
L2_2 = line([0,e],[0,0],[0,0],...
    'Color','b','LineWidth',1.5);
set(L2_2,'Parent',hg);
T2_2 = hgtransform('Parent',T2_1,'Matrix',T{2,3});
set(hg,'Parent',T2_2);

% Leg 2: Link 3
h = drawRobotFrame([1,1,0]);
hg = hggroup('Parent',ax);
set(h,'Parent',hg);
L2_3 = line([0,b],[0,0],[0,0],...
    'Color','g','LineWidth',1.5);
set(L2_3,'Parent',hg);
T2_3 = hgtransform('Parent',T2_2,'Matrix',T{2,4});
set(hg,'Parent',T2_3);

% Leg 2: Link 4
h = drawRobotFrame([1,0,1]);
hg = hggroup('Parent',ax);
set(h,'Parent',hg);
L2_4 = line([0,d],[0,0],[0,0],...
    'Color','b','LineWidth',1.5);
set(L2_4,'Parent',hg);
T2_4 = hgtransform('Parent',T2_3,'Matrix',T{2,5});
set(hg,'Parent',T2_4);

% Leg 2: end
h = drawRobotFrame([0,1,1]);
hg = hggroup('Parent',ax);
set(h,'Parent',hg);
T2_5 = hgtransform('Parent',T2_4,'Matrix',T{2,6});
set(hg,'Parent',T2_5);

% Leg 3: Base
h = drawRobotFrame([0,0,1]);
hg = hggroup('Parent',ax);
set(h,'Parent',hg);
T3_0 = hgtransform('Parent',T_base,'Matrix',T{3,1});
set(hg,'Parent',T3_0);

% Leg 3: Link 1
h = drawRobotFrame([0,1,0]);
hg = hggroup('Parent',ax);
set(h,'Parent',hg);
L3_1 = line([0,a],[0,0],[0,0],...
    'Color','r','LineWidth',1.5);
set(L3_1,'Parent',hg);
T3_1 = hgtransform('Parent',T3_0,'Matrix',T{3,2});
set(hg,'Parent',T3_1);

% Leg 3: Link 2
h = drawRobotFrame([1,0,0]);
hg = hggroup('Parent',ax);
set(h,'Parent',hg);
L3_2 = line([0,e],[0,0],[0,0],...
    'Color','b','LineWidth',1.5);
set(L3_2,'Parent',hg);
T3_2 = hgtransform('Parent',T3_1,'Matrix',T{3,3});
set(hg,'Parent',T3_2);

% Leg 3: Link 3
h = drawRobotFrame([1,1,0]);
hg = hggroup('Parent',ax);
set(h,'Parent',hg);
L3_3 = line([0,b],[0,0],[0,0],...
    'Color','g','LineWidth',1.5);
set(L3_3,'Parent',hg);
T3_3 = hgtransform('Parent',T3_2,'Matrix',T{3,4});
set(hg,'Parent',T3_3);

% Leg 3: Link 4
h = drawRobotFrame([1,0,1]);
hg = hggroup('Parent',ax);
set(h,'Parent',hg);
L3_4 = line([0,d],[0,0],[0,0],...
    'Color','b','LineWidth',1.5);
set(L3_4,'Parent',hg);
T3_4 = hgtransform('Parent',T3_3,'Matrix',T{3,5});
set(hg,'Parent',T3_4);

% Leg 3: end
h = drawRobotFrame([0,1,1]);
hg = hggroup('Parent',ax);
set(h,'Parent',hg);
T3_5 = hgtransform('Parent',T3_4,'Matrix',T{3,6});
set(hg,'Parent',T3_5);
