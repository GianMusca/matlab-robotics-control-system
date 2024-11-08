%% init_control_cartesiano.m
%
%     En este archivo se define la funci�n que crear� las variables con las
%     que se trabajar� durante la demo
%     A saber:
%       -Robot: robot con las configuraciones necesarias cargadas.
%       -Variables del control PD.
%       -[pos, vel, acc]: Posici�n, Velocidad y Aceleraci�n generadas a
%       partir de la trayectoria deseada. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

init_robot;                 %Llama al robot que se usar� durante la demo

RobotPlanta = Robot.links;    %Asignacion de planta sin perturbaci�n
Robot = Robot.perturb(0.8);          %con perturbaci�n

T0=transl(1.9,0.1,0);   % Cerca de la pared
q0 = Robot.ikine(T0,'q0', [0 0], 'mask', [1, 1, 0, 0, 0, 0]);    %Posicion joint inicial

%% Ganancias del sistema de control, se toma criticamente amortiguado
freq = 5;                    %Freq = 5Hz genera una respuesta suficientemente r�pida
Kp = (2*pi*freq)^2*eye(2);
Kv = 2*sqrt(Kp)*eye(2);

%% Obtenci�n de trayectorias
t_final = 5;                %Le daremos al robot 5seg para llegar hasta el destino
pos_inicial = [1.9, 0.1, 0];       %Cargamos la posici�n de destino
pos_final = [0.1, 1.9, 0];       %Cargamos la posici�n de destino
t_muestreo = 4e-2;          %Tiempo de muestreo

[pos,vel,acc] = generate_trajectory(pos_inicial,pos_final,t_final,t_muestreo);

%% Ganancias fuerza
Kpf = 5000*eye(2);
Kvf = 2*sqrt(Kpf)*eye(2);

%% Rigidez de la pared y fuerza deseada
Ke = 1000; 
fd=10/sqrt(2)*[1 1];