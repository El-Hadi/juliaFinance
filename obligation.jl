

# calcul du prix d'une obligation

# c coupon
# M montant de l'enprunt obligataire
# t maturité
# i taux actuariel

function prixObligation(c,M,t,i)
  temps=[0.5:0.5:t]
  cf=c*ones(length(temps))
  cf[end]=cf[end]+M
  prix=sum(cf./(1+i).^temps)

  return prix
end



