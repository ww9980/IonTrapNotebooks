import math
import time
start_time = time.time()

output = []
vertex = []
values = []
vertex.append(0)
vertex.append(0)
vertex.append(0)
vertex.append(0)
values.append(0)
values.append(0)
values.append(0)
values.append(0)
Zlimit=6.05e-1
#values = []
i=1
print('Made by ww9980, \n Runing')
fw=open('FEMs.txt','w+')
with open('FEMt.txt') as source:
	for line in source:
		if int(line[2:3]) > 4:
			continue;
		if line[2:4] == '10':
			continue;
		s = line.find('P_1')
		if s>=0:
			P1 = (line.split(' ')[0])+' '+(line.split(' ')[1])+' '+(line.split(' ')[2])
			P1 = P1[5:-1]
			continue
		s = line.find('P_2')
		if s>=0:
			P2 = (line.split(' ')[0])+' '+(line.split(' ')[1])+' '+(line.split(' ')[2])
			P2 = P2[5:-1]
			continue
		s = line.find('P_3')
		if s>=0:
			P3 = (line.split(' ')[0])+' '+(line.split(' ')[1])+' '+(line.split(' ')[2])
			P3 = P3[5:-1]
			continue
		s = line.find('P_4')
		if s>=0:
			P4 = (line.split(' ')[0])+' '+(line.split(' ')[1])+' '+(line.split(' ')[2])
			P4 = P4[5:-1]
			continue
		s = line.find('N_1')
		if s>=0:
			temp = line[5:]
			temp = temp[:-5]
			if float(P1.split(' ')[2]) - Zlimit <= 0:
				continue
			v1 = float(temp.split(' ')[0]) * float(temp.split(' ')[0])
			v1 = v1 + float(temp.split(' ')[1])*float(temp.split(' ')[1])
			v1 = v1 + float(temp.split(' ')[2])*float(temp.split(' ')[2])
			v1 = v1 + float(temp.split(' ')[3])*float(temp.split(' ')[3])
			v1 = v1 + float(temp.split(' ')[4])*float(temp.split(' ')[4])
			v1 = v1 + float(temp.split(' ')[5])*float(temp.split(' ')[5])
			v1 = math.sqrt(float(v1))
			fw.write('%s %s\n' % (P1, v1))

		s = line.find('N_2')
		if s>=0:
			temp = line[5:]
			temp = temp[:-5]
			if float(P2.split(' ')[2]) - Zlimit <= 0:
				continue
			v2 = float(temp.split(' ')[0]) * float(temp.split(' ')[0])
			v2 = v2 + float(temp.split(' ')[1])*float(temp.split(' ')[1])
			v2 = v2 + float(temp.split(' ')[2])*float(temp.split(' ')[2])
			v2 = v2 + float(temp.split(' ')[3])*float(temp.split(' ')[3])
			v2 = v2 + float(temp.split(' ')[4])*float(temp.split(' ')[4])
			v2 = v2 + float(temp.split(' ')[5])*float(temp.split(' ')[5])
			v2 = math.sqrt(float(v2))
			fw.write('%s %s \n' % (P2, v2) )

		s = line.find('N_3')
		if s>=0:
			temp = line[5:]
			temp = temp[:-5]
			if float(P3.split(' ')[2]) - Zlimit <= 0:
				continue
			v3 = float(temp.split(' ')[0]) * float(temp.split(' ')[0])
			v3 = v3 + float(temp.split(' ')[1])*float(temp.split(' ')[1])
			v3 = v3 + float(temp.split(' ')[2])*float(temp.split(' ')[2])
			v3 = v3 + float(temp.split(' ')[3])*float(temp.split(' ')[3])
			v3 = v3 + float(temp.split(' ')[4])*float(temp.split(' ')[4])
			v3 = v3 + float(temp.split(' ')[5])*float(temp.split(' ')[5])
			v3 = math.sqrt(float(v3))
			fw.write('%s %s \n' % (P3, v3) )

		s = line.find('N_4')
		if s>=0:
			temp = line[5:]
			temp = temp[:-5]
			if float(P4.split(' ')[2]) - Zlimit <= 0:
				continue
			v4 = float(temp.split(' ')[0]) * float(temp.split(' ')[0])
			v4 = v4 + float(temp.split(' ')[1])*float(temp.split(' ')[1])
			v4 = v4 + float(temp.split(' ')[2])*float(temp.split(' ')[2])
			v4 = v4 + float(temp.split(' ')[3])*float(temp.split(' ')[3])
			v4 = v4 + float(temp.split(' ')[4])*float(temp.split(' ')[4])
			v4 = v4 + float(temp.split(' ')[5])*float(temp.split(' ')[5])
			v4 = math.sqrt(float(v4))
			fw.write('%s %s \n' % (P4, v4))
fw.close()
te = time.time() - start_time
print('Job used', time.time() - start_time, "s. ")
print('Done.')
