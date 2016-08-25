#python scripts/graphing/graph_msmc.py -l Within_Morocco,Within_Iberia,Within_Worldwide,Between_Morocco_Regions,Between_Morocco_and_Iberia,Between_Morocco_and_Worldwide,Between_Iberian_Groups -f data/w_m.txt,data/w_i.txt,data/w_w.txt,data/b_m_r.txt,data/b_m_i.txt,data/b_m_w.txt,data/b_i_g.txt -o msmc.pdf
#python scripts/graphing/graph_msmc.py -l Within_Morocco,Within_Iberia,Within_Worldwide,Between_Morocco_Regions,Between_Morocco_and_Iberia,Between_Morocco_and_Worldwide,Between_Iberian_Groups -f data/w_m.txt,data/w_i.txt,data/w_w.txt,data/b_m_r.txt,data/b_m_i.txt,data/b_m_w.txt,data/b_i_g.txt -o msmc.means.pdf -m

#python scripts/graphing/graph_msmc.py -l Within_Morocco,Within_Iberia,Within_Worldwide,Between_Morocco_Regions,Between_Morocco_and_Iberia,Between_Morocco_and_Worldwide,Between_Relict_Iberia -f data/w_m.txt,data/w_i.txt,data/w_w.txt,data/b_m_r.txt,data/b_m_i.txt,data/b_m_w.txt,data/b_r_i.txt -o msmc.relict -m

#python scripts/graphing/graph_msmc.py -l Within_Morocco,Within_Iberia,Within_Worldwide -f data/w_m.txt,data/w_i.txt,data/w_w.txt -o msmc.within -m

#python scripts/graphing/graph_msmc.py -l Within_Morocco,Within_Iberia,Within_Worldwide -f data/w_m.txt,data/within_iberia2.txt,data/within_worldwide2.txt -o plots/msmc.within.fixed -m

#python scripts/graphing/graph_msmc.py -l Within_Morocco,Within_Iberia,Within_Worldwide -f data/w_m.txt,data/within_iberia_no_rel.txt,data/within_worldwide2.txt -o plots/msmc.within.no.rel.median -m

#python scripts/graphing/graph_msmc.py -l Morocco,Iberia,Central_Asia,Western_Europe -f data/w_m.txt,data/within_iberia2.txt,data/central_asia.txt,data/w_europe.txt -o plots/msmc.main -m 

#python scripts/graphing/graph_msmc.py -l Morocco,Iberia,Central_Asia,Western_Europe -f data/w_m.txt,data/within_iberia_no_rel.txt,data/central_asia.txt,data/w_europe.txt -o plots/msmc.stddev.supp -m


#python scripts/graphing/graph_msmc.py -l Morocco,Iberia,Central_Asia,Western_Europe,Central_Europe,North_Sweden,South_Sweden,Italy_Balkans_Caucasus,Germany,Iberian_Relict -f data/w_m.txt,data/within_iberia2.txt,data/central_asia.txt,data/w_europe.txt,data/central_europe.txt,data/n_sweden.txt,data/s_sweden.txt,data/caucasus.txt,data/germany.txt,data/iberian_relict.txt -o plots/msmc.stddev.supp.all -m


# Qar and Etna plot
#python scripts/graphing/graph_msmc.py -l Morocco,Mor-Tanz,Morocco-Qar,Morocco-Etna,Qar-Etna -f data/w_m.txt,data/tanz_morocco.txt,data/qar.txt,data/etna.txt,data/qar-etna.txt -o plots/qar.etna

# plot new samples! Tanz and Plateres
#python scripts/graphing/graph_msmc.py -l Morocco,Iberia,Central_Asia,Western_Europe,Tanzania,Plat-Qar -f data/w_m.txt,data/within_iberia2.txt,data/central_asia.txt,data/w_europe.txt,data/tanz.txt,data/qar_plateres.txt -o plots/msmc.main2 -m     

# Africa, Eurasia, Ib Relict
python scripts/graphing/graph_msmc.py -l Africa,Eurasia,Iberian_Relict -f data/africa.txt,data/eurasia.txt,data/iberian_relict.txt -o plots/msmc.supp.1.5 -m

# South Africa included!
#python scripts/graphing/graph_msmc.py -l Africa,South_Africa,Tanzania,Eurasia,Levant,Iberian_Relict -f data/africa.txt,data/w_sah.txt,data/w_tanzh.txt,data/eurasia.txt,data/qar_plateres.txt,data/iberian_relict.txt -o plots/msmc.main4 -m

# Africa, Eurasia, Ib Relict                                                                                                                                                                         
#python scripts/graphing/graph_msmc.py -l Africa,Eurasia,Iberian_Relict -f data/africa.txt,data/eurasia.txt,data/iberian_relict.txt -o plots/msmc.3lines -m
