"""
============================
Linear Discriminant Analysis
============================

A classification example using Linear Discriminant Analysis (LDA).

"""

import numpy as np

################################################################################
# import some data to play with

# The IRIS dataset
from scikits.learn import datasets
iris = datasets.load_iris()

# Some noisy data not correlated
E = np.random.normal(size=(len(iris.data), 35))

# Add the noisy data to the informative features
X = np.hstack((iris.data, E))
y = iris.target

################################################################################
# LDA
from scikits.learn.lda import LDA
lda = LDA()

y_pred = lda.fit(X, y).predict(X)

print "Number of mislabeled points : %d"%(y != y_pred).sum()
