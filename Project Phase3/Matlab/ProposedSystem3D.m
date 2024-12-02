function dwdt = ProposedSystem3D(t, w, y, a, B, p, sigma)
    A(1) = .3*sin(.5*pi/6*t);
    A(2) = .3*sin(.5*pi/6*t);
    A(3) = .3*sin(.5*pi/6*t);
    
    n(1) = .9-.2*cos(5*t);
    n(2) = .2-.2*cos(5*t);
    n(3) = 1.2-.2*cos(5*t);
    
    psi(1) = exp(-sigma*abs(w(1)));
    psi(2) = exp(-sigma*abs(w(2)));
    psi(3) = exp(-sigma*abs(w(3)));
    O(1) = diag(y(1)*psi(1)+B(1));
    O(2) = diag(y(2)*psi(2)+B(2));
    O(3) = diag(y(3)*psi(3)+B(3));
    u(1) = -a(1)*psi(1)*w(1)-(O(1)+p(1))*sign(w(1));
    u(2) = -a(2)*psi(2)*w(2)-(O(2)+p(2))*sign(w(2))-1;
    u(3) = -a(3)*psi(3)*w(3)-(O(3)+p(3))*sign(w(3));
    wdot(1) = (w(2)-n(1))*w(1)+w(3)+A(1)+u(1);
    wdot(2) = 1-n(2)*w(2)-w(1)^2+A(2)+u(2);
    wdot(3) = -n(3)*w(3)-w(1)+A(3)+u(3);
    dwdt = [wdot(1); wdot(2); wdot(3)];
end