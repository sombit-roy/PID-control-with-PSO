% Define the details of the problem
nVar = 3; 
ub = [0.5 0.15 0.15];
lb = [0.01 0.0001 0.0001];

% Define the PSO paramters 
noP = 10;
maxIter = 20;
wMax = 0.9;
wMin = 0.2;
c1 = 1.495;
c2 = 1.495;

% The PSO algorithm 

% Initialize the particles 
for k = 1 : noP
        
    Swarm.Particles(k).X = (ub-lb) .* rand(1,nVar) + lb; 
    Swarm.Particles(k).V = zeros(1, nVar); 
    Swarm.Particles(k).PBEST.X = zeros(1,nVar); 
    Swarm.Particles(k).PBEST.O = inf; 
    Swarm.GBEST.X = zeros(1,nVar);
    Swarm.GBEST.O = inf;
    
end

% Main loop
for t = 1 : maxIter
    
    % Calcualte the objective value
    for k = 1 : noP
        
        currentX = Swarm.Particles(k).X;
        open('testsim.slx')
        sim('testsim.slx')
        Swarm.Particles(k).O = ITAE.Data(length(ITAE.Data));
        
        % Update the particle best
        if Swarm.Particles(k).O < Swarm.Particles(k).PBEST.O 
            Swarm.Particles(k).PBEST.X = currentX;
            Swarm.Particles(k).PBEST.O = Swarm.Particles(k).O;
        end
        
        % Update the global best
        if Swarm.Particles(k).O < Swarm.GBEST.O
            Swarm.GBEST.X = currentX;
            Swarm.GBEST.O = Swarm.Particles(k).O;
        end
    end
    
    % Non-linear weight update 
    w = 1 - ( wMax*exp(-(t-1)/maxIter) + 0.25*wMin*log(t) - abs((maxIter-t)/(2*maxIter)) );
    
    % Crossover
    cross = ceil(rand*10);     
    Swarm.Particles(cross).X = 0.5*Swarm.Particles(cross).X + 0.5*Swarm.Particles(cross).PBEST.X;
    Swarm.Particles(cross).PBEST.X = 0.5*Swarm.Particles(cross).X + 0.5*Swarm.Particles(cross).PBEST.X;
    
    % Update the X and V vectors
    for k = 1 : noP
        
        if k ~= cross
            Swarm.Particles(k).V = w .* Swarm.Particles(k).V + c1 .* rand(1,nVar) .* (Swarm.Particles(k).PBEST.X - Swarm.Particles(k).X) + c2 .* rand(1,nVar) .* (Swarm.GBEST.X - Swarm.Particles(k).X);
            Swarm.Particles(k).X = Swarm.Particles(k).X + Swarm.Particles(k).V;
        
            % Check position limits
            index1 = find(Swarm.Particles(k).X > ub);
            index2 = find(Swarm.Particles(k).X < lb);
            Swarm.Particles(k).X(index1) = ub(index1);
            Swarm.Particles(k).X(index2) = lb(index2);
        end
        
    end
    
    fitness(t) = Swarm.GBEST.O;
    Kp(t) = Swarm.GBEST.X(1);
    Ki(t) = Swarm.GBEST.X(2);
    Kd(t) = Swarm.GBEST.X(3);
    op(t) = y;

end