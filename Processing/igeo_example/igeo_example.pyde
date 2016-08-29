add_library('igeo')
size(480,360,IG.GL)
#IG.open("example_surf1.3dm")

# for i in range(10):
#     for j in range(10):
#         for k in range(10):
#             IPoint(i*10, j*10, k*10).clr(i*0.1, j*0.1, k*0.1)

cpts1 = []

for i in range(10) : 
    cpts1.append([])
    for j in range(10) : 
        if (i+j)%2==0 :
            cpts1[i].append(IVec(i*5, -j*5-30, (i+j)*2))
        else : 
            cpts1[i].append(IVec(i*5, -j*5-30, (i+j-1)*2))
# mesh 1 (cyan)
IMesh(cpts1).clr(0,1.,1.)

divNum=30
cpts2 = []
for i in range(10) : 
    cpts2.append([])
    for j in range(divNum+1) :
        radius = 30 - i*3
        angle = 2 * PI / divNum * j
        cpts2[i].append(IVec(cos(angle)*radius, sin(angle)*radius, i*i*.5))
# mesh 2 (red)
IMesh(cpts2).clr(1.,0,0)
