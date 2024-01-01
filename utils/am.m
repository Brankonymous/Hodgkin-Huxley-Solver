% Alpha for Variable m
function a=am(v) 
    a=0.1*(v+35)/(1-exp(-(v+35)/10));
end