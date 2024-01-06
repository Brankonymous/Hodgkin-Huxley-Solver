function [ES] = exact_solution(plotFlag)
    [Cm, dt, t, I, ENa, EK, El, gbarNa, gbarK, gbarl, V, m, n, h] = constants(true);
    
    for i=1:length(t)-1
        V(i+1)=(1/gbarl)*(-exp(-(gbarl/Cm)*t(i))*(I+60*gbarl+gbarl*El)+I+gbarl*El);
    end

    ES = V;
    
    if plotFlag
        figure(1);
        plot(t,V);
        legend('Exact Solution');
        xlabel('Time (ms)');
        ylabel('Voltage (mV)');
        title('Voltage Change for Hodgkin-Huxley Model');
    end
end
