#!/bin/python
import sys
import itertools

OUT_DIR="data"

#SAMPLES removed:
# 22012 - contaminated oua
# 37473 - Meh4 not sequenced
# 37467 - Elk5 not sequenced
# 37469 - Elk20 not sequenced
# 37471 - Elk3 not sequenced
# 37457 - Ket12 not sequenced
# 37470 - Bab0 not sequenced


#sample lists
r = [18515,35614,22007,21999,35512,35617,22008]
nma = [22011,22005,22001,18509,22000,35620,35624,35521,35522,35593,35603,35609,35612]
sma = [22006,22004,22002,18514,18512,18510,35513,35594,35599,35600,35625,35622,35607,35608,35610,35611,35615,35618,35619,35621,35605,35623]
ha = [22010,22009,22003,18516,18511,18513,35523,35598,35595,35596,35601,35602,35604,35606,35613,35616]
tanz = [35520, 211399]
qar = [9764]
etna = [9762]
b = [350,8337,9517,9585,9826,9827,9847,9925,9935,9941]
p = [9510,9518,9522,9547,9556,9593,9841,9850,9873,9899]
rel = [9549,9550,9555,9574,9583,9598,9600,9837,9944,9947]
w=[9523,9762,9764,9830,9890,9892,9894,9906,9993,7014,7094,7287,9442,1254,6968,8351,9321,7183,768,772,9128,7013,7354,9402,9416,7077,9725,9726,9759,9991,7025,7067,9727,9761,6911,7063]

# --- making the within lists ---
r = r
nma = nma
sma = sma
ha = ha
blue_not_iberia = [350,8337,9925,9935]
blue_iberia_only = [9517,9585,9826,9827,9847]
pink_iberia_only = [9510,9518,9522,9547,9556,9593,9841,9850,9873,9899]
rel = rel
light_blue = [7094,7287,9442,7014]
orange = [6968,1254,8351,9321]
purple = [9128,7183,768,772]
red = [7013,7354,9402,9416]
white = [9991,9725,9726,9759,7077]
yellow = [9727,7025,7067,9761]
cau=[9656,9078,9106,9111,9708,9700,9712,9705,9704,9070,9091,9079,9651,9757,9749]
sah=["AH0001","AH0002","AH0003","AH0004","AH0006"]
tanzh=["AH0007","AH0008","AH0009"]
alg=["AH00011"]
# --- end within lists ---

def w_m():
    final_list = []
    out = open(OUT_DIR+"/w_m.txt", "w")
    for region in [r, nma, sma, ha]:
        for i in itertools.combinations(region, 2):
            final_list.append(str(i[0])+"x"+str(i[1]))
    for comp in final_list:
        out.write(comp+"\n")

def w_i():
    final_list = []
    out = open(OUT_DIR+"/w_i.txt", "w")
    for region in [b, p, rel]:
        for i in itertools.combinations(region, 2):
            final_list.append(str(i[0])+"x"+str(i[1]))
    for comp in final_list:
        out.write(comp+"\n")

def w_w():
    final_list = []
    out = open(OUT_DIR+"/w_w.txt", "w")
    for region in [w]:
        for i in itertools.combinations(region, 2):
            final_list.append(str(i[0])+"x"+str(i[1]))
    for comp in final_list:
        out.write(comp+"\n")

def w_sah():
    final_list = []
    out = open(OUT_DIR+"/w_sah.txt", "w")
    for region in [sah]:
        for i in itertools.combinations(region, 2):
            final_list.append(str(i[0])+"x"+str(i[1]))
    for comp in final_list:
        out.write(comp+"\n")

def w_tanzh():
    final_list = []
    out = open(OUT_DIR+"/w_tanzh.txt", "w")
    for region in [tanzh+tanz]:
        for i in itertools.combinations(region, 2):
            final_list.append(str(i[0])+"x"+str(i[1]))
    for comp in final_list:
        out.write(comp+"\n")


def b_m_r():
    final_list = []
