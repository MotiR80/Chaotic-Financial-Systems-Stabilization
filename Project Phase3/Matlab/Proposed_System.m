clc
clear
close all

w0(1) = -.5;
w0(2) = 1.5;
w0(3) = 1;


sigma = 0.01;
p(1) = .3;
p(2) = .3;
p(3) = .3;

y(1) = .5;
y(2) = .5;
y(3) = .5;
a(1) = .5;
a(2) = .5;
a(3) = .5;
B(1) = .5;
B(2) = .5;
B(3) = .5;

IC = [w0(1), w0(2), w0(3)];
Time=[0 .9];
[t,W] = ode45(@(t,W)ProposedSystem3D(t,W, y, a, B, p, sigma),Time,IC);
figure(1)
p1 = plot(t,W(:,1), 'g--', 'DisplayName','W1', 'Linewidth', 1.5)
hold on
p2 = plot(t,W(:,2), 'k--', 'DisplayName','W2', 'Linewidth', 1.5)
hold on
p3 = plot(t,W(:,3), 'r', 'DisplayName','W3', 'Linewidth', 1.5)
xlabel('Time')
ylabel('W(t)')
legend([p1, p2, p3])
grid on

