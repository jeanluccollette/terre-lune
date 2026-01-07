function visuterrelune(az,el)
if nargin==0
    az=30;
    el=50;
end
close all
vid=VideoWriter(sprintf('lune%02d%02d.mp4',az,el),'MPEG-4');
vid.FrameRate=25;
open(vid)
load solution t x muT muL
mu_eq=muT+muL;
rT=x(:,1:3);vT=x(:,4:6);
rL=x(:,7:9);vL=x(:,10:12);
figure
plot3(rL(:,1)-rT(:,1),rL(:,2)-rT(:,2),rL(:,3)-rT(:,3),'r',0,0,0,'ok');
xlabel('x (en km)')
ylabel('y (en km)')
zlabel('z (en km)')
view(-40,40)
grid on

figure
pastemps=3600*24*4;
pertemps=3600*24*28;
fini=0;temps=-pertemps;
while fini==0
    ndeb=1;
    tcour=0;
    while tcour<temps
        tcour=t(ndeb);
        ndeb=ndeb+1;
    end
    nfin=1;
    tcour=0;
    while tcour<(temps+pertemps)
        tcour=t(nfin);
        nfin=nfin+1;
    end    
    x=rL(ndeb:nfin,1)-rT(ndeb:nfin,1);
    y=rL(ndeb:nfin,2)-rT(ndeb:nfin,2);
    z=rL(ndeb:nfin,3)-rT(ndeb:nfin,3);
    vx=vL(ndeb:nfin,1)-vT(ndeb:nfin,1);
    vy=vL(ndeb:nfin,2)-vT(ndeb:nfin,2);
    vz=vL(ndeb:nfin,3)-vT(ndeb:nfin,3);
    momentcine=cross([x(end);y(end);z(end)],[vx(end);vy(end);vz(end)]);
    lignenoeud=cross([0 0 1],momentcine);
    temps=temps+pastemps;
    echlune=450000;
    echsol=echlune/norm([rT(nfin,1);rT(nfin,2);rT(nfin,3)]);
    ur=[x(end);y(end);z(end)];
    ur=ur/norm(ur);
    ut=cross(momentcine,ur);
    ut=ut/norm(ut);
    C2=norm(momentcine)^2;
    r=norm([x(end);y(end);z(end)]);
    v=[vx(end);vy(end);vz(end)];
    alpha=atan2d(dot(ur,v),dot(ut,v));
    theta=atan2d(tand(alpha)*C2/(mu_eq*r),C2/(mu_eq*r)-1);
    ligneapside=ur*cosd(theta)-ut*sind(theta);
    plot3(...
        0,0,0,'ok',...
        echlune*(lignenoeud(1)/norm(lignenoeud))*[-1 1],...
        echlune*(lignenoeud(2)/norm(lignenoeud))*[-1 1],...
        echlune*(lignenoeud(3)/norm(lignenoeud))*[-1 1],...
        'b',...
        x(end),y(end),z(end),'or',...
        x,y,z,'r',...
        [0 -rT(nfin,1)]*echsol,[0 -rT(nfin,2)]*echsol,[0 -rT(nfin,3)]*echsol,'g',...
        -rT(nfin,1)*echsol,-rT(nfin,2)*echsol,-rT(nfin,3)*echsol,'xg',...
        echlune*ligneapside(1)*[-1 1],...
        echlune*ligneapside(2)*[-1 1],...
        echlune*ligneapside(3)*[-1 1],'k'...
        )
    grid on
    xlabel('x (en km)')
    ylabel('y (en km)')
    zlabel('z (en km)')
    if el==90
        axis equal
    end
    axis([-450000 450000 -450000 450000 -40000 40000])
    view(az,el)
    drawnow
    F=getframe(gcf);
    RGB=frame2im(F);
    RGB=insertText(RGB,[1 1],sprintf('%.3f jours',t(nfin)/(3600*24)));
    writeVideo(vid,RGB);
    if (temps+pertemps)>=t(end)
        fini=1;
    end
end
close(vid)