#    out = open(OUT_DIR+"/b_m_r.txt", "w")
    out = open(OUT_DIR+"/tanz_morocco.txt", "w")
#    for i in itertools.product(r,nma):
#        final_list.append(str(i[0])+"x"+str(i[1]))        
#    for i in itertools.product(r,sma):
#        final_list.append(str(i[0])+"x"+str(i[1]))
#    for i in itertools.product(r,ha):
#        final_list.append(str(i[0])+"x"+str(i[1]))
#    for i in itertools.product(nma,sma):
#        final_list.append(str(i[0])+"x"+str(i[1]))
#    for i in itertools.product(nma,ha):
#        final_list.append(str(i[0])+"x"+str(i[1]))
#    for i in itertools.product(sma,ha):
#        final_list.append(str(i[0])+"x"+str(i[1]))
    for i in itertools.product(tanz,r):
        final_list.append(str(i[0])+"x"+str(i[1]))
    for i in itertools.product(tanz,nma):
        final_list.append(str(i[0])+"x"+str(i[1]))
    for i in itertools.product(tanz,sma):
        final_list.append(str(i[0])+"x"+str(i[1]))
    for i in itertools.product(tanz,ha):
        final_list.append(str(i[0])+"x"+str(i[1]))
    for comp in final_list:
        out.write(str(comp)+"\n")

def b_i_g():
    final_list = []
    out = open(OUT_DIR+"/b_i_g.txt", "w")
    for i in itertools.product(b,p):
        final_list.append(str(i[0])+"x"+str(i[1]))
    for i in itertools.product(b,rel):
        final_list.append(str(i[0])+"x"+str(i[1]))
    for i in itertools.product(p,rel):
        final_list.append(str(i[0])+"x"+str(i[1]))
    for comp in final_list:
        out.write(str(comp)+"\n")

def between_relict_iberians():
    final_list = []
    out = open(OUT_DIR+"/b_r_i.txt", "w")
    for i in itertools.product(b,rel):
        final_list.append(str(i[0])+"x"+str(i[1]))
    for i in itertools.product(p,rel):
        final_list.append(str(i[0])+"x"+str(i[1]))
    for comp in final_list:
        out.write(str(comp)+"\n")

def b_m_i():
    final_list = []
    out = open(OUT_DIR+"/b_m_i.txt", "w")
    for i in itertools.product(r,b):
        final_list.append(str(i[0])+"x"+str(i[1]))
    for i in itertools.product(r,p):
        final_list.append(str(i[0])+"x"+str(i[1]))
    for i in itertools.product(r,rel):
        final_list.append(str(i[0])+"x"+str(i[1]))
    for i in itertools.product(nma,b):
        final_list.append(str(i[0])+"x"+str(i[1]))
    for i in itertools.product(nma,p):
        final_list.append(str(i[0])+"x"+str(i[1]))
    for i in itertools.product(nma,rel):
        final_list.append(str(i[0])+"x"+str(i[1]))
    for i in itertools.product(sma,b):
        final_list.append(str(i[0])+"x"+str(i[1]))
    for i in itertools.product(sma,p):
        final_list.append(str(i[0])+"x"+str(i[1]))
    for i in itertools.product(sma,rel):
        final_list.append(str(i[0])+"x"+str(i[1]))
    for i in itertools.product(ha,b):
        final_list.append(str(i[0])+"x"+str(i[1]))
    for i in itertools.product(ha,p):
        final_list.append(str(i[0])+"x"+str(i[1]))
    for i in itertools.product(ha,rel):
        final_list.append(str(i[0])+"x"+str(i[1]))
    for comp in final_list:
        out.write(str(comp)+"\n")

