clc
clear
close all

w0(1) = 0;
w0(2) = .81;
w0(3) = .01;
n(1) = .5;
n(2) = 1.25;
n(3) = .3;


% IC = [w0(1), w0(2), w0(3)];
N = [n(1), n(2), n(3)];
% Time=[0 1];
% opts = odeset('RelTol', 1e-8, 'AbsTol', 1e-10);
% [t,y] = ode45(@(t,X)System3D(t,X,N),Time,IC, opts);
% figure(1)
for w3= -.1:.01:.1
    for w1=.79:.01:.81
        for w2=-.1:.01:.1
    IC=[w3;w1; w2];
    Time=[0 1.5];
    opts = odeset('RelTol', 1e-8, 'AbsTol', 1e-10);
    [t,y] = ode45(@(t,X)System3D(t,X,N),Time,IC, opts);
    figure(2)
    hold on
    plot(y(:,2),y(:,3))
    hold on
    plot(y(1,2),y(1,3),'*r')
    hold on
    plot(y(end,2),y(end,3),'Ob')
    xlabel('x')
    ylabel('y')
        end
    end
end
% p1 = plot(t,y(:,1), 'g--', 'DisplayName','W1', 'Linewidth', 1.5)
% hold on
% p2 = plot(t,y(:,2), 'k--', 'DisplayName','W2', 'Linewidth', 1.5)
% hold on
% p3 = plot(t,y(:,3), 'r', 'DisplayName','W3', 'Linewidth', 1.5)
% xlabel('Time')
% ylabel('W(t)')
% legend([p1, p2, p3])
% xlim([0 10])
% ylim([-4 5])
% grid on
% figure(2)
% plot(y(:,2),y(:,3))

