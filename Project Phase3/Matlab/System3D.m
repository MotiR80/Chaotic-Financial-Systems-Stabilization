function dwdt = System3D(t, W, N)
    w(1) = W(1);
    w(2) = W(2);
    w(3) = W(3);
    n(1) = W(1);
    n(2) = W(2);
    n(3) = W(3);
    wdot(1) = (w(2) - n(1))*w(1) + w(3);
    wdot(2) = 1 - n(2)*w(2) - w(1)^2;
    wdot(3) = -n(3)*w(3) - w(1);
    dwdt = [wdot(1); wdot(2); wdot(3)];
end