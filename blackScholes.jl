using Distributions


#princing d'un call par la formule de black et scholes


function blackScholesCall(S0,k,r,σ,t)
  d1=(log(S0/k)+(r+(σ^2)/2)*t)/(σ*sqrt(t))
  d2=d1-σ*sqrt(t)

 return S0*cdf(Normal(),d1)-k*exp(-r*t)*cdf(Normal(),d2)




end

#princing d'un put par la formule de black et scholes
function blackScholesPut(S0,k,r,σ,t)

   d1=(log(S0/k)+(r+(σ^2)/2)*t)/(σ*sqrt(t))
   d2=d1-σ*sqrt(t)

 return -S0*cdf(Normal(),-d1)+k*exp(-r*t)*cdf(Normal(),-d2)

end


#delta d'un call
function deltaCall(S0,k,r,σ,t)
    d1=(log(S0/k)+(r+(σ^2)/2)*t)/(σ*sqrt(t))
    return cdf(Normal(),d1)

end
