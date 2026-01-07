function genereresultats
load solution t x muT muL
mu_eq=muT+muL;
resultats=zeros(3,3,length(t));
excentricite=zeros(length(t),1);
for n=1:length(t)
    rT=x(n,1:3);vT=x(n,4:6);
    rL=x(n,7:9);vL=x(n,10:12);
    px=rL(1)-rT(1);
    py=rL(2)-rT(2);
    pz=rL(3)-rT(3);
    vx=vL(1)-vT(1);
    vy=vL(2)-vT(2);
    vz=vL(3)-vT(3);
    momentcine=cross([px;py;pz],[vx;vy;vz]);
    lignenoeud=cross([0 0 1],momentcine);
    lignenoeud=lignenoeud/norm(lignenoeud);
    resultats(:,1,n)=lignenoeud;
    lignenoeudorth=cross(lignenoeud,momentcine);
    lignenoeudorth=lignenoeudorth/norm(lignenoeudorth);
    resultats(:,2,n)=lignenoeudorth;
    ur=[px;py;pz];
    ur=ur/norm(ur);
    ut=cross(momentcine,ur);
    ut=ut/norm(ut);
    C2=norm(momentcine)^2;
    r=norm([px;py;pz]);
    v=[vx;vy;vz];
    alpha=atan2d(dot(ur,v),dot(ut,v));
    theta=atan2d(tand(alpha)*C2/(mu_eq*r),C2/(mu_eq*r)-1);
    ligneapside=ur*cosd(theta)-ut*sind(theta);
    resultats(:,3,n)=ligneapside;
    excentricite(n)=sqrt((C2/(mu_eq*r)-1)^2+(tand(alpha)*(C2/(mu_eq*r)))^2);
end
save resultat resultats excentricite