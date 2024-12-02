function basin_of_attraction1
    eta2_range = linspace(0.2, 5, 100); % Adjust the resolution as needed
    eta3_range = linspace(1.5, 30, 100); % Adjust the resolution as needed
    eta1 = 5; 

    figure;
    hold on;
    plot(NaN, NaN, 'r.', 'MarkerSize', 10); % Red dot for we1
    plot(NaN, NaN, 'g.', 'MarkerSize', 10); % Green dot for we2
    plot(NaN, NaN, 'b.', 'MarkerSize', 10); % Blue dot for we3


    for i = 1:length(eta2_range)
        for j = 1:length(eta3_range)
            eta2 = eta2_range(i);
            eta3 = eta3_range(j);

            we1 = [0, 1/eta2, 0];
            we2 = [sqrt(1 - eta1*eta2 - eta2/eta3), (eta1 + 1/eta3), (-1/eta3)*sqrt(1 - eta1*eta2 - eta2/eta3)];
            we3 = [-sqrt(1 - eta1*eta2 - eta2/eta3), (eta1 + 1/eta3), (1/eta3)*sqrt(1 - eta1*eta2 - eta2/eta3)];

            ic = [-0.5, 1.5, 1]; % Example initial condition

            [t, y] = ode45(@(t, y) dynamicSystem(t, y, eta1, eta2, eta3), [0, 5], ic);

            % Check the last value to determine the attraction point
            % Compare the end point to the fixed points
            [~, closest_point] = min([norm(y(end,:) - we1), norm(y(end,:) - we2), norm(y(end,:) - we3)]);

            if closest_point == 1
                plot(eta2, eta3, 'r.', 'MarkerSize', 10); % Red dot for we1
            elseif closest_point == 2
                plot(eta2, eta3, 'g.', 'MarkerSize', 10); % Green dot for we2
            elseif closest_point == 3
                plot(eta2, eta3, 'b.', 'MarkerSize', 10); % Blue dot for we3
            end
        end
    end

    xlabel('\eta_2');
    ylabel('\eta_3');
    title('Basin of Attraction');
    legend('Attract to we1', 'Attract to we2', 'Attract to we3');
    title(sprintf('eta1=%.2f', eta1  ));
     ylim([1.5 30]); 
     xlim([0.2 5]);

    hold off;
end

