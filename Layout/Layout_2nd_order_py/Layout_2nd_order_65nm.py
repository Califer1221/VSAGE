import matplotlib.pyplot as plt
import numpy as np

# Define constants and dimensions
gap = 9  # gap must be a multiple of 1.8
power_ring = 30

# Calculate total dimensions
x_tot = 2 * max(CCO[1], CCO2[1], LaQ[1], Rin[0]) + gap + 2*gap + 2*DAC1[1] + 2*gap
y_tot = max(DAC1[0] + 2*gap + DACBUF1[0] + gap, 
            gap + LaQ[0] + gap + CCO2[0] + gap + SW[0] + gap + PFD[0] + gap + CCO[0] + gap + Rin[0] + gap)

Top_area = x_tot * y_tot
print(f'Top Area: {Top_area:.4f} with Width: {x_tot:.4f}; Height: {y_tot:.4f}')

# Calculate component positions
Cor_DAC1 = np.array([gap, 2*gap + DACBUF1[0]])
Cor_DAC2 = np.array([x_tot - DAC1[1] - gap, 2*gap + DACBUF1[0]])
Cor_DACBUF1 = np.array([gap, gap])
Cor_DACBUF2 = np.array([x_tot - DACBUF1[1] - gap, gap])
Cor_LaQ_lef = np.array([x_tot/2 - LaQ[1] - gap/2, gap])
Cor_LaQ_rig = np.array([x_tot/2 + gap/2, gap])
Cor_CCO2 = np.array([x_tot/2 - CCO2[1] - gap/2, gap + LaQ[0] + gap])
Cor_CCO3 = np.array([x_tot/2 + gap/2, gap + LaQ[0] + gap])
Cor_SW = np.array([x_tot/2 - SW[1]/2, gap + LaQ[0] + gap + CCO2[0] + gap])
Cor_PFD = np.array([x_tot/2 - PFD[1]/2, gap + LaQ[0] + gap + CCO2[0] + gap + SW[0] + gap])
Cor_CCO1_lef = np.array([x_tot/2 - CCO[1] - gap/2, gap + LaQ[0] + gap + CCO2[0] + gap + SW[0] + gap + PFD[0] + gap])
Cor_CCO1_rig = np.array([x_tot/2 + gap/2, gap + LaQ[0] + gap + CCO2[0] + gap + SW[0] + gap + PFD[0] + gap])
Cor_Rin_lef = np.array([x_tot/2 - Rin[0] - gap/2, gap + LaQ[0] + gap + CCO2[0] + gap + SW[0] + gap + PFD[0] + gap + CCO[0] + gap])
Cor_Rin_rig = np.array([x_tot/2 + gap/2, gap + LaQ[0] + gap + CCO2[0] + gap + SW[0] + gap + PFD[0] + gap + CCO[0] + gap])

# Plot the layout
plt.figure(figsize=(12, 12))
plt.grid(True)
drift = np.array([power_ring, power_ring])

def plot_component(corner, size, label=''):
    corner_d = corner + drift
    plt.gca().add_patch(plt.Rectangle(corner_d, size[1], size[0], fill=False))
    if label:
        plt.text(corner_d[0] + size[1]/2, corner_d[1] + size[0]/2, label, 
                 ha='center', va='center')

plot_component(Cor_DAC1, DAC1, 'DAC1')
plot_component(Cor_DAC2, DAC2, 'DAC2')
plot_component(Cor_DACBUF1, DACBUF1, 'DACBUF1')
plot_component(Cor_DACBUF2, DACBUF2, 'DACBUF2')
plot_component(Cor_LaQ_lef, LaQ, 'LaQ')
plot_component(Cor_LaQ_rig, LaQ, 'LaQ')
plot_component(Cor_CCO2, CCO2, 'CCO2')
plot_component(Cor_CCO3, CCO3, 'CCO3')
plot_component(Cor_SW, SW, 'SW')
plot_component(Cor_PFD, PFD, 'PFD')
plot_component(Cor_CCO1_lef, CCO, 'CCO1')
plot_component(Cor_CCO1_rig, CCO, 'CCO1')
plot_component(Cor_Rin_lef, Rin, 'Rin')
plot_component(Cor_Rin_rig, Rin, 'Rin')

plt.gca().add_patch(plt.Rectangle(drift, x_tot, y_tot, fill=False))

plt.xlim(0, x_tot + power_ring + 50)
plt.ylim(0, y_tot + power_ring + 50)

plt.title('Chip Layout')
plt.xlabel('Width')
plt.ylabel('Height')
plt.gca().set_aspect('equal', adjustable='box')
plt.show()

