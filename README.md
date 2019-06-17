# vectorQuantization

Machine learning. An implementation of normalizing variable-length data. The data set used was the UC Irvine Accleromter dataset. I wanted to classify an activity based on its acceleromter data. So to train the computer, I had to give the computer vectors representing each activity, where each vector was supposed to be the same length. But the data in the dataset was not of the same length. So this code normalizes the length for each vector corresponding to each activity. Then a classifier is used to train the computer. This assignment is based off of a course offered at the University of Illinois, AML 498. The assignment can be found at https://courses.engr.illinois.edu/cs498aml/sp2019/homeworks/homework5.html

# Problems
Obtain the actitivities of daily life dataset from the UC Irvine machine learning website (https://archive.ics.uci.edu/ml/datasets/Dataset+for+ADL+Recognition+with+Wrist-worn+Accelerometer, data provided by Barbara Bruno, Fulvio Mastrogiovanni and Antonio Sgorbissa). Ignore the directories with MODEL in the name. They are duplicates.

(a) Build a classifier that classifies sequences into one of the 14 activities provided and evaluate its performance using average accuracy over 3 fold cross validation. To do the cross validation, divide the data for each class into 3 folds separately. Then, for a given run you will select 2 folds from each class for training and use the remaining fold from each class for test. To make features, you should vector quantize, then use a histogram of cluster center. This method is described in great detail in the book in section 9.3 which begins on page 166. You will find it helpful to use hierarchical k-means to vector quantize. You may perform the vector quantization for the entire dataset before doing cross validation.

You may use whatever multi-class classifier you wish, though we'd suggest you use a decision forest because it's easy to use and effective.

You should report (i) the average error rate over 3 fold cross validation and (ii) the class confusion matrix of your classifier for the fold with the lowest error, i.e. just one matrix for the 3 folds.

(b) Now see if you can improve your classifier by (i) modifying the number of cluster centers in your hierarchical k-means and (ii) modifying the size of the fixed length samples that you see.
