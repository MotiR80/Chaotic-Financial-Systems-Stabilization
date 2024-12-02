clc; clear;

syms w1 w2 w3 n1 n2 n3 wdot1 wdot2 wdot3 y
wdot1 = (w2 - n1)*w1 + w3;
wdot2 = 1 - n2*w2 - w1^2;
wdot3 = -n3*w3 - w1;

we1 = [0, 1/n2, 0];
we2 = [sqrt(1-n1*n2-n2/n3), n1+1/n3, -1/n3*sqrt(1-n1*n2-n2/n3)];
we3 = [-sqrt(1-n1*n2-n2/n3), n1+1/n3, 1/n3*sqrt(1-n1*n2-n2/n3)];


J = jacobian([wdot1, wdot2, wdot3], [w1, w2, w3]);
[V, E] = eig(J);

% fp1 = vpa(simplify(subs(we1, [n1 n2 n3], [.9, .2, 1.2])));
% fp2 = vpa(simplify(subs(we2, [n1 n2 n3], [.9, .2, 1.2])));
% fp3 = vpa(simplify(subs(we3, [n1 n2 n3], [.9, .2, 1.2])));

J_S1 = simplify(subs(J, [[w1 w2 w3]], we1));
% j = vpa(simplify(subs(E, [n1 n2 n3 [w1 w2 w3]], [.9, .2, 1.2, fp1])));
J_S1_y = J_S1 - eye(3)*y;
det_S1 = simplify(subs(det(J_S1_y)));
ans2 = (n2*y^2 + n1*n2*y + n2*n3*y - y + n1*n2*n3 + n2 - n3)/n2;
collect(expand(ans2), y);


