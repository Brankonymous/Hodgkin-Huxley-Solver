% Alpha for variable n
function a=an(v)
    a=0.01*(v+50)/(1-exp(-(v+50)/10));
end