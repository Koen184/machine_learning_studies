import numpy as np
import matplotlib.pyplot as plt
from sklearn.cluster import OPTICS

# Przekształcenie danych MATLAB na Python
# Zgodnie ze skryptem MATLAB, generujemy losowy zbiór danych
x1 = np.random.rand(300, 2) * 1
x2 = x1 + np.sin(x1) * np.cos(x1) * 100
X = np.vstack((x1, x2))


# Wyplotowanie danych przed klasteryzacją
plt.figure(figsize=(10, 5))
plt.subplot(1, 2, 1)
plt.scatter(X[:, 0], X[:, 1], s=3)
plt.title('Dane przed klasteryzacją')
plt.xlabel('Oś X')
plt.ylabel('Oś Y')
plt.grid(True)

# Algorytm OPTICS
optics_model = OPTICS(min_samples=50, xi=.05, min_cluster_size=.05)
optics_model.fit(X)


# Wyplotowanie danych po klasteryzacji
plt.subplot(1, 2, 2)
plt.scatter(X[:, 0], X[:, 1], c=optics_model.labels_, s=3, cmap='viridis')
plt.title('Dane po klasteryzacji (EM)')
plt.xlabel('Oś X')
plt.ylabel('Oś Y')
plt.grid(True)

plt.tight_layout()
plt.show()
