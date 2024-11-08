% Grafico todas las trayectorias en 3D
%% Grafico de XYZ
tiledlayout(2,2)
nexttile
pos_z = zeros(length(pos.Data(:,1)));
plot3(pos.Data(:,1)', pos.Data(:,2)', pos_z');
xlabel('Eje X [m]') 
ylabel('Eje Y [m]')
zlabel('Eje Z [m]') 
hold on
pos_z_real = zeros(length(out.X_real.Data(:,1)));
plot3(out.X_real.Data(:,1)', out.Y_real.Data(:,1)', pos_z_real');
axis([0.5 1.5 -1 1 -1 1])
title('Trayectoria Deseada vs. Real');
legend('X_{d}','Y_{d}','Z_{d}', 'X_{real}','Y_{real}','Z_{real}');
grid on;
hold off

% Para graficar cada trayectoria particular

nexttile
plot(pos.Data(:,1)',pos.Data(:,2)');                %Grafico XY
xlabel('Eje X [m]') 
ylabel('Eje Y [m]')
hold on
plot(out.X_real.Data(:,1)', out.Y_real.Data(:,1)'); %Grafico XY_REAL
legend('XY_{deseado}', 'XY_{real}');
axis([0 2 -1 1])
title('Plano XY: Deseada vs. Real');
grid on;
hold off

nexttile
plot(pos.Time',pos.Data(:,1)');
xlabel('Tiempo [seg]') 
ylabel('Eje X [m]')
hold on
plot(out.X_real.Time', out.X_real.Data(:,1)');
axis([0 t_final 0.7 1.3])
title('Eje X: Deseada vs. Real');
legend('X_{d}','X_{real}');
grid on;
hold off

nexttile
plot(pos.Time',pos.Data(:,2)');
xlabel('Tiempo [seg]') 
ylabel('Eje Y [m]')
hold on
plot(out.Y_real.Time', out.Y_real.Data(:,1)');
title('Eje Y: Deseada vs. Real');
legend('Y_{d}','Y_{real}');
grid on;
hold off

%% Gráfico de espacio Joint

figure
plot(q_traj);
xlabel('Tiempo [seg]');
ylabel('$\theta_{1}, \theta_{2} [rad]$','interpreter','latex');
hold on
plot(out.Q_joints);
title('Espacio de Joints');
legend('\theta_{1_{d}}', '\theta_{2_{d}}','\theta_{1_{real}}', '\theta_{2_{real}}');
grid on;
hold off