def b_m_w():
    final_list = []
    out = open(OUT_DIR+"/b_m_w.txt", "w")
    for i in itertools.product(r,w):
        final_list.append(str(i[0])+"x"+str(i[1]))
    for i in itertools.product(nma,w):
        final_list.append(str(i[0])+"x"+str(i[1]))
    for i in itertools.product(sma,w):
        final_list.append(str(i[0])+"x"+str(i[1]))
    for i in itertools.product(ha,w):
        final_list.append(str(i[0])+"x"+str(i[1]))
    for comp in final_list:
        out.write(str(comp)+"\n")

def sample_list():
    out = open(OUT_DIR+"/all_samples.txt", "w")
    all = r+nma+sma+ha+b+p+rel+w
    for sample in all:
        out.write(str(sample)+"\n")

def missing_within():
    final_list = []
    out = open(OUT_DIR+"/7025.7354.772.w_w.txt", "w")
    w2=["7025","7354","772"]
    all = r+nma+sma+ha+b+p+rel+w
    print(len(all))
    for region in [all]:
        for i in itertools.combinations(region, 2):
            final_list.append(str(i[0])+"x"+str(i[1]))
    for comp in final_list:
        if w2[0] in comp or w2[1] in comp or w2[2] in comp:
            out.write(comp+"\n")

def redo_9550():
    final_list = []
    out = open(OUT_DIR+"/9550.txt", "w")
    w2=["9550"]
    all = r+nma+sma+ha+b+p+rel+w
    print(len(all))
    for region in [all]:
        for i in itertools.combinations(region, 2):
            final_list.append(str(i[0])+"x"+str(i[1]))
    for comp in final_list:
        if w2[0] in comp:
            out.write(comp+"\n")

def within_worldwide():
    # redo worldwide so that cross group comparisons aren't made
    final_list = []
    out = open(OUT_DIR+"/within_worldwide2.txt", "w")
    for region in [light_blue,orange,purple,red,white,yellow]:
        for i in itertools.combinations(region, 2):
            final_list.append(str(i[0])+"x"+str(i[1]))
    for comp in final_list:
        out.write(comp+"\n")

def within_iberia():
    # redo Iberia to remove individuals not from Spain
    final_list = []
    out = open(OUT_DIR+"/within_iberia2.txt", "w")
    for region in [blue_iberia_only,pink_iberia_only,rel]:
        for i in itertools.combinations(region, 2):
            final_list.append(str(i[0])+"x"+str(i[1]))
    for comp in final_list:
        out.write(comp+"\n")

def within_iberia_no_rel():
    # redo Iberia to remove individuals not from Spain                                                                                                                                                             
    final_list = []
    out = open(OUT_DIR+"/within_iberia_no_rel.txt", "w")
    for region in [blue_iberia_only,pink_iberia_only]:
        for i in itertools.combinations(region, 2):
            final_list.append(str(i[0])+"x"+str(i[1]))
    for comp in final_list:
        out.write(comp+"\n")

def cvi_can():
    final_list = []
    out = open(OUT_DIR+"/cvi_can.txt", "w")
    w2=["6911", "7063"]
    all = r+nma+sma+ha+b+p+rel+w
    print(len(all))
    for region in [all]:
        for i in itertools.combinations(region, 2):
            final_list.append(str(i[0])+"x"+str(i[1]))
    for comp in final_list:
        if w2[0] in comp:
            out.write(comp+"\n")

def within_cen_asia():
    final_list = []
    out = open(OUT_DIR+"/central_asia.txt", "w")
    for region in [purple]:
        for i in itertools.combinations(region, 2):
            final_list.append(str(i[0])+"x"+str(i[1]))
    for comp in final_list:
        out.write(comp+"\n")

def within_w_europe():
    final_list = []
    out = open(OUT_DIR+"/w_europe.txt", "w")
    for region in [blue_not_iberia]:
        for i in itertools.combinations(region, 2):
            final_list.append(str(i[0])+"x"+str(i[1]))
    for comp in final_list:
        out.write(comp+"\n")

def cen_europe():
    final_list = []
    out = open(OUT_DIR+"/central_europe.txt", "w")
    for region in [yellow]:
        for i in itertools.combinations(region, 2):
            final_list.append(str(i[0])+"x"+str(i[1]))
    for comp in final_list:
        out.write(comp+"\n")

