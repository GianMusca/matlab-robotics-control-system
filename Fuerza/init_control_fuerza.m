%% init_control_fuerza.m
%
%     En este archivo se define la funci�n que crear� las variables con las
%     que se trabajar� durante la demo
%     A saber:
%       -Robot: robot con las configuraciones necesarias cargadas.
%       -Variables del control PD.
%       -Constantes del problema Ke (Rigidez) y Fd (Fuerza deseada)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Inicilaiza Robot
init_robot;                 %Llama al robot que se usar� durante la demo

RobotPlanta = Robot.links;    %Asignacion de planta sin perturbaci�n
Robot = Robot.perturb(0.8);          %con perturbaci�n

T0=transl(1.9,0.1,0);   % Cerca de la pared
q0 = Robot.ikine(T0,'q0', [0 0], 'mask', [1, 1, 0, 0, 0, 0]);    %Posicion joint inicial
%q0=[0 0];

%% Ganancias del sistema de control, se toma criticamente amortiguado
freq = 10                    %Freq = 5Hz genera una respuesta suficientemente r�pida
Kpf = (2*pi*freq)^2;
Kvf = 2*sqrt(Kpf);

%% Rigidez de la pared y fuerza deseada
Ke = 1000; 
fd=10/sqrt(2)*[1 1];