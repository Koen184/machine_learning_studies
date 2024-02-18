import numpy as np
import matplotlib.pyplot as plt
from sklearn.mixture import GaussianMixture

# Przekształcenie danych MATLAB na Python
# Zgodnie ze skryptem MATLAB, generujemy losowy zbiór danych
# X1 = np.random.rand(300, 2) * 10
# X2 = X1 + np.array([100, 100])
# X = np.vstack((X1, X2))

# x1 = np.random.rand(300, 2) * 1
# x2 = x1 + np.sin(x1) * np.cos(x1) * 100
# X = np.vstack((x1, x2))

x_0 = 0
y_0 = 0
X = []

for alpha in np.arange(0, 2*np.pi, 0.01):
    r = np.random.rand() * 5 + 50

    x = x_0 + (r * np.cos(alpha))
    y = y_0 + (r * np.sin(alpha))

    r1 = np.random.rand() * 10 + 150

    x1 = x_0 + (r1 * np.cos(alpha))
    y1 = y_0 + (r1 * np.sin(alpha))

    X.append([x, y])
    X.append([x1, y1])

X = np.array(X)

# Wyplotowanie danych przed klasteryzacją
plt.figure(figsize=(10, 5))
plt.subplot(1, 2, 1)
plt.scatter(X[:, 0], X[:, 1], s=3)
plt.title('Dane przed klasteryzacją')
plt.xlabel('Oś X')
plt.ylabel('Oś Y')
plt.grid(True)

# Algorytm EM
gmm = GaussianMixture(n_components=4, random_state=0).fit(X)

# Klasyfikacja danych
labels = gmm.predict(X)

# Wyplotowanie danych po klasteryzacji
plt.subplot(1, 2, 2)
plt.scatter(X[:, 0], X[:, 1], c=labels, s=3, cmap='viridis')
plt.title('Dane po klasteryzacji (EM)')
plt.xlabel('Oś X')
plt.ylabel('Oś Y')
plt.grid(True)

plt.tight_layout()
plt.show()
