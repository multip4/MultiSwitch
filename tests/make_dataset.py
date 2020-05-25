import random
import scipy.stats as ss
import numpy as np

d_min = 1; d_max = 5000; d_avg = (d_min + d_max) / 2
num_of_data = 5000
zipf = 0.99 # zipf parameter

dist = input('[u]niform or [g]aussian or [z]ipf? : ')

n = []
if dist == 'u':
  for i in range(0, num_of_data):
    n.append(random.randint(d_min, d_max))

elif dist == 'g': 
  x = np.arange(d_min, d_max + 1) # np.arange(min, max)
  xU, xL = x + 0.5, x - 0.5 
  prob = ss.norm.cdf(xU, scale = 500, loc = d_avg) - ss.norm.cdf(xL, scale = 500, loc = d_avg)
  prob = prob / prob.sum() # normalize the probabilities so their sum is 1
  n = np.random.choice(x, size = num_of_data, p = prob)

elif dist == 'z':
  dist = 'z' + str(zipf)
  zeta = [0.0]
  for i in range(1, d_max + 1):
      zeta.append(zeta[i - 1] + 1 / pow(i, zipf))
  n = [0] * (num_of_data + 1)
  k = 1
  for i in range(1, num_of_data + 1):
      if (i > num_of_data * zeta[k] / zeta[d_max]):
          k = k + 1
      n[i] = k
  del n[0]
  random.shuffle(n)
  
with open(dist + '_dist_' + str(int(num_of_data / 10)), 'w') as f:
  for i in range(0, num_of_data):
    num = "%04X" % n[i]
    f.write(num + '\n')
