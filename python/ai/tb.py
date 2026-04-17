import warnings
import numpy as np
import pandas as pd
import tensorflow as tf

from matplotlib import pyplot as plt

from sklearn.datasets        import load_iris, make_moons
from sklearn.preprocessing   import MinMaxScaler
from sklearn.model_selection import train_test_split
from sklearn.linear_model    import LinearRegression, LogisticRegression
from sklearn.metrics         import mean_squared_error, accuracy_score, confusion_matrix, precision_score, recall_score, f1_score, classification_report
from sklearn.tree            import DecisionTreeClassifier, plot_tree
from sklearn.neighbors       import KNeighborsClassifier
from sklearn.naive_bayes     import BernoulliNB

from keras.datasets import mnist
from keras.models   import Sequential
from keras.layers   import Dense, Flatten

warnings.filterwarnings("ignore")
plt.style.use("ggplot")
print("=== 1")

print(np.zeros((10)))
print(np.ones((10)))
print(np.full((12), 7))
print(np.arange(15, 46))

print("=== 2")

ff = np.random.randint(1, 21, size=(4,4))
print(ff.shape)
print(ff.dtype)
print(str(ff.ndim)+"D")
print(ff.size)
print("=== 3")

M = np.arange(1,26).reshape((5,5))
print(M[2][3])
print(M[1])
print(M[0:3, 2:5])
print(M[0:5, 4:5])
M[2][2] = 0
print(M)

print("=== 4")

print(M[M > 15])

print("=== 5")

print(np.arange(10)[-1])
print("=== 6")

usd = np.array([10,25,50,5,100])
print(usd)
print(usd * 83)

print("=== 7")

a = np.random.randint(1,21, size=(10))
b = np.random.randint(1,21, size=(10))
print(a)
print(b)
print(a + b)
print(a * b)
print(a ** 2)

print("=== 8")

print(np.zeros((3,3)) + [1,2,3])
print("=== 9")

score = np.random.randint(0,101, size=(50))

print(score)
print(score.mean())
print(np.median(score))
print(score.std())

print("=== 10")

print(score.max())
print(score.argmax())
data = {
    'Student_ID': [1001, 1002, 1003, 1004, 1005, 1006, 1007, 1008],
    'Name': ['Raj', 'Simran', 'Kiran', 'Rahul', 'Pooja', 'Vikram', 'Anjali', 'Rohan'],
    'Gender': ['M', 'F', 'F', 'M', 'F', 'M', 'F', 'M'],
    'Department': ['CS', 'IT', 'CS', 'EC', 'CS', 'IT', 'EC', 'CS'],
    'Marks': [85, 92, np.nan, 78, 88, 56, 95, np.nan],
    'Attendance_Percentage': [90, 85, 88, 75, 92, 60, 95, 80]
}

print("=== 1")

df = pd.DataFrame(data)
display(df)
df.set_index('Student_ID', inplace=True)

print("=== 2")

display(df.head(3))
display(df.tail(2))
display(df.shape)
display(df.dtypes)
print("=== 3")

display(df[["Name", "Department", "Marks"]])

print("=== 4")

display(df.loc[[1005]])
display(df.iloc[[4,5,6]])

print("=== 5")

display(df.loc[df.Department == "CS"])
display(df.loc[df.Attendance_Percentage > 80])
print("=== 6")

display(df.describe())

print("=== 7")

display(df.loc[[df.Marks.idxmax()]])

display(df.Department.value_counts())

print("=== 8")

display(df.groupby('Department').Attendance_Percentage.mean())
print("=== 9")

display(df[df.Marks.isna()])
display(sum(df.Marks.isna()))

print("=== 10")

df2 = df.fillna(df.Marks.mean())
display(df2)
display(sum(df2.Marks.isna()))
print("=== 1")

x = np.arange(11)
plt.plot(x, 2*x + 5)
plt.title("Linear Relationship")
plt.xlabel("Input Value")
plt.ylabel("Output Value")
plt.show()

print("=== 2")

x = np.linspace(0, 4*np.pi)
plt.plot(x, np.sin(x), "r--")
plt.title("Sine Wave")
plt.xlabel("Input Value")
plt.ylabel("Output Value")
plt.show()
print("=== 3")

plt.bar(['amit','bina', 'chintu', 'david', 'esha'], [85,92,78,88,56], color='green')
plt.title("Class Test Results")
plt.show()

print("=== 4")

plt.hist(np.random.randn(1000), bins=30, color='purple', edgecolor='black')
plt.show()
print('=== 5')

plt.scatter(
    np.random.randint(100, size=50),
    np.random.randint(100, size=50),
    color='blue', marker='x')
plt.show()

print('=== 6')

fig, ax = plt.subplots(2,2)
fig.suptitle('Subplots')
ax[0,0].plot(np.linspace(-10,10), np.linspace(-10,10)**2)
ax[0,1].scatter(np.random.randint(100, size=50), np.random.randint(100, size=50))
ax[1,0].bar(['a', 'b', 'c'], np.random.randint(100, size=3))
ax[1,1].set(title="future work")
plt.show()
print("=== 1")

xtr, xts, ytr, yts = train_test_split(
    np.random.randn(100, 5),
    np.random.randn(100),
    test_size=0.8, random_state=42)
