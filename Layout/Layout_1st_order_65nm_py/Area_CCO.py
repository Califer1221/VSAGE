import numpy as np
import matplotlib.pyplot as plt

# Input parameters
N = 1
S = 1
H = 1

# Scale factor
factor = 0.7

# CCO size and load libraries
CCO_size_lib = ["CCO82", "CCO124", "CCO164", "CCO206", "CCO248"]
CCO_size_lib_size = [3.2, 4.8, 5.8, 7.2, 8.8]

CCO_load_lib = ["DCAP0", "DCAP1", "DCAP4", "DCAP8", "DCAP16", "DCAP32", "DCAP64"]
CCO_load_lib_size = [0, 0.6, 0.8, 1.6, 3.2, 6.4, 12.8]

# Calculate areas
area_CCO = np.zeros((len(CCO_size_lib_size), len(CCO_load_lib_size)))
area_CCO_act = np.zeros_like(area_CCO)

for CCO_size in range(len(CCO_size_lib_size)):
    for CCO_load in range(len(CCO_load_lib_size)):
        area_CCO[CCO_size, CCO_load] = (CCO_size_lib_size[CCO_size] + CCO_load_lib_size[CCO_load]) * 2 * N * S * H
        area_CCO_act[CCO_size, CCO_load] = area_CCO[CCO_size, CCO_load] / factor

# Plotting
plt.figure(figsize=(10, 6))
bar_width = 0.15
index = np.arange(len(CCO_size_lib))

for i in range(len(CCO_load_lib)):
    plt.bar(index + i*bar_width, area_CCO[:, i], bar_width, label=CCO_load_lib[i])

plt.title('Area estimation of CCO unit for different size and load', fontname='Times New Roman', fontweight='bold', fontsize=11)
plt.xlabel('Sizes of CCO', fontname='Times New Roman', fontweight='bold', fontsize=11)
plt.ylabel('Area estimation for CCO unit / um^2', fontname='Times New Roman', fontweight='bold', fontsize=11)
plt.xticks(index + bar_width * (len(CCO_load_lib) - 1) / 2, CCO_size_lib, fontname='Times New Roman', fontweight='bold', fontsize=11)
plt.legend(fontsize=8, prop={'family': 'Times New Roman', 'weight': 'bold'})

plt.tight_layout()
plt.show()

