% Beta value for variable h
function b = bh(v) 
    b=1/(1+exp(-(0.1)*(v+30)));
end