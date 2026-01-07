function traceresultats
close all
load solution t x
load resultat resultats excentricite
rT=x(:,1:3);
rL=x(:,7:9);
figure
plot3(rL(:,1)-rT(:,1),rL(:,2)-rT(:,2),rL(:,3)-rT(:,3))
xlabel('x (en km)')
ylabel('y (en km)')
zlabel('z (en km)')
grid on
drawnow
pemin=356400;pemax=370400;
apmin=404000;apmax=406700;
figure
plot(t/(3600*24),sqrt(sum((rL-rT).^2,2)),...
    [t(1) t(end)]/(3600*24),[pemin pemin],...
    [t(1) t(end)]/(3600*24),[pemax pemax],...
    [t(1) t(end)]/(3600*24),[apmin apmin],...
    [t(1) t(end)]/(3600*24),[apmax apmax]...
    )
ech=axis;
axis([[t(1) t(end)]/(3600*24) ech(3:4)])
xlabel('temps (en jours)')
ylabel('distance Terre Lune (en km)')
grid on
drawnow
angleplan=zeros(length(t),1);
for n=1:length(t)
    lignenoeudorth=resultats(:,2,n);
    angleplan(n)=atan2d(lignenoeudorth(3),sqrt(lignenoeudorth(1)^2+lignenoeudorth(2)^2));
end
amin=4.99;
amax=5.30;
figure
plot(t/(3600*24),-angleplan,...
    [t(1) t(end)]/(3600*24),[amin amin],...
    [t(1) t(end)]/(3600*24),[amax amax]...
    )
ech=axis;
axis([[t(1) t(end)]/(3600*24) ech(3:4)])
grid on
xlabel('temps (en jours)')
ylabel('inclinaison du plan de l''orbite osculatrice (en degrés)')
drawnow

emin=0.026;emax=0.077;
figure
plot(t/(3600*24),excentricite,...
    [t(1) t(end)]/(3600*24),[emin emin],...
    [t(1) t(end)]/(3600*24),[emax emax]...
    )
ech=axis;
axis([[t(1) t(end)]/(3600*24) ech(3:4)])
grid on
xlabel('temps (en jours)')
ylabel('excentricité de l''orbite osculatrice')
drawnow

print -f1 -dpng orbite.png
print -f2 -dpng distanceterrelune.png
print -f3 -dpng inclinaison.png
print -f4 -dpng excentricite.png