print(xtr.shape, xts.shape)

print('=== 2')

x = [[10, 2000], [5, 1500], [20, 3000]]
scaler = MinMaxScaler()
scaler.fit(x)
print(scaler.transform(x))
print('=== 3')

model = LinearRegression()
model.fit([[1], [2], [3], [4], [5]], [10, 20, 30, 40, 50])
print(model.predict([[6]]))
print(model.coef_, model.intercept_)

print('=== 4')

print(mean_squared_error([3, -0.5, 2, 7], [2.5, 0.0, 2, 8]))
print('=== 5')

model = LogisticRegression()
model.fit([[1.2], [2.4], [1.8], [4.5], [5.1], [6.3]], [0,0,0,1,1,1])
print(model.predict([[3.5]]))
print(model.predict_proba([[3.5]]))

print('=== 6')

yts = [0,1,0,0,1,1]
ypr = [0,1,0,1,1,0]

display(accuracy_score(yts, ypr))
display(confusion_matrix(yts, ypr))
print("=== 1")

a = tf.constant([[1,2], [3,4]])
b = tf.Variable([[1,2], [3,4]])
# a[0,0] = 10
print(b[0, 0].assign(10))

print("=== 2")

a = tf.random.normal((2,2))
b = tf.random.normal((2,2))

print(a + b)
print(tf.matmul(a,b))
print(a ** 2)
print("=== 3")

model = Sequential([
    Dense(units=16, activation='relu', input_shape=(5,)),
    Dense(units=8, activation='relu'),
    Dense(units=1, activation='linear')
])
model.summary()

print("=== 4")

model.compile(optimizer='adam', loss='mean_squared_error')
print("=== 5")

x = np.random.random((100,5))
y = np.random.random((100,1))

history = model.fit(x, y, epochs=10, batch_size=32)
print("=== 6")

plt.plot(history.history['loss'])
plt.show()

print(model.predict(np.random.random((1, 5))))
print("=== 7")

(xtr, ytr), (xts, yts) = mnist.load_data()
xtr, ytr, xts, yts =  xtr/255, ytr/255, xts/255, yts/255

model = Sequential([
    Flatten(input_shape=(28, 28)),
    Dense(128, activation='relu'),
    Dense(10, activation='softmax')
])

model.summary()
model.compile(loss='sparse_categorical_crossentropy')
!curl -o data.csv https://archive.ics.uci.edu/static/public/12/data.csv
df = pd.read_csv('data.csv')
df.head()

X = df.iloc[:, 1:5].values
Y = df.iloc[:, 0].values

xtr, xts, ytr, yts = train_test_split(X, Y, test_size=0.3, random_state=100)

clf_gini = DecisionTreeClassifier(criterion="gini", random_state=100, max_depth=3, min_samples_leaf=5)
clf_gini.fit(xtr, ytr)

clf_entropy = DecisionTreeClassifier(criterion="entropy", random_state=100, max_depth=3, min_samples_leaf=5)
clf_entropy.fit(xtr, ytr)
def evaluate_model(clf_object, xts, yts, criterion_name):
    print(f"\n----- Evaluation for {criterion_name} -----")
    ypred = clf_object.predict(xts)
    print("confusion matrix: \n", confusion_matrix(yts, ypred))
    print("accuracy: \n", accuracy_score(yts, ypred) * 100)
    print("classification: \n", classification_report(yts, ypred))
evaluate_model(clf_gini, xts, yts, "Gini Index")
evaluate_model(clf_entropy, xts, yts, "Entropy")

feature_names = ["Left-Weight", "Left-Dist", "Right-Weight", "Right-Dist"]
class_names = ["L", "B", "R"]
for clf in [clf_gini, clf_entropy]:
    print(str(clf))
    plt.figure(figsize=(12, 8))
    plot_tree(clf, filled=True, feature_names=feature_names, class_names=class_names, rounded=True)
    # plt.title(title)
    plt.show()
X, y = make_moons(n_samples=300)
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3)

model = KNeighborsClassifier(n_neighbors=5)
model.fit(X_train, y_train)
y_pred = model.predict(X_test)

print(f"Accuracy: {accuracy_score(y_test, y_pred):.2f}")
# !test -e golf_data.csv || curl -LO https://github.com/NightFuryAnalytics/naive-bayes-walkthrough/raw/refs/heads/main/golf_data.csv

golf_data = pd.read_csv("golf_data.csv")
X = pd.get_dummies(golf_data.iloc[:,:-1], drop_first=True).astype("int")
y = golf_data['Play']

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)

model = BernoulliNB()
model.fit(X_train, y_train)
y_pred= model.predict(X_test)

print(
    f"\
Accuracy : {accuracy_score(y_test, y_pred):.3f}\n\
Precision: {precision_score(y_test, y_pred, average='weighted', zero_division=0):.3f}\n\
Recall   : {recall_score(y_test, y_pred, average='weighted', zero_division=0):.3f}\n\
F1 Score : {f1_score(y_test, y_pred, average='weighted', zero_division=0):.3f}"
)

print("Confusion Matrix:\n", confusion_matrix(y_test, y_pred_nb))