def n_sweden():
    final_list = []
    out = open(OUT_DIR+"/n_sweden.txt", "w")
    for region in [orange]:
        for i in itertools.combinations(region, 2):
            final_list.append(str(i[0])+"x"+str(i[1]))
    for comp in final_list:
        out.write(comp+"\n")

def s_sweden():
    final_list = []
    out = open(OUT_DIR+"/s_sweden.txt", "w")
    for region in [red]:
        for i in itertools.combinations(region, 2):
            final_list.append(str(i[0])+"x"+str(i[1]))
    for comp in final_list:
        out.write(comp+"\n")

def ibc():
    final_list = []
    out = open(OUT_DIR+"/ibc.txt", "w")
    for region in [white]:
        for i in itertools.combinations(region, 2):
            final_list.append(str(i[0])+"x"+str(i[1]))
    for comp in final_list:
        out.write(comp+"\n")

def germany():
    final_list = []
    out = open(OUT_DIR+"/germany.txt", "w")
    for region in [light_blue]:
        for i in itertools.combinations(region, 2):
            final_list.append(str(i[0])+"x"+str(i[1]))
    for comp in final_list:
        out.write(comp+"\n")

def qar():
    qar=[9764]
    final_list = []
    out = open(OUT_DIR+"/qar.txt", "w")
    for i in itertools.product(ha,tanz):
        final_list.append(str(i[0])+"x"+str(i[1]))
    for i in itertools.product(nma,qar):
        final_list.append(str(i[0])+"x"+str(i[1]))
    for i in itertools.product(sma,qar):
        final_list.append(str(i[0])+"x"+str(i[1]))
    for i in itertools.product(r,qar):
        final_list.append(str(i[0])+"x"+str(i[1]))
    for i in itertools.product(tanz,qar):
        final_list.append(str(i[0])+"x"+str(i[1]))
    for comp in final_list:
        out.write(str(comp)+"\n")

def etna():
    etna=[9762]
    final_list = []
    out = open(OUT_DIR+"/etna.txt", "w")
    for i in itertools.product(ha,etna):
        final_list.append(str(i[0])+"x"+str(i[1]))
    for i in itertools.product(nma,etna):
        final_list.append(str(i[0])+"x"+str(i[1]))
    for i in itertools.product(sma,etna):
        final_list.append(str(i[0])+"x"+str(i[1]))
    for i in itertools.product(r,etna):
        final_list.append(str(i[0])+"x"+str(i[1]))
    for i in itertools.product(tanz,etna):
        final_list.append(str(i[0])+"x"+str(i[1]))
    for comp in final_list:
        out.write(str(comp)+"\n")

def caucasus_all():
    final_list = []
    out = open(OUT_DIR+"/caucasus.txt", "w")
    for region in [cau]:
        for i in itertools.combinations(region, 2):
            final_list.append(str(i[0])+"x"+str(i[1]))
    for comp in final_list:
        out.write(comp+"\n")

def ib_rel():
    # redo Iberia to remove individuals not from Spain                                                                                                                                                                                                                                                                                    
    final_list = []
    out = open(OUT_DIR+"/iberian_relict.txt", "w")
    for region in [rel]:
        for i in itertools.combinations(region, 2):
            final_list.append(str(i[0])+"x"+str(i[1]))
    for comp in final_list:
        out.write(comp+"\n")


#w_m()
#w_i()
#w_w()
#b_m_r()
#b_m_i()
#b_i_g()
#b_m_w()
#sample_list()
#missing_within()
#redo_9550()
#between_relict_iberians()
#within_worldwide()
#within_iberia_no_rel()
#cvi_can()
#within_cen_asia()
#within_w_europe()
#cen_europe()
#n_sweden()
#s_sweden()
#ibc()
#germany()
#qar()
#etna()
#caucasus_all()
#ib_rel()
w_sah()
w_tanzh()
