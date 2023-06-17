from sklearn.linear_model import LogisticRegression
from sklearn.feature_extraction.text import CountVectorizer

# Prepare DataFrame including text data & classification label
text_data = [...]  # text data
labels = [...]  # classification label

# Vectorize text data
vectorizer = CountVectorizer()
X = vectorizer.fit_transform(text_data)

# initialize logistic regression model
model = LogisticRegression()
model.fit(X, labels)

# check coefficients of the features
feature_names = vectorizer.get_feature_names()
coefs = model.coef_[0]

for feature, coef in zip(feature_names, coefs):
    print(f"{feature}: {coef}")