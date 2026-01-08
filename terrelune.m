function terrelune
% Paramêtres gravitationnels standards
muS=132712440018;muT=398600.435436;muL=4902.800066;
% Instants auxquels la solution est estimée
tdeb=0;tfin=18.6*3600*24*365.24;tpas=900;t=tdeb:tpas:tfin;
% Conditions initiales
% JPL Horizons 20-03-2017 0:00
% Terre
%  X =-1.489612085018629E+08 Y = 1.734383481755939E+06 Z = 2.930533439036226E+02
%  VX=-8.422475717779083E-01 VY=-2.989673786639651E+01 VZ= 1.553338233430068E-03
% Lune
%  X =-1.490169333805148E+08 Y = 1.336137121724386E+06 Z = 3.507581793676020E+04
%  VX= 1.180401057014782E-01 VY=-3.001482606283781E+01 VZ=-2.902583731558295E-02
x0=[...fixés
    -1.489612085018629E+08;1.734383481755939E+06;2.930533439036226E+02;...
    -8.422475717779083E-01;-2.989673786639651E+01;1.553338233430068E-03;...
    -1.490169333805148E+08;1.336137121724386E+06;3.507581793676020E+04;...
    1.180401057014782E-01;-3.001482606283781E+01;-2.902583731558295E-02...
    ];
% Résolution numérique aux instants fixés
[~,x]=rk4(@(t,x) equ_dyn_terre_lune(t,x,muS,muT,muL),t,x0);
% Sauvegarde de la solution
save solution t x muT muL

function xp=equ_dyn_terre_lune(~,x,muS,muT,muL)
rT=x(1:3);rL=x(7:9);
vT=x(4:6);vL=x(10:12);
xp=zeros(12,1);
xp(1:3)=vT;xp(7:9)=vL;
xp(4:6)=-muS*rT/norm(rT)^3-muL*(rT-rL)/norm(rT-rL)^3;
xp(10:12)=-muS*rL/norm(rL)^3-muT*(rL-rT)/norm(rL-rT)^3;

% La fonction d'intégration pour rk4
% * Le paramètre f est une fonction qui prend nécessairement
% deux paramètres t et y, par exemple :
% f=@(t,y) mafonction(t,y,param1,param2,...,paramn);
% @(t,y) est une "fonction anonyme" dont on donne sur la
% même ligne le comportement, avec l'appel à une fonction
% prenant éventuellement d'autres paramètres 
% que les paramètres t et y initialement souhaités.
% * Le paramètre t est ici un vecteur contenant
% les instants auxquels on souhaite calculer la solution
% * Le paramètre y0 est l'état initial
% * Le tableau y en résultat comprend N lignes
% où N est le nombre d'instants sur lesquels
% la solution est estimée. Chaque ligne de ce
% tableau est l'état à l'instant correspondant
function [t,y]=rk4(f,t,y0)
N=length(t);
y=zeros(N,length(y0));
k1=zeros(1,length(y0));k2=k1;k3=k1;k4=k1;
y(1,:)=y0(:);
for n=2:N
    yprec=y(n-1,:);tprec=t(n-1);
    h=t(n)-tprec;
    k1(:)=f(tprec,yprec);
    k2(:)=f(tprec+h/2,yprec+(h/2)*k1);
    k3(:)=f(tprec+h/2,yprec+(h/2)*k2);
    k4(:)=f(tprec+h,yprec+h*k3);
    y(n,:)=yprec+(h/6)*(k1+2*k2+2*k3+k4);
end