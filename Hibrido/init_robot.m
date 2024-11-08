%% init_robot.m
%
%     En este archivo se definen los par�metros del robot dado por la
%     c�tedra:
%       -Manipulador RR.
%       -Dos links
%       -Cada link tiene 1m de largo, masa de 1kg concentrada al final del
%       link y fricci�n unitaria
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Par�metros f�sicos del robot
L = [1,1];                      %Vector con longitudes de cada link
m = [1,1];                      %Vector con masa de cada link

I = {0*eye(3),0*eye(3)};        %Matrices de inercia nulas por masa concentrada

b = [1,1];                      %Fricci�n unitaria

r = {[L(1),0,0],[L(2),0,0]};    %El centro de masa est� al final del link
a = [0,L(1)];                   %Par�metro a

%% Construcci�n del robot
N = 2;                          %Cantidad de Joints
linksCell = cell(1,N);
for i=1:N
    linksCell{i} = Link('revolute','modified','d', 0, 'a', a(i), 'alpha', 0,...
    'm', m(i), 'r', r{i}, 'I', I{i}, 'B', 1); %Agregar los links uno a uno
end

%Definici�n final del robot, el nombre es un honor a un gran profesor.
Robot = SerialLink([linksCell{:}],'tool',transl(L(1),0,0),'name','Janiel Dacoby');

%% Testbench: solo a modo de prueba para verificar construcci�n
%q0=[-pi/2 pi];                  %Posici�n inicial de los joints
%figure()
%Robot.teach(q0)