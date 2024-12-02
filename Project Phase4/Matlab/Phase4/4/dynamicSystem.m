% Define the system of ODEs as a function
function dy = dynamicSystem(t, y, eta1, eta2, eta3)
    dy = zeros(3,1); % a column vector
    dy(1) = (y(2) - eta1) * y(1) + y(3);
    dy(2) = 1 - eta2 * y(2) - y(1)^2;
    dy(3) = -eta3 * y(3) - y(1);
end


